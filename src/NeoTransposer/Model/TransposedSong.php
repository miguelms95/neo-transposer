<?php

namespace NeoTransposer\Model;

use \NeoTransposer\NeoApp;

class TransposedSong
{
	public $song_details;
	public $transpositions;
	public $not_equivalent;
	public $original_chords;

	/**
	 * @var NeoTransposer\NeoApp;
	 */
	protected $app;

	protected function __construct($song_details, NeoApp $app, $original_chords)
	{
		$this->song_details = $song_details;
		$this->app = $app;
		$this->original_chords = $original_chords;
	}

	/**
	 * Factory
	 * 
	 * @param  string|int            $id_song Song ID or slug.
	 * @param  \NeoTransposer\NeoApp $app     NeoApp instance.
	 * @return TransposedSong                 The created object.
	 */
	public static function create($id_song, NeoApp $app)
	{
		/** @todo ¿Pasar esto del slug al controller? Solo ahí se usa slug */
		$field_id = 'slug';

		if (preg_match('/^\d+$/', $id_song))
		{
			$field_id = 'id_song';
			$id_song = (int) $id_song;
		}

		$song_details = $app['db']->fetchAssoc(
			"SELECT * FROM song JOIN book ON song.id_book = book.id_book WHERE $field_id = ?",
			array($id_song)
		);

		if (!$song_details) {
			$app->abort(404, "The specified song does not exist or it's not bound to a valid book");
		}

		$original_chords = $app['db']->fetchAll(
			'SELECT chord FROM song_chord JOIN song ON song_chord.id_song = song.id_song WHERE song.id_song = ? ORDER BY position ASC',
			array($song_details['id_song'])
		);

		// In PHP 5.5 this can be implemented by array_column()
		array_walk($original_chords, function(&$item) {
			$item = $item['chord'];
		});

		return new TransposedSong($song_details, $app, $original_chords);
	}

	public function transpose($forceHighestNote=false, $forceLowestNote=false, $overrideHighestNote=null)
	{
		// Esto es anti MVC total...
		$this->app['locale'] = $this->song_details['locale'];

		/** 
		 * @todo ¿Pedir parámetro User en lugar de usar $app['user'] para mayor flexibilidad?
		 * Será útil para el teaser (dumb user) o para las "voces estándar" (feature request)
		 */
		$transposer = new AutomaticTransposer(
			$this->app['user']->lowest_note,
			$this->app['user']->highest_note,
			$this->song_details['lowest_note'], 
			$overrideHighestNote ? $overrideHighestNote : $this->song_details['highest_note'], 
			$this->original_chords,
			$this->song_details['first_chord_is_tone']
		);

		$this->transpositions = $transposer->getTranspositions(2, $forceHighestNote, $forceLowestNote);
 		$this->not_equivalent = $transposer->findAlternativeNotEquivalent();

 		$this->prepareForPrint();
	}

	public function prepareForPrint()
	{
		$printer = $this->app['chord_printers.get']($this->song_details['chord_printer']);

		$this->original_chords = $printer->printChordset($this->original_chords);

		foreach ($this->transpositions as &$transposition)
		{
			$transposition = $printer->printTransposition($transposition);
			$transposition->setCapoForPrint($this->app);
		}
	}
}