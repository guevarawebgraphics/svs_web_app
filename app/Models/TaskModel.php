<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskModel extends Model
{
    protected $connection = 'mysql';
    protected $table = "tbl_task";
}
