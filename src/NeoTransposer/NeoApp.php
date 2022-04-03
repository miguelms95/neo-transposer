<?php

namespace NeoTransposer;

use NeoTransposer\Model\User;
use Silex\Application;
use Symfony\Component\HttpFoundation\Request;

/**
 * An extension of Silex Application with custom stuff.
 */
class NeoApp extends Application
{
    use \Silex\Application\TwigTrait;
    use \Silex\Application\TranslationTrait;
    use \Silex\Application\UrlGeneratorTrait;

    protected $notifications = ['error' => [], 'success' => []];

    protected $hostname;

    /**
     * Load config, register services in Silex and set before() filter.
     *
     * @param array $config   Configuration array, loaded from config.php
     * @param string $rootDir Local FS path to the app root (where composes.json is)
     */
    public function __construct($config, $rootDir, $hostname = null)
    {
        parent::__construct();

        $this['neoconfig'] = $config;
        $this['root_dir'] = $rootDir;

        //Trick for non-web scripts (e.g. testAllTranspositions)
        $this->hostname = $hostname ?: $_SERVER['HTTP_HOST'];

        $this->registerSilexServices($rootDir);
        $this->registerCustomServices();
        $this->registerErrorHandler();

        if (!empty($config['debug'])) {
            $this['debug'] = $config['debug'];
        }

        /*
         * Actions before every controller.
         */
        $this['controllers']->before(function (Request $request, Application $app) {

            if ($request->query->get('debug')) {
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
        });
    }

    /**
     * Sets the Locale based on country (geoIP) and, as a fallback, on the
     * request header Accept-Language. Though Accept-Language works reasonably
     * well, the NCW is organized by country, and where a country speaks a
     * language, the catechumens sing in that language (with a few exceptions,
     * like USA). This is why geoip language detection works better.
     *
     * The way getPreferredLanguage() works is by 'expanding' the array with the
     * 'only language' values, e.g. [es_ES, en_US] => [es_ES, es, en_US, en],
     * but if the 'only language' values are already present, leave them where
     * they are. This way, in a request like [es_ES, en_GB, en, es] 'en' will be
     * selected, because es_ES is not found in $app['neoconfig']['languages']
     * (because in NeoApp locales are defined only by languages). Such a tricky
     * case though, has only occurred in my Chrome/LineageOS for reasons unknown.
     *
     * @param Request $request  The HTTP request.
     */
    public function setLocaleAutodetect(Request $request)
    {
        $this['locale'] = $request->getPreferredLanguage(
            array_keys($this['neoconfig']['languages'])
        );

        $this->setLocaleByCountry($request->getClientIp());
    }

    /**
     * Set app locale based on geo-IP-detected country (MaxMind's GeoIp2 lib)
     * using a language-country table.
     *
     * @param string $ip Client IP.
     */
    protected function setLocaleByCountry(string $ip)
    {
        $localesByCountry = [
            'sw' => ['TZ', 'KE'],
            'pt' => ['BR', 'PT', 'AO', 'CV', 'GW', 'MZ', 'ST', 'TL'],
            'es' => [
                'AR', 'BO', 'CL', 'CO', 'CR', 'DO', 'EC', 'SV', 'GT', 'HN', 'MX', 'NI', 'PA', 'PY', 'PE', 'PR', 'ES', 'UY', 'VE', 'CU', 'GQ'
            ],
            'it' => ['IT']
        ];

        $geoIpResolver = $this[\NeoTransposer\Domain\GeoIp\GeoIpResolver::class];

        try {
            $record = $geoIpResolver->resolve($ip);
        } catch (\NeoTransposer\Domain\GeoIp\GeoIpNotFoundException $e) {
            return;
        }

        foreach ($localesByCountry as $locale => $countries) {
            if (in_array($record->country()->isoCode(), $countries)) {
                $this['locale'] = $locale;
            }
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
        if (!$this['debug']) {
            $twigOptions = ['cache' => $rootDir . '/cache/twig'];
        }

        $this->register(new \Silex\Provider\TwigServiceProvider(), array(
            'twig.path' => $this['neoconfig']['templates_dir'],
            'twig.options' => array_merge($twigOptions, array(
                'strict_variables' => false
            ))
        ));

        $this->register(new \Silex\Provider\DoctrineServiceProvider(), array(
            'db.options' => array(
                'driver'    => 'pdo_mysql',
                'host'      => $this['neoconfig']['db']['host'],
                'user'      => $this['neoconfig']['db']['user'],
                'password'  => $this['neoconfig']['db']['password'],
                'dbname'    => $this['neoconfig']['db']['database'],
                'charset'   => $this['neoconfig']['db']['charset']
            ),
        ));

        //Must be called before session_start()
        session_set_cookie_params(
            2592000,                        //Lifetime: 1 month
            '/; samesite=Lax',              //Path + samesite (see <https://www.php.net/manual/es/function.session-set-cookie-params.php#125072>)
            $this->hostname,                //Domain
            !$this['neoconfig']['debug'],   //Secure
            true                            //httponly
        );

        $this->register(new \Silex\Provider\SessionServiceProvider());
        $this->register(new \Silex\Provider\RoutingServiceProvider());

        $this->register(new \Silex\Provider\LocaleServiceProvider());
        $this->register(new \Silex\Provider\TranslationServiceProvider());
        $translations = [];
        foreach ($this['neoconfig']['languages'] as $locale => $details) {
            if (isset($details['file'])) {
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
        $this['books'] = function ($app) {
            $books = $app['db']->fetchAll('SELECT * FROM book ORDER BY id_book DESC');
            $booksNice = [];
            foreach ($books as $book) {
                $booksNice[$book['id_book']] = $book;
            }
            return $booksNice;
        };

        $this['chord_printers.get'] = $this->protect(function ($printer) {
            $printer = "\NeoTransposer\Model\ChordPrinter\ChordPrinter$printer";
            return new $printer();
        });

        if (!$this['session']->get('user')) {
            $this['session']->set('user', new User());
        }

        $this['neouser'] = $this['session']->get('user');

        $this['new.AutomaticTransposer'] = $this->factory(function ($app) {
            return new \NeoTransposer\Model\AutomaticTransposer($app);
        });

        $this['new.Transposition'] = $this->factory(function ($app) {
            return new \NeoTransposer\Model\Transposition($app);
        });

        $this->registerHexagonalServices();
    }

    protected function registerHexagonalServices()
    {
        //Port
        $this[Domain\Repository\SongRepository::class] = $this->factory(function ($app)
        {
            //Adapter
            return new Infrastructure\SongRepositoryMysql($app['db']);
        });

        $this[Domain\Repository\UserRepository::class] = $this->factory(function ($app)
        {
            return new Infrastructure\UserRepositoryMysql(
                $app['db'],
                $app[Domain\Repository\UserPerformanceRepository::class]
            );
        });

        $this[Domain\Repository\UserPerformanceRepository::class] = $this->factory(function ($app)
        {
            return new Infrastructure\UserPerformanceRepositoryMysql($app['db']);
        });

        //A domain service depending on other domain services
        $this[Domain\SongsLister::class] = $this->factory(function ($app)
        {
            return new Domain\SongsLister(
                $app[Domain\Repository\SongRepository::class],
                $app[Domain\Repository\UserRepository::class],
                $app['books']
            );
        });

        //An application service (use case) depending on a domain service
        $this[\NeoTransposer\Application\ListSongsWithUserFeedback::class] = $this->factory(function ($app)
        {
            return new \NeoTransposer\Application\ListSongsWithUserFeedback(
                $app[Domain\SongsLister::class]
            );
        });

        //Why factory? One single instance is enough for us
        $this[Domain\GeoIp\GeoIpResolver::class] = function($app)
        {
            return new \NeoTransposer\Infrastructure\GeoIpResolverGeoIp2(
                new \GeoIp2\Database\Reader($app['root_dir'] . '/' . $app['neoconfig']['mmdb'])
            );
        };

        $this[Domain\Repository\AdminMetricsRepository::class] = function($app)
        {
            return new \NeoTransposer\Infrastructure\AdminMetricsRepositoryMysql($app['db']);
        };

        $this[\NeoTransposer\Application\ReadAdminMetrics::class] = function($app)
        {
            return new \NeoTransposer\Application\ReadAdminMetrics(
                new \NeoTransposer\Domain\AdminMetricsReader(
                    $app[\NeoTransposer\Domain\Repository\AdminMetricsRepository::class],
                    $app['books'],
                    $app[\NeoTransposer\Domain\GeoIp\GeoIpResolver::class]
                )
            );
        };

        $this[Domain\AdminTasks\PopulateUsersCountry::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\PopulateUsersCountry($app[\NeoTransposer\Domain\Repository\UserRepository::class], $app[\NeoTransposer\Domain\GeoIp\GeoIpResolver::class]);
        };

        $this[Domain\AdminTasks\CheckSongsRangeConsistency::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\CheckSongsRangeConsistency($app[\NeoTransposer\Domain\Repository\SongRepository::class]);
        };

        $this[Domain\AdminTasks\CheckUsersRangeConsistency::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\CheckUsersRangeConsistency($app[\NeoTransposer\Domain\Repository\UserRepository::class]);
        };

        $this[Domain\AdminTasks\RefreshCompiledCss::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\RefreshCompiledCss($app);
        };

        $this[Domain\AdminTasks\RemoveOldCompiledCss::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\RemoveOldCompiledCss($app);
        };

        $this[Domain\AdminTasks\CheckChordsOrder::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\CheckChordsOrder($app[Domain\Repository\SongChordRepository::class]);
        };

        $this[Domain\AdminTasks\TestAllTranspositions::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\TestAllTranspositions($app);
        };

        $this[Domain\AdminTasks\GetVoiceRangeOfGoodUsers::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\GetVoiceRangeOfGoodUsers($app['db']);
        };

        $this[Domain\AdminTasks\CheckOrphanChords::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\CheckOrphanChords($app[Domain\Repository\SongChordRepository::class]);
        };

        $this[Domain\AdminTasks\GetPerformanceByNumberOfFeedbacks::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\GetPerformanceByNumberOfFeedbacks($app['db']);
        };

        $this[Domain\AdminTasks\CheckMissingTranslations::class] = function($app)
        {
            return new \NeoTransposer\Domain\AdminTasks\CheckMissingTranslations($app['neoconfig']['languages']);
        };

        $this[Domain\Repository\SongChordRepository::class] = function($app)
        {
            return new \NeoTransposer\Infrastructure\SongChordRepositoryMysql($app['db']);
        };

        $this[Domain\AllSongsReport::class] = function($app)
        {
            return new \NeoTransposer\Domain\AllSongsReport(
                $app[\NeoTransposer\Domain\Repository\SongRepository::class],
                $app[\NeoTransposer\Domain\Repository\SongChordRepository::class],
                $app
            );
        };

        $this[Domain\Repository\BookRepository::class] = function($app)
        {
            return new \NeoTransposer\Infrastructure\BookRepositoryMysql($app['db']);
        };
    }

    protected function registerErrorHandler()
    {
        //Silex default error pages are better for debugging.
        if ($this['neoconfig']['debug']) {
            return;
        }

        $this->error(function (\Exception $e, Request $request, $code) {

            $this->setLocaleAutodetect($request);

            //For unknown reasons, translator falls back to English. This needed.
            $this['translator']->setLocale($this['locale']);

            if (false !== array_search($code, [404, 500])) {
                return $this->render("error-$code.twig", array(
                    'error_code' => $code,
                ));
            }

            switch (intdiv($code, 100)) {
                case 4:
                    $title = $this->trans('Request error');
                    break;
                case 5:
                    $title = $this->trans('Server error');
                    break;
                default:
                    $title = $this->trans('Unknown error');
            }

            return $this->render('error.twig', array(
                'error_code'        => $code,
                'error_title'       => $title,
                'error_description' => $this->trans('Error %code%', ['%code%' => $code])
            ));
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
        if (false === array_search($type, array_keys($this->notifications))) {
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
    public function render($view, array $parameters = [], $modifyTitle = true)
    {
        if ($modifyTitle) {
            $this->setPageTitle($parameters);
        }

        $parameters['neoapp_css_file'] = $this['debug']
            ? 'style.css?nocache=' . time()
            : 'compiled-' . $this['neoconfig']['css_cache'] . '.css';

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

        if (isset($parameters['page_title'])) {
            if (strlen($parameters['page_title']) < $maxTitleLength - strlen($suffix)) {
                $parameters['page_title'] = $parameters['page_title'] . " · $suffix";
            }
        } else {
            $parameters['page_title'] = $software;
        }
    }
}
