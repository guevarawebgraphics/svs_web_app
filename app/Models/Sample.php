<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sample extends Model
{
    protected $connection = 'mysql';
    protected $table = "tbl_sampleimport";
}
