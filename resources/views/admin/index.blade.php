@extends('layouts.app_admin')
@section('content')
<!--Grid row-->


    <!--Grid column-->
    <div class="container">
        <div class="container">
            <div class="float-left"><h2><i class="fa fa-chart-bar"></i>&nbsp;Projects' Status</h2></div>
            <div class="float-right">
                <!--Search Project -->
                <div class="md-form">
                    <i class="fa fa-search prefix"></i>
                    <input type="text" onkeyup="searchProj();" placeholder="Search here.." id="searchProj" class="form-control">
                    <label for="searchProj" class="active">Project Name</label>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 8em;">
            @if(count($view_project_percentage))
                @foreach($view_project_percentage as $field)
                    <div class="col-md-6">
                        <div class="rounded-rectangle-svs card current-proj">
                            <h5 class="svs-text"><b>{{$field->proj_title}}</b></h5>
                            <div class="row" style="overflow-x:auto;">
                                <div class="col-md-8">
                                <p class="">{{$field->proj_desc}}</p>
                                </div>
                                <div class="col-md-4 text-center">
                                <h1 class="svs-text-2"><b>
                                    @if(!empty($field->total_weight_progress))
                                        {{$field->total_weight_progress}}%
                                    @else
                                        0.00%
                                    @endif
                                </b></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>

    </div>
    <!--Grid column-->


<!--Grid row-->

<script>

function searchProj(){
    var input = document.getElementById("searchProj");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('current-proj');

    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
        nodes[i].style.display = "block";
        } else {
        nodes[i].style.display = "none";
        }
    }
}
</script>
@endsection