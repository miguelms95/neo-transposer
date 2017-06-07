<?php

namespace NeoTransposer;

use \Symfony\Component\HttpFoundation\Request;
use \Symfony\Component\HttpFoundation\Response;
use \Silex\Application;
use \NeoTransposer\Model\User;

/**
 * An extension of Silex Application with custom stuff.
 */
class NeoApp extends Application
{
	use \Silex\Application\TwigTrait;
	use \Silex\Application\TranslationTrait;
	use \Silex\Application\UrlGeneratorTrait;

	/**
	 * Swahili-speaking countries, for language detection based on IP.
	 * @var array
	 */
	protected $swahiliCountries = array('TZ', 'KE');

	protected $notifications = array('error'=>array(), 'success'=>array());

	/**
	 * Load config, register services in Silex and set before() filter.
	 * 
	 * @param string $config   Configuration array, loaded from config.php
	 * @param string $rootDir Local FS path to the app root (where composes.json is)
	 */
	public function __construct($config, $rootDir)
	{
		parent::__construct();

		$this['neoconfig'] = $config;
		$this['root_dir'] = $rootDir;

		$this->registerSilexServices($rootDir);
		$this->registerCustomServices();

		if (!empty($config['debug']))
		{
			$this['debug'] = $config['debug'];
		}

		/*
		 * Actions before every controller.
		 */
		$this['controllers']->before(function(Request $request, Application $app) {

			if ($request->query->get('debug'))
			{
				$app['debug'] = true;
			}

			$app['twig']->addGlobal('current_route', $request->attributes->get('_route'));

			$app['absoluteUriWithoutQuery'] = $request->getScheme()
				. '://'
				. $request->getHttpHost()
				. strtok($request->getRequestUri(), '?');

			$app['absoluteBasePath'] = $request->getScheme()
				. '://'
				. $request->getHttpHost()
				. $request->getBasePath();

			$app->rolloutPeopleCompatible();
		});
	}

	/**
	 * Sets the Locale for the application based on browser lang (except Swahili).
	 * 
	 * @param Request $request  The HTTP request.
	 */
	public function setLocaleAutodetect(Request $request)
	{
		$this['locale'] = $request->getPreferredLanguage(
			array_keys($this['neoconfig']['languages'])
		);

		$this->setLocaleForWaswahili($request->getClientIp());
	}

	/**
	 * Language detection from browser is not fitting for Swahili-speaking
	 * countries, where most of devices are in english. Here we perform Geo-IP
	 * through MaxMind's GeoIp2 library.
	 * 
	 * @param string $ip 		Client IP.
	 */
	protected function setLocaleForWaswahili($ip)
	{
		$reader = $this['geoIp2Reader'];
		try
		{
			$record = $reader->country($ip);
		}
		catch (\GeoIp2\Exception\AddressNotFoundException $e)
		{
			return;
		}

		if (false !== array_search($record->country->isoCode, $this->swahiliCountries))
		{
			$this['locale'] = 'sw';
		}
	}

	/**
	 * Register some Silex services used in the app.
	 * 
	 * @param string $rootDir Real FS path to app root, where the cache/ dir is.
	 * 
	 * @see composer.json, since some of these services require ext dependencies.
	 */
	protected function registerSilexServices($rootDir)
	{
		if (!$this['debug'])
		{
			$twigOptions = array('cache' => $rootDir . '/cache/twig');
		}

		$this->register(new \Silex\Provider\TwigServiceProvider(), array(
			'twig.path' => $this['neoconfig']['templates_dir'],
			'twig.options' => array_merge($twigOptions, array(
				'strict_variables' => false
			))
		));

		$this->register(new \Silex\Provider\DoctrineServiceProvider(), array(
			'db.options' => array(
				'driver'	=> 'pdo_mysql',
				'host'		=> $this['neoconfig']['db']['host'],
				'user'		=> $this['neoconfig']['db']['user'],
				'password'	=> $this['neoconfig']['db']['password'],
				'dbname'	=> $this['neoconfig']['db']['database'],
				'charset'	=> $this['neoconfig']['db']['charset']
			),
		));

		$this->register(new \Silex\Provider\SessionServiceProvider());
		$this->register(new \Silex\Provider\RoutingServiceProvider());
		
		$this->register(new \Silex\Provider\LocaleServiceProvider());
		$this->register(new \Silex\Provider\TranslationServiceProvider());
		$translations = array();
		foreach ($this['neoconfig']['languages'] as $locale=>$details)
		{
			if (isset($details['file']))
			{
				$translations['messages'][$locale] = include $details['file'];
			}
		}
		$this['translator.domains'] = $translations;
	}

	/**
	 * Services available for every controller.
	 */
	protected function registerCustomServices()
	{
		$this['books'] = function($app) {
			$books = $app['db']->fetchAll('SELECT * FROM book');
			$booksNice = array();
			foreach ($books as $book)
			{
				$booksNice[$book['id_book']] = $book;
			}
			return $booksNice;
		};

		$this['chord_printers.get'] = $this->protect(function($printer) {
			$printer = "\NeoTransposer\Model\ChordPrinter\ChordPrinter$printer";
			return new $printer();
		});

		$this['geoIp2Reader'] = function ($app) {
			$dbfile = $app['root_dir'] . '/' . $app['neoconfig']['mmdb'];
			return new \GeoIp2\Database\Reader($dbfile);
		};

		if (!$this['session']->get('user'))
		{
			$this['session']->set('user', new User());
		}

		$this['neouser'] = $this['session']->get('user');

		$this['new.AutomaticTransposer'] = $this->factory(function ($app) {
			return new \NeoTransposer\Model\AutomaticTransposer($app);
		});

		$this['new.Transposition'] = $this->factory(function ($app) {
			return new \NeoTransposer\Model\Transposition($app);
		});

		$this['new.PeopleCompatibleTransposition'] = $this->factory(function ($app) {
			return new \NeoTransposer\Model\PeopleCompatibleTransposition($app);
		});
	}

	/**
	 * Adds a notification that will be shown in the app's header (see base.tpl)
	 * 
	 * @param string $type 'error' or 'success'.
	 * @param string $text Text of the notification.
	 */
	public function addNotification($type, $text)
	{
		if (false === array_search($type, array_keys($this->notifications)))
		{
			throw new \OutOfRangeException("Notification type $type not valid");
		}
		$this->notifications[$type][] = $text;
	}

	/**
	 * Pre-processing of the template variables and render the template.
	 * 
	 * @param  string $view       Template name
	 * @param  array  $parameters Array variables.
	 * @return string             The rendered template.
	 */
	public function render($view, array $parameters = array(), $modifyTitle=true)
	{
		if ($modifyTitle)
		{
			$this->setPageTitle($parameters);
		}

		$this['twig']->addGlobal('notifications', $this->notifications);
		return $this['twig']->render($view, $parameters);
	}

	/**
	 * Set final page title adding a certain suffix if the title specified in 
	 * the controller is not too long.
	 * @param array &$parameters Template variables (should contain page_title)
	 */
	protected function setPageTitle(&$parameters)
	{
		//Defined by SEO rules
		$maxTitleLength = 55;

		$software = $this['neoconfig']['software_name'];
		$suffix = $this->trans($this['neoconfig']['seo_title_suffix']);

		if (isset($parameters['page_title']))
		{
			if (strlen($parameters['page_title']) < $maxTitleLength - strlen($suffix))
			{
				$parameters['page_title'] = $parameters['page_title'] . " · $suffix";
			}
		}
		else
		{
			$parameters['page_title'] = $software;
		}
	}

	protected function rolloutPeopleCompatible()
	{
		if (isset($this['neoconfig']['people_compatible_users'])
			&& !$this['neoconfig']['people_compatible'] 
			&& false !== array_search($this['neouser']->id_user, $this['neoconfig']['people_compatible_users']))
		{
			$neoconfig = $this['neoconfig'];
			$neoconfig['people_compatible'] = true;
			$this['neoconfig'] = $neoconfig;
		}
	}
}
