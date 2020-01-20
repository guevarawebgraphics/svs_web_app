<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ManageAccessList extends Model
{
    protected $connection = 'mysql';
    protected $table = "tbl_manage_access_right";
}
