<?php

namespace NeoTransposer\Model\ChordPrinter;

use NeoTransposer\Domain\ValueObject\Chord;
use NeoTransposer\Model\Transposition;

/**
 * Chord printers implement the different chord notations. This follows the
 * Template Method pattern.
 *
 * Internally, chords are notated with the following format:
 * -Note with american notation, like NotesCalculator::$accoustic_scale.
 * -Major is default.
 * -Minor as "m". Example: "Am" = A minor.
 * -Diminished as "dim".
 * -A number represents the n-th interval added. Example: "C7" = C seventh.
 * -Augmented (major) interval as "M" after the number. Example: "C7M"
 */
abstract class ChordPrinter
{
	protected $cssClass = 'chord';

    /** @deprecated Cuesta lo mismo llamar directamente a printChordset y así no se rompe el Tell Don't Ask */
	public function printTransposition(Transposition $transposition)
	{
		$transposition->chordsForPrint = $this->printChordset($transposition->chords);
		return $transposition;
	}

	public function printChordset(array $chordset): array
	{
        return array_map(function($chord)
        {
            return $this->printChordHtml($chord);
        }, $chordset);
	}

	public function printChord(Chord $chord)
	{
		return $this->printChordInNotation($chord->fundamental, $chord->attributes);
	}

	public function printChordHtml($chord): string
    {
		return '<span class="' . $this->cssClass . '">' . $this->printChord($chord) . '</span>';
	}

	abstract public function printChordInNotation($fundamental, $attributes);
}
