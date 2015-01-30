<?php

namespace NeoTransposer\ChordPrinter;

class ChordPrinterSwahili extends ChordPrinter
{
	public function printChordInNotation($fundamental, $attributes)
	{
		if ($fundamental == 'A#')
		{
			$fundamental = 'B<em>b</em>';
		}

		$fundamental = str_replace('#', '<em>d</em>', $fundamental);

		$print_attributes = str_replace('m', '-', $attributes);
		$print_attributes = preg_replace('/^(.*)([\d])(.*)$/', '\1<sup>\2</sup>\3', $print_attributes);

		return $fundamental . $print_attributes;
	}
}