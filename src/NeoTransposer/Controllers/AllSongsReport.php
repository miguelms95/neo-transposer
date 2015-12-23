<?php

namespace NeoTransposer\Controllers;

use Symfony\Component\HttpFoundation\Request;
use \Symfony\Component\HttpFoundation\Response;

/**
 * Transpose Song page: transposes the given song for the singer's voice range.
 */
class AllSongsReport
{
	/**
	 * HTML report. If dl query string arg is present, the page is offered to
	 * download, included the styles inside the HTML.
	 * 
	 * @param  \NeoTransposer\NeoApp $app The NeoApp
	 * @return string The rendered view (HTML).
	 */
	public function get(\NeoTransposer\NeoApp $app, Request $req)
	{
		$reportModel = new \NeoTransposer\Model\AllSongsReport($app);
		$allTranspositions = $reportModel->getAllTranspositions();

		$your_voice = $app['neouser']->getVoiceAsString(
			$app['translator'],
			$app['neoconfig']['languages'][$app['locale']]['notation']
		);

		$tplVars = array(
			'songs'			=> $allTranspositions,
			'your_voice'	=> $your_voice,
			'header_link' 	=> $app['url_generator']->generate('book_' . $allTranspositions[0]->song->idBook),
			'page_title'  	=> $app->trans('All transpositions for your voice'),
		);

		if ($req->get('dl'))
		{
			$tplVars['print_css_code'] = file_get_contents($app['root_dir'] . '/web/static/style.css')
			 . file_get_contents($app['root_dir'] . '/web/static/print.css');

			$tplVars['header_link'] = $app['absoluteBasePath'];
		}

		$responseBody = $app->render('all_songs_report.twig', $tplVars);

		if ($req->get('dl'))
		{
			$filename = $app->trans('Transpositions')
			 . '-' . str_replace('#', 'd', $app['neouser']->lowest_note . '-' . $app['neouser']->highest_note)
			 . '.html';

			return new Response($responseBody, 200, array(
		        'Cache-Control' 		=> 'private',
		        'Content-Type' 			=> 'application/stream',
		        'Content-Length' 		=> strlen($responseBody),
		        'Content-Disposition' 	=> 'attachment; filename=' . $filename,
			));
		}
		else
		{
			return $responseBody;
		}
	}
}