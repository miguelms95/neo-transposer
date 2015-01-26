<?php

namespace NeoTransposer;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use \Silex\Application;

class NeoApp extends Application
{
	use \Silex\Application\TwigTrait;
	use \Silex\Application\TranslationTrait;

	protected $notifications = array('error'=>array(), 'success'=>array());

	public function __construct($config)
	{
		parent::__construct();

		$this['neoconfig'] = $config;

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
				$this['debug'] = true;
			}

			$app['twig']->addGlobal('neoglobals', array(
				'software_name' => $app['neoconfig']['software_name'],
				'analytics_id'  => $app['neoconfig']['analytics_id'],
				'books'			=> $app['books'],
				'user'			=> $app['session']->get('user'),
				'here'			=> $request->attributes->get('_route'),
				'debug'			=> $this['debug'],
			));

			//If debug=1, Twig enables strict variables. We disable it always.
			$this['twig']->disableStrictVariables();

			//If no locale has been specified in the URL, the Accept-Language header is taken.
			if (empty($request->attributes->get('_route_params')['_locale']))
			{
				$this['locale'] = $request->getPreferredLanguage(array_merge(
					array('en'), 
					array_keys($app['translator.domains']['messages'])
				));
			}
		});
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

		$this['session.storage.options'] = array('cookie_lifetime' => 60 * 60 * 24 * 31); //1 month.
		$this->register(new \Silex\Provider\SessionServiceProvider());

		$this->register(new \Silex\Provider\TranslationServiceProvider());
		$this['translator.domains'] = include $this['neoconfig']['translation_file'];
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
			$printer = "\NeoTransposer\ChordPrinter\ChordPrinter$printer";
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
	 * @param string $type 'error' or 'success'.
	 * @param string $text Text of the notification.
	 */
	function addNotification($type, $text)
	{
		if (false === array_search($type, array_keys($this->notifications)))
		{
			throw new \OutOfRangeException("Notification type $type not valid");
		}
		$this->notifications[$type][] = $text;
	}

	function render($view, array $parameters = array())
	{
		$this['twig']->addGlobal('notifications', $this->notifications);
		return $this['twig']->render($view, $parameters);
	}
}