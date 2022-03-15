<?php

namespace NeoTransposer\Controllers;

use \NeoTransposer\Model\TransposedSong;
use NeoTransposer\Model\TransposedSongFactory;
use \NeoTransposer\Persistence\UserPersistence;
use \Symfony\Component\HttpFoundation\Request;

class TransposeSongApi extends \NeoTransposer\AppAccess
{
	public function handleApiRequest(Request $req, $id_song)
	{
		if (empty($req->get('userToken')))
		{
			throw new \Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
		}

		$userPersistence = new UserPersistence($this->app['db']);

		if (!$user = $userPersistence->fetchUserFromField('id_user', $req->get('userToken')))
		{
			throw new \Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
		}

		$this->app['neouser'] = $user;

		if (empty($user->range->lowest))
		{
			throw new \Symfony\Component\HttpKernel\Exception\ConflictHttpException;
		}

        $transposedSongFactory = new TransposedSongFactory($this->app);
        $song = $transposedSongFactory->createTransposedSongFromSongId($id_song);

		$this->app['locale'] = $song->song->bookLocale;
		$this->app['translator']->setLocale($this->app['locale']);

		$song->transpose();

		$songArray = json_decode(json_encode($song), true);
		$transpositions = [];
		foreach ($song->transpositions as $transposition)
		{
			$transpositions[] = [
				'capo' => $transposition->getCapo(),
				'score' => $transposition->score,
				'chords' => $transposition->chords,
			];
		}

		$responseData = [
			'idSong' 			=> $song->song->idSong,
			'originalChords'	=> $song->song->originalChords,
			'transpositions'	=> $transpositions
		];

		return $this->app->json($responseData, 200);
	}
}