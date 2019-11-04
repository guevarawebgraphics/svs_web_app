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
            
                <div class="col-md-6">
                    <div class="rounded-rectangle-svs card current-proj">
                        <h5 class="text-default"><b>Project 1</b></h5>
                        <div class="row" style="overflow-x:auto;">
                            <div class="col-md-8">
                                <p class="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                            </div>
                            <div class="col-md-4 text-center">
                                <h1 class="text-default"><b>86%</b></h1>
                            </div>
                        </div>
                    </div>
                    <div class="rounded-rectangle-svs card current-proj">
                        <h5 class="text-primary"><b>Project 2</b></h5>
                        <div class="row" style="overflow-x:auto;">
                            <div class="col-md-8">
                                <p class="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                            </div>
                            <div class="col-md-4 text-center">
                                <h1 class="text-primary"><b>86%</b></h1>
                            </div>
                        </div>
                    </div>
                    <div class="rounded-rectangle-svs card current-proj">
                        <h5 class="text-secondary"><b>Project 3</b></h5>
                        <div class="row" style="overflow-x:auto;">
                            <div class="col-md-8">
                                <p class="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                            </div>
                            <div class="col-md-4 text-center">
                                <h1 class="text-secondary"><b>86%</b></h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="rounded-rectangle-svs card current-proj">
                        <h5 class="text-success"><b>Project 4</b></h5>
                        <div class="row" style="overflow-x:auto;">
                            <div class="col-md-8">
                                <p class="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                            </div>
                            <div class="col-md-4 text-center">
                                <h1 class="text-success"><b>86%</b></h1>
                            </div>
                        </div>
                    </div>
                    <div class="rounded-rectangle-svs card current-proj">
                        <h5 class="text-danger"><b>Project 5</b></h5>
                        <div class="row" style="overflow-x:auto;">
                            <div class="col-md-8">
                                <p class="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                            </div>
                            <div class="col-md-4 text-center">
                                <h1 class="text-danger"><b>86%</b></h1>
                            </div>
                        </div>
                    </div>
                    <div class="rounded-rectangle-svs card current-proj">
                        <h5 class="text-warning"><b>Project 6</b></h5>
                        <div class="row" style="overflow-x:auto;">
                            <div class="col-md-8">
                                <p class="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                            </div>
                            <div class="col-md-4 text-center">
                                <h1 class="text-warning"><b>86%</b></h1>
                            </div>
                        </div>
                    </div>
                </div>
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