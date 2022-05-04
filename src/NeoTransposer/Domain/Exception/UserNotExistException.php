<?php

namespace NeoTransposer\Domain\Exception;

class UserNotExistException extends \Exception
{
    public function __construct(int $idUser)
    {
        $this->message = sprintf('The user #%s has not been found', $idUser);
        parent::__construct($this->message);
    }
}