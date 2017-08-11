<?php

$deployDir		= '/var/www/neo-transposer.com'; // No trailing slash
$composerHome 	= '/tmp/composer-www-data';
$composerPhar	= '/var/www/html/composer.phar';
$githubBase		= 'https://github.com/isra00/neo-transposer';

define('TIME_START', microtime(true));
ini_set("display_errors", true);
error_reporting(E_ALL);

$neoConfig	= include "$deployDir/config.php";

function runCommand($command)
{
	$start = microtime(true);
	exec($command, $output, $status);

	return array(
		'command' => $command,
		'output'  => $output,
		'status'  => $status,
		'time'    => microtime(true) - $start
	);
}

function runCommands($commands, $stopIfStatusNotZero = true)
{
	$executeNext = true;
	$actions = array();
	foreach ($commands as $command)
	{
		$output = array();
		$status = 'not-executed';
		$start   = microtime(true);

		if ($executeNext)
		{
			exec($command, $output, $status);

			if ($status != 0)
			{
				$executeNext = !$stopIfStatusNotZero;
			}
		}

		$actions[] = array(
			'command' => $command,
			'output'  => $output,
			'status'  => $status,
			'time'    => microtime(true) - $start
		);
	}
	return $actions;
}

function getLastCommit($deployDir)
{
	$gitLog = runCommand("cd $deployDir && git log --pretty=medium");

	preg_match('/^commit ([0-9a-f]{40})$/', $gitLog['output'][0], $matchHash);
	$hash = $matchHash[1];

	preg_match('/^Date\:\s+(.*)$/i', $gitLog['output'][2], $matchDate);
	$date = $matchDate[1];

	return [
		'hash' 		=> substr($hash, 0, 6),
		'date' 		=> $date,
		'message' 	=> trim($gitLog['output'][4])
	];

	return $gitLog;
}

if (isset($_POST['sent']))
{
	$nothingToDeploy = false;

	$actions = array();

	$actions[] = runCommand("cd $deployDir && git pull 2>&1");

	if ('Already up-to-date.' != trim($actions[0]['output'][0]))
	{
		$actions[0]['status'] = 0;
		if ($actions[0]['status'] != 1)
		{
			if (!empty($_POST['clear-twig-cache']))
			{
				$commandRmTwig = runCommand("rm -rfv $deployDir/cache/twig/* | wc -l");
				$commandRmTwig['output'][0] = ($commandRmTwig['status'] != 1) 
					? $commandRmTwig['output'][0] . ' files deleted' 
					: $commandRmTwig['output'][0];

				$actions[] = $commandRmTwig;
			}

			if (!empty($_POST['rebuild-css']))
			{
				$actions[] = runCommand("rm -f $deployDir/web/static/compiled-" . $neoConfig['css_cache'] . ".css");
			}

			if (!empty($_POST['composer-install']))
			{
				chdir($deployDir);
				$actions[] = runCommand("export COMPOSER_HOME=$composerHome && $composerPhar install 2>&1");
			}

			if (!empty($_POST['reload-db']))
			{
				$commandMysql = runCommand("mysql -h{$neoConfig['db']['host']} -u{$neoConfig['db']['user']} -p{$neoConfig['db']['password']} {$neoConfig['db']['database']} < $deployDir/song_data.sql 2>&1");
				$commandMysql['command'] = str_replace($neoConfig['db'], '*****', $commandMysql['command']);
				$actions[] = $commandMysql;
			}

			$success = true;
		}
		else
		{
			$success = false;
		}
	}
	else
	{
		$nothingToDeploy = true;
	}

	foreach ($actions as $action)
	{
		if ($action['status'] != 0)
		{
			$success = false;
		}
	}
}

$lastCommit = getLastCommit($deployDir);

$whoami = runCommand("whoami")['output'][0];

$cssDate = file_exists("$deployDir/web/static/compiled-" . $neoConfig['css_cache'] . ".css")
	? date('d/m/Y H:i:s', filectime("$deployDir/web/static/compiled-" . $neoConfig['css_cache'] . ".css"))
	: 'no file';

?>
<html>
<head>
	<title>Deploy from git</title>
	<style>
	body { font-family: helvetica, arial, sans-serif; color: #222; margin: 2%; }
	time { background: gray; color: white; border-top-left-radius: .5em; border-top-right-radius: .5em; font-size: .8em; font-weight: bold; padding: .3em .6em; display: inline-block;}
	pre { background: #eee; margin-top: 0; padding: .5em; line-height: 140%; }
	pre.failed { border: 1px solid red; }
	.error { color: red; }
	h1.success { color: rgb(56, 118, 29); }
	.nothing { color: gray; }
	.prompt { color: green; }
	.failed .prompt { color: red; }
	.big { font-size: 1.5em; }

	.last-commit { border: 1px solid #eee; border-radius: 6px; width: auto; margin: 1em 0; font-size: .9em; }
	.last-commit h3 { color: #555; margin: 0; padding: .3em .5em; border-bottom: 1px solid #eee; font-size: 1em; background: #ddd; border-radius: 5px; border-bottom-left-radius: 0; border-bottom-right-radius: 0; }
	.last-commit p { padding: .5em; margin: 0; }
	.last-commit a { color: #444; text-decoration: none; }
	.last-commit date { display: block; text-transform: uppercase; font-size: .85em; color: #555; }
	.last-commit code { padding-left: 1em; }
	.last-commit span { font-weight: bold; }

	.submit { display: block; margin: .5em 0; }

	form span { display: inline-block; margin: .2em; }
	small { color: #555; }
	label { display: inline-block; vertical-align: top; }
	</style>
</head>
<body>

	<?php if (isset($_POST['sent'])) : ?>

	<?php if (!empty($success)) : ?>
	<h1 class="success">Deployed in <?php echo round(microtime(true) - TIME_START, 3) ?>s</h1>
	<?php elseif ($nothingToDeploy) : ?>
	<h1 class="nothing">Nothing to deploy</h1>
	<?php else : ?>
	<h2 class='error'>Deploy failed</h2>
	<?php endif ?>

	<?php foreach ($actions as $action) : ?>
		<time><?php echo round($action['time'], 3) . 's | Status code: ' . $action['status'] ?></time>
		<pre class="<?php if ($action['status'] != 0) echo 'failed' ?>">
<strong><span class="prompt"><?php echo $whoami ?>$</span> <?php echo $action['command'] ?></strong>
<?php echo implode("\n", $action['output']) ?>
		</pre>
	<?php endforeach ?>

	<?php if (!empty($success)) : ?>
	<h4>Go and test now: <a href="http://neo-transposer.com">neo-transposer.com</a> · <a href="http://neo-transposer.com/admin/dashboard?tool=testAllTranspositions">testAllTranspositions</a></h4>
	<?php endif ?>

	<?php endif ?>

 	<section class="last-commit">
		<h3>Last commit here</h3>
		<p>
			<a href="<?php echo $githubBase ?>/commit/<?php echo $lastCommit['hash'] ?>" target="_blank">
				<date><?php echo $lastCommit['date'] ?></date>
				<span><?php echo $lastCommit['message'] ?></span>
				<code><?php echo $lastCommit['hash'] ?></code>
			</a>
		</p>
 	</section>
	
	<form method="post">

		<span>
			<input type="checkbox" id="clear-twig-cache" name="clear-twig-cache" checked>
			<label for="clear-twig-cache">Clear Twig cache</label>
		</span>

		<span>
			<input type="checkbox" id="rebuild-css" name="rebuild-css" checked>
			<label for="rebuild-css">Rebuild CSS <br><small>[<?php echo $cssDate ?>]</small></label>
		</span>
		
		<span>
			<input type="checkbox" id="reload-db" name="reload-db">
			<label for="reload-db">Reload DB</label>
		</span>

		<span>
			<input type="checkbox" id="composer-install" name="composer-install">
			<label for="composer-install">Composer install <br><small>(vendor &larr; composer.lock)</small></label>
		</span>

		<span class="submit">
			<input type="submit" name="sent" value="Deploy now" class="big" />
		</span>
	</form> 
</body>
</html>