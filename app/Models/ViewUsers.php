<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ViewUsers extends Model
{
    protected $connection = 'mysql';
    protected $table = "view_users";
}
