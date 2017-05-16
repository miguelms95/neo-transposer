<?php

namespace NeoTransposer\Controllers;

use Symfony\Component\HttpFoundation\Request;

/**
 * Controller for the / route, which has NO CONTENTS.
 */
class Index
{
	/**
	 * If logged in, redirect to the book. If not,
	 * redirect to login in the language of the browser (Accept-Language header).
	 * 
	 * @param  Request               $req The HTTP request.
	 * @param  \NeoTransposer\NeoApp $app The NeoApp.
	 * @return RedirectResponse      A redirection to the proper page.
	 */
	public function get(Request $req, \NeoTransposer\NeoApp $app)
	{
		$app->setLocaleAutodetect($req);

		if ($app['neouser']->id_book)
		{
			return $app->redirect($app->path(
				'book_' . $app['neouser']->id_book
			));
		}

		return $app->redirect($app->path(
			'login',
			['_locale' => $app['locale']]
		));
	}
}
