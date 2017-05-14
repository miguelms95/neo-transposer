<?php

namespace NeoTransposer\Persistence;

use Symfony\Component\HttpFoundation\Request;
use \NeoTransposer\Model\User;

/**
 * Persistence layer for the User entity.
 * 
 * @todo Hacer métodos no estáticos. Pasar $db en constructor.
 */
class UserPersistence
{
	/**
	 * Factory: get a User object from the DB
	 * 
	 * @param  string 						$email 	User e-mail
	 * @param  \Doctrine\DBAL\Connection 	$db 	Database connection.
	 * @return User        					The User instance for that e-mail.
	 */
	public static function fetchUserFromEmail($email, \Doctrine\DBAL\Connection $db)
	{
		$sql = 'SELECT * FROM user WHERE email LIKE ?';
		
		if ($userdata = $db->fetchAssoc($sql, array($email)))
		{
			return new User(
				$userdata['email'],
				$userdata['id_user'],
				$userdata['lowest_note'],
				$userdata['highest_note'],
				$userdata['id_book'],
				$userdata['wizard_step1'],
				$userdata['wizard_lowest_attempts'],
				$userdata['wizard_highest_attempts']
			);
		}
	}

	/**
	 * Create or update the user in the database.
	 * 
	 * @param  NeoTransposer\Model\User 			$user 	The User object to persist.
	 * @param  \Doctrine\DBAL\Connection 	$db 	A DB connection.
	 * @param  \Symfony\Component\HttpFoundation\Request $request The Request, for fetching the client IP.
	 * @return integer The user ID, if it was not set.
	 */
	public static function persist(User $user, \Doctrine\DBAL\Connection $db, Request $request)
	{
		if ($user->id_user)
		{
			return $db->update('user',
				array(
					'lowest_note'	=> $user->lowest_note,
					'highest_note'	=> $user->highest_note,
					'id_book'		=> $user->id_book,
					'wizard_step1' => $user->wizard_step1,
					'wizard_lowest_attempts' => $user->wizard_lowest_attempts,
					'wizard_highest_attempts' => $user->wizard_highest_attempts
				), array('id_user' => (int) $user->id_user)
			);
		}

		$db->insert('user', array(
			'email'			=> $user->email,
			'lowest_note'	=> $user->lowest_note,
			'highest_note'	=> $user->highest_note,
			'id_book'		=> $user->id_book,
			'register_ip'	=> $request->getClientIp()
		));

		return $user->id_user = $db->lastInsertId();
	}
}
