<?php

namespace NeoTransposer\Domain;

class BookNotExistException extends \Exception
{
    public function __construct(int $idBook)
    {
        $this->message = sprintf('The book #%s has not been found', $idBook);
        parent::__construct();
    }
}