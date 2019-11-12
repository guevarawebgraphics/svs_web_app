@extends('layouts.app_admin')
@section('content')


<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-history"></i> Retrack Task Records</h2></div>
    
    <div class="container" style="margin-top:3em;">

            @include('main.sessionRetrack')

        <div class="container svs-overflow">

            @include('main.retracktaskDatatable')
                
        </div>
    </div>
</div>

@endsection