<?php

namespace NeoTransposer\Domain;

use NeoTransposer\NeoApp;

class SongsLister
{
    protected $songRepository;
    protected $userRepository;
    protected $allBooks;

    public function __construct(SongRepository $songRepository, UserRepository $userRepository, array $allBooks)
    {
        $this->songRepository = $songRepository;
        $this->userRepository = $userRepository;
        $this->allBooks = $allBooks;
    }

    /**
     * @throws UserNotExistException|BookNotExistException
     */
    public function readBookSongsWithUserFeedback(int $idBook, int $idUser): SongsWithUserFeedbackCollection
    {
        if (empty($this->userRepository->readFromId($idUser))) {
            throw new UserNotExistException($idUser);
        }

        if (empty($this->allBooks[$idBook]))
        {
            throw new BookNotExistException($idBook);
        }

        return $this->songRepository->readBookSongsWithUserFeedback($idBook, $idUser);
    }

    /**
     * @throws BookNotExistException
     */
    public function readBookSongs(int $idBook): SongsCollection
    {
        if (empty($this->allBooks[$idBook]))
        {
            throw new BookNotExistException($idBook);
        }

        return $this->songRepository->readBookSongs($idBook);
    }
}