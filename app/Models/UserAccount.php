<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAccount extends Model
{
    protected $connection = 'mysql';
    protected $table = "users";
}
