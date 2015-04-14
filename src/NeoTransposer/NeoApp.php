<?php

namespace NeoTransposer;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use \Silex\Application;
use \NeoTransposer\Model\User;

class NeoApp extends Application
{
	use \Silex\Application\TwigTrait;
	use \Silex\Application\TranslationTrait;

	/**
	 * Swahili-speaking countries, for language detection based on IP.
	 * @var array
	 */
	protected $swahili_countries = array('TZ', 'KE');

	protected $cookie_lifetime = 2678400; //1 month

	protected $notifications = array('error'=>array(), 'success'=>array());

	/**
	 * Load config, register services in Silex and set before() filter.
	 * @param [type] $config   [description]
	 * @param [type] $root_dir [description]
	 */
	public function __construct($config, $root_dir)
	{
		parent::__construct();

		$this['neoconfig'] = $config;
		$this['root_dir'] = $root_dir;

		$this->registerSilexServices();
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

			//If debug=1, Twig enables strict variables. We disable it always.
			$app['twig']->disableStrictVariables();
		});

		$this->recordHit();
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
		// Sample TZ IP: 197.187.253.205
		$dbfile = $this['root_dir'] . '/' . $this['neoconfig']['mmdb'] . '.mmdb';
		
		$reader = new \GeoIp2\Database\Reader($dbfile);
		try
		{
			$record = $reader->country($ip);
		}
		catch (\GeoIp2\Exception\AddressNotFoundException $e)
		{
			return;
		}

		if (false !== array_search($record->country->isoCode, $this->swahili_countries))
		{
			$this['locale'] = 'sw';
		}
	}

	/**
	 * Register some Silex services used in the app.
	 * @see composer.json, since some of these services require ext dependencies.
	 */
	protected function registerSilexServices()
	{
		$this->register(new \Silex\Provider\TwigServiceProvider(), array(
			'twig.path' => $this['neoconfig']['templates_dir']
		));

		//Custom Twig filter for printing notes in different notations.
		//@todo Esto solo se usa una vez... es realmente necesario?
		$this['twig'] = $this->share($this->extend('twig', function($twig) {
			$twig->addFilter(new \Twig_SimpleFilter('notation', function ($str, $notation) {
				return \NeoTransposer\Model\NotesNotation::getNotation($str, $notation);
			}));
			return $twig;
		}));

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

		$this->register(new \Silex\Provider\UrlGeneratorServiceProvider());

		//A quick & dirty way to set persistent sessions...
		ini_set('session.gc_maxlifetime', $this->cookie_lifetime);
		$this['session.storage.options'] = array('cookie_lifetime' => $this->cookie_lifetime);
		$this->register(new \Silex\Provider\SessionServiceProvider());

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
		$this['books'] = $this->share(function($app) {
			$books = $app['db']->fetchAll('SELECT * FROM book');
			$books_nice = array();
			foreach ($books as $book)
			{
				$books_nice[$book['id_book']] = $book;
			}
			return $books_nice;
		});

		$this['chord_printers.get'] = $this->protect(function($printer) {
			$printer = "\NeoTransposer\Model\ChordPrinter\ChordPrinter$printer";
			return new $printer();
		});

		if (!$this['session']->get('user'))
		{
			$this['session']->set('user', new User());
		}

		$this['user'] = $this['session']->get('user');
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

		if ($this['debug'])
		{
			$parameters['load_social_buttons'] = false;
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
		$max_title_length = 55;

		$software = $this['neoconfig']['software_name'];
		$suffix = $this->trans($this['neoconfig']['seo_title_suffix']);

		if (isset($parameters['page_title']))
		{
			if (strlen($parameters['page_title']) < $max_title_length - strlen($suffix))
			{
				$parameters['page_title'] = $parameters['page_title'] . " · $suffix";
			}
		}
		else
		{
			$parameters['page_title'] = $software;
		}
	}

	protected function recordHit()
	{
		if ($this['user']->isLoggedIn())
		{
			$this['db']->insert('user_hit', array(
				'id_user' => $this['user']->id_user,
				'request_uri' => $_SERVER['REQUEST_URI'],
				'post_vars' => str_replace('[]', '', json_encode($_POST))
			));
		}
	}
}