<?php

namespace NeoTransposer\Controllers;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class Sitemap
{
	/**
	 * Generates a Sitemap with the URLs of the books and the transpose-songs
	 * 
	 * @param  \NeoTransposer\NeoApp $app The Silex app
	 * @return string                     The rendered view
	 */
	public function get(\NeoTransposer\NeoApp $app)
	{
		$urls = array();

		$time = '2015-01-12T00:00Z';

		$books = $app['books'];
		foreach ($books as $book)
		{
			$urls[] = array(
				'loc' => $app['url_generator']->generate('book', array('id_book' => $book['id_book']), UrlGeneratorInterface::ABSOLUTE_URL),
				'priority' => 1,
				'changefreq' => 'weekly',
				'lastmod' => $time
			);
		}

		$songs = $app['db']->fetchAll(
			'SELECT slug FROM song WHERE NOT id_song = 118 AND NOT id_song = 319'
		);

		foreach ($songs as $song)
		{
			$urls[] = array(
				'loc' => $app['url_generator']->generate('transpose_song', array('id_song' => $song['slug']), UrlGeneratorInterface::ABSOLUTE_URL),
				'priority' => '0.8',
				'changefreq' => 'monthly',
				'lastmod' => $time
			);
		}

		return $app->render('sitemap.tpl', array('urls'	=> $urls));
	}
}