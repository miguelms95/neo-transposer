<?php

return array(
	'chords' => array(
		'Em'	=> 1,
		'E'		=> 2,
		'Am'	=> 2,
		'A'		=> 2,
		'D'		=> 2,
		'Dm'	=> 2,
		'C'		=> 2,
		'G'		=> 2,
		'E7'	=> 3,
		'A7'	=> 3,
		'G7'	=> 3,
		'D7'	=> 3,
		'B7'	=> 4,
		'F'		=> 5,
		'C7'	=> 5,
		'F#'	=> 6,
		'F#m'	=> 6,
		'Bm'	=> 7,
		'G#'	=> 8,
		'G#m'	=> 8,
		'Gm'	=> 8,
		'C#7'	=> 8,
		'A#'	=> 9,
		'C#'	=> 9,
		'Dm9'	=> 9,
		'F7'	=> 9,
		'F7M'	=> 9,
		'F#7'	=> 9,
		'C7M'	=> 10,
		'B'		=> 10,
		'Em6'	=> 12,
		'Dm5'	=> 12,
		'Fm'	=> 13,
		'Am6'	=> 14,
		'Dm6'	=> 15,
		'A#7'	=> 15,
		'C#m'	=> 15,
		'A#m'	=> 16,
		'Cm'	=> 16,
		'G#7'	=> 16,
		'D#'	=> 17,
		'D#m'	=> 17,
		'D#7'	=> 17,
		'C#dim'	=> 18,
		'Em9'	=> 18,
		'Am9'	=> 18,
		'Gm9'	=> 20,
		'Gm5'	=> 20,
		'F#m5'	=> 20,
		'Cm9'	=> 21,
	),

	//Instead of specifying each and every possible chord, use regexp for unusual chords:
	'patterns' => array(
		'.?m6'	=> 19,
		'.?#m6'	=> 20,
		'.?7M'	=> 20,
		'.?#7M'	=> 21,
		'.?m9'	=> 24,
		'.?#m9'	=> 25,
		'.?m5'	=> 24,
		'.?#m5'	=> 25,
		'.?dim' => 25,
		'.?#dim' => 26,
	)
);
