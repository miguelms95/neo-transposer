<?php

namespace NeoTransposer\Controllers;

use Symfony\Component\HttpFoundation\Request;
use NeoTransposer\Controllers;
use \NeoTransposer\NeoApp;

class WizardEmpiric
{
	/**
	 * An instance of NotesCalculator
	 * @var \NeoTransposer\NotesCalculator
	 */
	protected $nc;

	public function __construct()
	{
		$this->nc = new \NeoTransposer\NotesCalculator;
	}

	public function lowest(Request $req, NeoApp $app)
	{
		if (!isset($app['neoconfig']['voice_wizard'][$app['locale']]['lowest']))
		{
			return $app->render('error.tpl', array(
				'error_title' => $app->trans('Sorry, the voice measure wizard is not available in ' . $app['neoconfig']['languages'][$app['locale']]['name'])
			));
		}

		if ('GET' == $req->getMethod())
		{
			$song_title = $app['db']->fetchColumn(
				'SELECT title FROM song WHERE id_song = ?',
				array($app['neoconfig']['voice_wizard'][$app['locale']]['lowest']['id_song'])
			);

			return $app->render('wizard_empiric_instructions.tpl', array(
				'song_title' => $song_title
			));
		}

		return $this->postLowest($req, $app);
	}

	public function postLowest(Request $req, NeoApp $app)
	{
		$action_no = $action_yes = null;

		//If first, time, shouldn't click NO
		if (empty($req->get('can_sing')))
		{
			$action_no = 'lowFirstTime';
		}

		//If yes, lower down 1 semitone and retry
		if ('yes' == $req->get('can_sing'))
		{
			$app['user']->lowest_note = $this->nc->transposeNote($app['user']->lowest_note, -1);
			$app['user']->highest_note = $this->nc->transposeNote($app['user']->highest_note, -1);
		}

		// If no, we recover the previous one and pass to the next step
		if ('no' == $req->get('can_sing'))
		{
			$app['user']->lowest_note = $this->nc->transposeNote($app['user']->lowest_note, +1);
			$app['user']->highest_note = $this->nc->transposeNote($app['user']->highest_note, +1);

			return $app->redirect($app['url_generator']->generate('wizard_empiric_highest'));
		}

		//If too low, next "yes" won't work as usual
		if ('C1' == $app['user']->lowest_note)
		{
			$action_yes = 'tooLow';
		}
		
		$tpl = $this->prepareSongForTest('lowest', $app);

		return $app->render('wizard_empiric_lowest.tpl', array_merge($tpl, array(
			'action_yes'	=> $action_yes,
			'action_no'		=> $action_no,
		)));
	}

	public function highest(Request $req, NeoApp $app)
	{
		$action_no = $action_yes = null;

		//If first, time, shouldn't click NO
		/*if (empty($req->get('can_sing')))
		{
			$action_no = 'lowFirstTime';
		}*/

		//If yes, lower down 1 semitone and retry
		if ('yes' == $req->get('can_sing'))
		{
			$nc = new \NeoTransposer\NotesCalculator;
			$app['user']->highest_note = $nc->transposeNote($app['user']->highest_note, +1);
		}

		// If no, we recover the last one and pass to the next step
		if ('no' == $req->get('can_sing'))
		{
			$app['user']->highest_note = $this->nc->transposeNote($app['user']->highest_note, -1);
			return $app->redirect($app['url_generator']->generate('wizard_finish'));
		}

		//If too low, next "yes" won't work as usual
		/*if ('C1' == $app['user']->lowest_note)
		{
			$action_yes = 'tooLow';
		}*/
		
		$tpl = $this->prepareSongForTest('highest', $app, true);

		return $app->render('wizard_empiric_highest.tpl', array_merge($tpl, array(
			'action_yes'	=> $action_yes,
			'action_no'		=> $action_no,
		)));
	}

	public function prepareSongForTest($wizard_config_song, NeoApp $app, $forceHighestNote=false)
	{
		$transposeController = new TransposeSong;

		$transData = $transposeController->getTranspositionData(
			$app['user'],
			$app['neoconfig']['voice_wizard'][$app['locale']][$wizard_config_song]['id_song'], 
			$app,
			$forceHighestNote
		);

		$transChords = $transData['transpositions'][0]->chordsForPrint;

		$placeholders = array();
		for ($i = 0; $i < count($transChords); $i++)
		{
			$placeholders[] = "%$i";
		}

		$transData['transpositions'][0]->setCapoForPrint($app);

		$song = str_replace(' ', '&nbsp;', $app['neoconfig']['voice_wizard'][$app['locale']][$wizard_config_song]['song_contents']);
		$song = str_replace($placeholders, $transChords, $song);
		$song = nl2br($song);

		$song_key = \NeoTransposer\NotesCalculator::getNotation(
			$transData['transpositions'][0]->chords[0], 
			$app['neoconfig']['languages'][$app['locale']]['notation']
		);

		return array(
			'song'			=> $song,
			'song_title'	=> $transData['song_details']['title'],
			'song_key'		=> $song_key,
			'song_capo'		=> $transData['transpositions'][0]->capoForPrint,
		);
	}

	public function finish(NeoApp $app)
	{
		$your_voice = $app['user']->getVoiceAsString(
			$app['translator'],
			$app['neoconfig']['languages'][$app['locale']]['notation']
		);

		foreach ($app['books'] as $book)
		{
			if ($book['locale'] == $app['locale'])
			{
				$go_to_book = $book['id_book'];
			}
		}

		return $app->render('wizard_finish.tpl', array(
			'your_voice'	=> $your_voice,
			'go_to_book'	=> $app['url_generator']->generate('book_' . $go_to_book)
		));
	}
}