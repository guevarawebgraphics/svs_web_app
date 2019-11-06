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
                    <div class="rounded-rectangle-svs card current-proj showModal" data-code="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}">
                            <h4 class="svs-text"><b>{{$field->proj_title}}</b></h4>
                            <div class="row" style="overflow-x:auto;">
                                <div class="col-md-8">
                                <p class="">{{$field->proj_desc}}</p>
                                <small><em>Created at : {{date("F d Y - h:i a",strtotime($field->created_at))}}</em></small>
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


<!-- Modal: delTask -->
<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">View Project : <span id="vproj"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
            <div class="container">
                <p class="note note-light">
                    <strong>Reminder:</strong> 
                    Shows the broad details about this project
                    <br>
                </p>

                    Title: <label id="vTitle"></label><br>
                    Description :<label id="vDesc"></label><br>
                    Location :<label id="vLoc"></label><br>
            </div>
            
      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary waves-effect" id="conSubmit">Continue</button>
      </div>
    </div>
  </div>
</div>

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

<script>
$(".showModal").click(function () {
    $('#showModal').modal('show');
    var projCode = $(this).attr('data-code');
    var title = $(this).attr('data-title');
    var desc = $(this).attr('data-desc');
    var location = $(this).attr('data-location');


    $('#vproj').html(title+" ("+projCode+")");
    $('#vTitle').html(title);
    $('#vLoc').html(location);
    $('#vDesc').html(desc);
});
</script>
@endsection