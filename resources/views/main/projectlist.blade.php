@extends('layouts.app_admin')
@section('content')

<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-file-alt"></i> Project List</h2></div>
    <!-- Button trigger modal-->
    <button type="button" class="btn btn-primary float-right" id="newProject"><i class="fa fa-plus"></i>&nbsp;New Project</button>
    
    <div class="container" style="margin-top:3em;">

            @include('main.sessionProj')

    <div class="container svs-overflow">

            @include('main.projectlistDatatable')
            
    </div>
    </div>
</div>

<!-- Modal: delTask -->
<div class="modal fade" id="delProj" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Delete Project : <span id="dPC"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-danger">
                <strong>Note danger:</strong> 
                You are trying to delete this record. This record will not be useful to any transaction
                <br>
                Title: <em id="delTitle"></em><br>
                Description :<em id="delDesc"></em><br>
                Location :<em id="delLoc"></em><br>
            </p>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
        <button class="btn btn-danger waves-effect" id="delSubmit">Delete</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal: editProj -->
<div class="modal fade" id="editProj" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog svs-modal" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Edit Project : <span id="ePC"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="">

                <p class="note note-success"><strong>Note update:</strong> 
                    You are trying to update this record. Any changes made will be applied to all transactions
                </p>

                <form >
                    <div class="row">
                        <div class="container col-md-6">
                                <div id="svsMapE" style="width: 100%; height:300px;"></div>
                        </div>
                        <div class="container col-md-6">
                                    
                            <!--Grid row-->
                        <div class="row">
                                <div class="col-md-12">
                                        <div class="md-form mb-0">
                                            <input type="text" id="epTitle" name="epTitle" class="form-control">
                                            <label id="epLTitle" for="epTitle">Title</label>
                                        </div>
                                    </div>
                                </div>
                                <!--Grid row-->
                            
                                <!--Grid row-->
                                <div class="row">
        
                                    <!--Grid column-->
                                    <div class="col-md-12">
        
                                        <div class="md-form">
                                            <textarea type="text" id="epDesc" name="epDesc" maxlength="190" class="form-control md-textarea"></textarea>
                                            <label id="epLDesc" for="epDesc">Description</label>
                                        </div>
        
                                    </div>
                                    
                                </div>
                                <!--Grid row-->
        
                                <a href="" name="epLon" id="epLon" style="display:none;"></a>
                                <a href="" name="epLat" id="epLat" style="display:none;"></a>
                                <a href="" name="epAddrHidden" id="epAddrHidden" style="display:none;"></a>
                                
                                <!--Grid row-->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="md-form mb-0" id="search">
                                            <input type="text" id="epAddr" name="epAddr" class="form-control" size="58" onkeyup="addr_searchE();">
                                            <label for="epAddr" id="epLAddr">Location</label>
                                            <div class="ep-map-result" id="ep-results"></div>
                                        </div>
                                    </div>
                                </div>
                                <!--Grid row-->
                        </div>
                    </div>
                    <!--Grid row-->
                    <div class="row" style="margin-top:1.5em;">
                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input type="text" id="epSearchPM" onkeyup="searchPM();" placeholder="Click here to search" name="epSearchPM" class="form-control">
                                <label id="epSearchPM" class="active" for="epTitle">Current Project Manager</label>
                            </div>
                            <div class="container" id="pmDropdownDiv" style="max-height:200px; height:100%; overflow-x:auto;">
                                <div class="" id="pmSelectCat" style="margin-bottom:20px; display:none;">
                                    <a class="float-left select-all-pm">Select All</a>
                                    <a class="float-right select-none-pm">Select None</a>
                                </div>
                                <div class="container" id="pmDivEdit" style="display:none;">
                                    
                                </div>  
                                <div class="container" id="pmUnselect" style="display:none;">
                                    
                                </div>
                            </div>
                            {{-- <label for="pmSOLEdit" class="svs-small"><small>Project Manager</small></label>
                            <select id="pmSOLEdit" name="pmSOLEdit" class="mdb-select multi-sol-svs" multiple="multiple">
                                <optgroup label="Project Manager" title="Opiton Group 1">
                                @if(count($emp_info))
                                        @foreach($emp_info as $field)
                                        <option title="Subgroup 1" value="{{$field->company_id}}">{{$field->fullname}} ({{$field->position}} - {{$field->department}})</option>
                                    @endforeach
                                @endif
                            </select> --}}
                        </div>
                        <!--Grid column-->
                        
                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input type="text" id="epSearchEMP" onkeyup="searchEMP();" placeholder="Click here to search" name="epSearchEMP" class="form-control">
                                <label id="epSearchEMP" class="active" for="epTitle">Current Employee</label>
                            </div>
                            <div class="container" id="empDropdownDiv" style="max-height:200px; height:100%; overflow-x:auto;">
                                <div class="" id="empSelectCat" style="margin-bottom:20px; display:none;">
                                    <a class="float-left select-all-emp">Select All</a>
                                    <a class="float-right select-none-emp">Select None</a>
                                </div>
                                <div class="container" id="empDivEdit" style="display:none;">
                                    
                                </div>  
                                <div class="container" id="empUnselect" style="display:none;">
                                    
                                </div>
                            </div>
                            {{-- <label for="empSOLEdit" class="svs-small"><small>Employee</small></label>
                            <select id="empSOLEdit" name="empSOLEdit" class="mdb-select multi-sol-svs" multiple="multiple">
                                <optgroup label="Employee Name" title="Opiton Group 1">
                                    @if(count($emp_info))
                                        @foreach($emp_info as $field)
                                            <option title="Subgroup 1" value="{{$field->company_id}}">{{$field->fullname}} ({{$field->position}} - {{$field->department}})</option>
                                        @endforeach
                                    @endif
                                </optgroup>
                            </select> --}}
                        </div>
                    </div>
                    <!--Grid row--> 
                    <br>
                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input placeholder="Selected date" data-toggle="datepicker" type="text" id="estStartDEdit" name="estStartDEdit" class="form-control datepicker">
                                <label for="estStartDEdit" id="ESDEditLabel">Estimated Start Date</label>
    
                            </div>
                        </div>
                        <!--Grid column-->
    
                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input type="text" placeholder="Selected time" id="estStartTEdit" data-toggle="timepicker" name="estStartTEdit" class="form-control">
                                <label for="estStartTEdit" id="ESTEditLabel">Time</label>
                            </div>
                        </div>
                        <!--Grid column-->
    
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input placeholder="Selected date" data-toggle="datepicker" type="text" id="estEndDEdit" name="estEndDEdit" class="form-control datepicker">
                                <label for="estEndDEdit" id="EEDEditLabel">Estimated End Date</label>
    
                            </div>
                        </div>
                        <!--Grid column-->
    
                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input type="text" placeholder="Selected time" id="estEndTEdit" data-toggle="timepicker" name="estEndTEdit" class="form-control">
                                <label for="estEndTEdit" id="EETEditLabel">Time</label>
                            </div>
                        </div>
                        <!--Grid column-->
    
                    </div>
                    <!--Grid row-->

                    <hr>

                    <!--Grid row-->
                    <div class="row">

                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input placeholder="Selected date" data-toggle="datepicker" type="text" id="actStartDEdit" name="actStartDEdit" class="form-control datepicker">
                                    <label for="actStartDEdit" id="ASDEditLabel">Actual Start Date</label>
        
                                </div>
                            </div>
                            <!--Grid column-->
        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="text" placeholder="Selected time" id="actStartTEdit" data-toggle="timepicker" name="actStartTEdit" class="form-control">
                                    <label for="actStartTEdit" id="ASTEditLabel">Time</label>
                                </div>
                            </div>
                            <!--Grid column-->
        
                        </div>
                        <!--Grid row-->
    
                        <!--Grid row-->
                        <div class="row">
    
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input placeholder="Selected date" data-toggle="datepicker" type="text" id="actEndDEdit" name="actEndDEdit" class="form-control datepicker">
                                    <label for="actEndDEdit" id="AEDEditLabel">Actual End Date</label>
        
                                </div>
                            </div>
                            <!--Grid column-->
        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="text" placeholder="Selected time" id="actEndTEdit" data-toggle="timepicker" name="actEndTEdit" class="form-control">
                                    <label for="actEndTEdit" id="AETEditLabel">Time</label>
                                </div>
                            </div>
                            <!--Grid column-->
        
                        </div>
                        <!--Grid row-->

                        <!--Grid column-->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="text" id="epSearchTask" onkeyup="" placeholder="Click here to search" name="epSearchTask" class="form-control">
                                    <label id="epSearchTask" class="active" for="epTitleTask">Current Task</label>
                                </div>
                                <div class="container" id="taskDropdownDiv" style="max-height:200px; height:100%; overflow-x:auto;">
                                    <div class="" id="taskSelectCat" style="margin-bottom:20px; display:none;">
                                        <a class="float-left select-all-task">Select All</a>
                                        <a class="float-right select-none-task">Select None</a>
                                    </div>
                                    <div class="container" id="taskDivEdit" style="display:none;">
                                        
                                    </div>  
                                    <div class="container" id="taskUnselect" style="display:none;">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Grid column-->

                </form>

        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect" id="updateProj">Update</button>
      </div>
    </div>
  </div>
</div>



<!-- Modal: modalLoc -->
<div class="modal fade" id="modalLoc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog svs-modal" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">New Project</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container-svs">
            <form >
                <div class="row">
                    <div class="container col-md-6">
                        
                        <div id="svsMap" style="width: 100%; height:300px;"></div>
                        
                        {{-- 
                        Google GMAP
                        <div id="map" style="width: 100%; height:300px;"></div>
                        <script>
                        var map;
                        function initMap() {
                            map = new google.maps.Map(document.getElementById('map'), {
                            center: {lat: 14.599512, lng: 120.984222},
                            zoom: 8
                            });
                        }
                        </script>
                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDePZhtX4riZVfQZsJvjvnG6QByB_ljmcE&callback=initMap"
                        async defer>
                        </script>
                        --}}
                    </div>

                    <div class="container col-md-6">
                        <!--Grid row-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="md-form mb-0">
                                    <input type="text" id="proj_title" name="proj_title" class="form-control">
                                    <label for="proj_title" class="">Title</label>
                                </div>
                            </div>
                        </div>
                        <!--Grid row-->
                    
                        <!--Grid row-->
                        <div class="row">

                            <!--Grid column-->
                            <div class="col-md-12">

                                <div class="md-form">
                                    <textarea type="text" id="proj_desc" name="proj_desc" maxlength="190" class="form-control md-textarea"></textarea>
                                    <label for="proj_desc">Description</label>
                                </div>

                            </div>
                            
                        </div>
                        <!--Grid row-->

                        <a href="" name="lon" id="lon" style="display:none;"></a>
                        <a href="" name="lat" id="lat" style="display:none;"></a>
                        
                        <!--Grid row-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="md-form mb-0" id="search">
                                    <input type="text" id="addr" name="addr" class="form-control" size="58" onkeyup="addr_search();">
                                    <label for="addr" class="">Location</label>
                                    <div class="map-result" id="results"></div>
                                </div>
                            </div>
                        </div>
                        <!--Grid row-->
                    
                    </div>
                </div>
                
                 <!--Grid row-->
                 <div class="row" style="margin-top:1.5em;">
                    <!--Grid column-->
                    <div class="col-md-6">
                            <label for="pmSOL" class="svs-small"><small>Project Manager</small></label>
                            <select id="pmSOL" name="pmSol" class="mdb-select multi-sol-svs" multiple="multiple">
                                <optgroup label="Project Manager" title="Opiton Group 1">
                                @if(count($emp_info))
                                        @foreach($emp_info as $field)
                                        <option title="Subgroup 1" value="{{$field->company_id}}">{{$field->fullname}} ({{$field->position}} - {{$field->department}})</option>
                                    @endforeach
                                @endif
                        </select>
                    </div>
                    <!--Grid column-->
                    
                    <!--Grid column-->
                    <div class="col-md-6">
                        <label for="empSOL" class="svs-small"><small>Employee</small></label>
                        <select id="empSOL" name="empSol" class="mdb-select multi-sol-svs" multiple="multiple">
                            <optgroup label="Employee Name" title="Opiton Group 1">
                                @if(count($emp_info))
                                    @foreach($emp_info as $field)
                                        <option title="Subgroup 1" value="{{$field->company_id}}">{{$field->fullname}} ({{$field->position}} - {{$field->department}})</option>
                                    @endforeach
                                @endif
                            </optgroup>
                        </select>
                    </div>
                </div>
                <!--Grid row--> 
                

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input placeholder="Selected date" data-toggle="datepicker" type="text" id="estStartD" name="estStartD" class="form-control datepicker">
                            <label for="estStartD">Estimated Start Date</label>

                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" placeholder="Selected time" id="estStartT" data-toggle="timepicker" name="estStartT" class="form-control">
                            <label for="estStartT" class="">Time</label>
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->


                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input placeholder="Selected date" data-toggle="datepicker" type="text" id="estEndD" name="estEndD" class="form-control datepicker">
                            <label for="estEndD">Estimated End Date</label>

                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" placeholder="Selected time" id="estEndT" data-toggle="timepicker" name="estEndT" class="form-control">
                            <label for="estEndT" class="">Time</label>
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <br>
                <hr>
                <br>
                 <!--Grid row-->
                 <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input placeholder="Selected date" data-toggle="datepicker" type="text" id="actStartD" name="actStartD" class="form-control datepicker">
                            <label for="actStartD">Actual Start Date</label>

                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" placeholder="Selected time" id="actStartT" data-toggle="timepicker" name="actStartT" class="form-control">
                            <label for="actStartT" class="">Time</label>
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input placeholder="Selected date" data-toggle="datepicker" type="text" id="actEndD" name="actEndD" class="form-control datepicker">
                            <label for="actEndD">Actual End Date</label>

                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" placeholder="Selected time" id="actEndT" data-toggle="timepicker" name="actEndT" class="form-control">
                            <label for="actEndT" class="">Time</label>
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid column-->
                <div class="row">
                    <div class="col-md-6">
                        <label for="demoSOL" class="svs-small"><small>Task List</small></label>
                        <select id="demoSOL" name="myTask" class="mdb-select multi-sol-svs" multiple="multiple">
                            <optgroup label="Task List" title="Opiton Group 1">
                                @if(count($task_record))
                                    @foreach($task_record as $field)
                                        <option title="Subgroup 1" value="{{$field->taskCode}}">{{$field->task_title}}</option>
                                    @endforeach
                                @else
                                    <option value="" title="Subgroup 1">No record found..</option>
                                @endif
                            </optgroup>
                        </select>
                    </div>
                </div>
                <!--Grid row--> 

                <!-- Add task by button and select -->
                    {{-- <div class="row">
                        <div class="col-md-6" id="InputsWrapper">
                            <div class="md-form mb-0">
                                <select id="field_1" name ="myTask[]" class="mdb-select md-form mb-0 svs-select">
                                    <option value="" selected disabled>Select Task</option>
                                    @if(count($task_record))
                                        @foreach($task_record as $field)
                                            <option value="{{$field->taskCode}}">{{$field->task_title}}</option>
                                        @endforeach
                                    @endif
                                </select>
                                <a href="#" class="removeclass"></a>
                            </div>
                        </div>
                        <div id="lineBreak"></div>
                    </div>
                    <div id="AddMoreFileId" style="margin-top:1em;">
                        <a href="#" id="AddMoreFileBox" class="btn btn-svs-default"><i class="fa fa-plus"></i>&nbsp;Add Task</a><br><br>
                    </div> --}}
                <!-- Add task by button and select -->
            </form>
            <br>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer" style="border:none!important;">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" id="subNewProj">Submit</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal: modalLoc -->


<script>
    $('#demoSOL').searchableOptionList();
    $('#empSOL').searchableOptionList();
    $('#pmSOL').searchableOptionList();
    $('#empSOLEdit').searchableOptionList();
    $('#pmSOLEdit').searchableOptionList();
    // $("#pmDivEdit").hide();
    // $("#empDivEdit").hide();
</script>

<script>

function searchPM(){
    var input = document.getElementById("epSearchPM");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('current-pm');

    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
        nodes[i].style.display = "block";
        } else {
        nodes[i].style.display = "none";
        }
    }
}

function searchEMP(){
    var input = document.getElementById("epSearchEMP");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('current-emp');

    for (i = 0; i < nodes.length; i++) {
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
        nodes[i].style.display = "block";
        } else {
        nodes[i].style.display = "none";
        }
    }
}
// $(document).ready(function(){
//     $("#epSearchPM").click(function(){
//         $("#pmDivEdit").show();
//     });

//     $("#epSearchEMP").click(function(){
//         $("#empDivEdit").show();
//     });
// });
</script>

<script>
$(document).ready(function () {
    $("#delSubmit").click(function () {

        var title = $(this).attr('data-title');
        var desc = $(this).attr('data-desc');
        var addr = $(this).attr('data-location');
        var lon = $(this).attr('data-lon');
        var lat = $(this).attr('data-lat');
        var projCode = $(this).attr('data-projcode');

        var x = document.getElementById("delSubmit");
        x.innerHTML = "Loading...";
        document.getElementById("delSubmit").disabled = true;

        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('project_delete') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                code:projCode
            }, 
            dataType: "json",
            success:function(data)
            {
                if(data.success.length > 0){
                    $.ajax({
                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        url: "{{ route('session_success') }}",
                        method: "POST",
                        data:{
                            proceed:"TRUE",
                            type:"DELETEPROJECT",
                            proj_title:title,
                            proj_desc:desc,
                            lon:lon,
                            lat:lat,
                            addr:addr,
                            code:projCode
                        }, 
                        dataType: "json",
                        success:function(data)
                        {
                            if(data.success.length > 0){
                                location.reload();
                            }else{
                                toastr.error(data.error[0]);
                            }
                        },
                        error: function(xhr, ajaxOptions, thrownError){
                            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    }); 
                }else{
                    toastr.error(data.error[0]);
                }
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        }); 
    });
});
</script>

<script>
$(document).ready(function () {
    $("#updateProj").click(function () {
        var title = $("#epTitle").val();
        var desc = $("#epDesc").val();

        var addr = $("#epAddrHidden").html();
        var lon = $("#epLon").html();
        var lat = $("#epLat").html();

        var projCode = $(this).attr('data-projcode');

        var pmChck = []; 
        $("input:checkbox[name=pmChck]:checked").each(function() { 
            pmChck.push($(this).val()); 
        }); 

        var empChck = []; 
        $("input:checkbox[name=empChck]:checked").each(function() { 
            empChck.push($(this).val()); 
        }); 

        var taskChck = []; 
        $("input:checkbox[name=taskChck]:checked").each(function() { 
            taskChck.push($(this).val()); 
        }); 

        //Estimated
        var est_start_date = $("#estStartDEdit").val();
        var est_start_time = $("#estStartTEdit").val();

        var est_end_date = $("#estEndDEdit").val();
        var est_end_time = $("#estEndTEdit").val();

        //Actual
        var act_start_date = $("#actStartDEdit").val();
        var act_start_time = $("#actStartTEdit").val();

        var act_end_date = $("#actEndDEdit").val();
        var act_end_time = $("#actEndTEdit").val();

        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('project_update_val') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                code:projCode,
                title:title,
                desc:desc,
                addr:addr,
                lon:lon,
                lat:lat,
                pmChck:pmChck,
                empChck:empChck,
                taskChck:taskChck,
                est_start_date:est_start_date,
                est_start_time:est_start_time,
                est_end_date:est_end_date,
                est_end_time:est_end_time,
                act_start_date:act_start_date,
                act_start_time:act_start_time,
                act_end_date:act_end_date,
                act_end_time:act_end_time
            }, 
            dataType: "json",
            success:function(data)
            {
                if(data.success.length > 0){
                    var x = document.getElementById("updateProj");
                    x.innerHTML = "Loading...";
                    document.getElementById("updateProj").disabled = true;

                    $.ajax({
                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        url: "{{ route('project_update') }}",
                        method: "POST",
                        data:{
                            proceed:"TRUE",
                            code:projCode,
                            title:title,
                            desc:desc,
                            addr:addr,
                            lon:lon,
                            lat:lat,
                            pmChck:pmChck,
                            empChck:empChck,
                            taskChck:taskChck,
                            est_start_date:est_start_date,
                            est_start_time:est_start_time,
                            est_end_date:est_end_date,
                            est_end_time:est_end_time,
                            act_start_date:act_start_date,
                            act_start_time:act_start_time,
                            act_end_date:act_end_date,
                            act_end_time:act_end_time
                        }, 
                        dataType: "json",
                        success:function(data)
                        {
                            if(data.success.length > 0){
                                $.ajax({
                                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                                    url: "{{ route('session_success') }}",
                                    method: "POST",
                                    data:{
                                        proceed:"TRUE",
                                        type:"UPDATEPROJECT",
                                        proj_title:title,
                                        proj_desc:desc,
                                        lon:addr,
                                        lat:lon,
                                        addr:lat,
                                        code:projCode
                                    }, 
                                    dataType: "json",
                                    success:function(data)
                                    {
                                        if(data.success.length > 0){
                                            location.reload();
                                        }else{
                                            toastr.error(data.error[0]);
                                        }
                                    },
                                    error: function(xhr, ajaxOptions, thrownError){
                                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                }); 
                            }else{
                                toastr.error(data.error[0]);
                            }
                        },
                        error: function(xhr, ajaxOptions, thrownError){
                            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });  
                }else{
                    toastr.error(data.error[0]);
                }
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });  
    });
});
</script>

<script>
$(".delProj").click(function () {
    $('#delProj').modal('show');
    var id = $(this).attr('data-id');
    var projCode = $(this).attr('data-projcode');
    var title = $(this).attr('data-title');
    var desc = $(this).attr('data-desc');
    var location = $(this).attr('data-location');
    var lon = $(this).attr('data-lon');
    var lat = $(this).attr('data-lat');
    var date = $(this).attr('data-date');
    $('#dPC').html(projCode);
    $('#delTitle').html(title);
    $('#delDesc').html(desc);
    $('#delLoc').html(location);
    $('#delSubmit').attr('data-projcode',projCode);
    $('#delSubmit').attr('data-title',title);
    $('#delSubmit').attr('data-desc',desc);
    $('#delSubmit').attr('data-lon',lon);
    $('#delSubmit').attr('data-lat',lat);
    $('#delSubmit').attr('data-location',location);


});
</script>

<script>
$(".editProj").click(function () {
    $('#editProj').modal('show');
    

    var id = $(this).attr('data-id');
    var projCode = $(this).attr('data-projcode');
    var title = $(this).attr('data-title');
    var desc = $(this).attr('data-desc');
    var location = $(this).attr('data-location');
    var date = $(this).attr('data-date');
    var longitude = $(this).attr('data-lon');
    var latitude = $(this).attr('data-lat');

    //Estimated DateTime
    var est_start_date = $(this).attr('data-esd');
    var est_end_date = $(this).attr('data-eed');

    var now_esd = new Date(est_start_date);
    var now_est = new Date(est_start_date);
    var esd = now_esd.toLocaleDateString();
    var est = now_est.toLocaleTimeString([], {timeStyle: 'short'});

    var now_eed = new Date(est_end_date);
    var now_eet = new Date(est_end_date);
    var eed = now_eed.toLocaleDateString();
    var eet = now_eet.toLocaleTimeString([], {timeStyle: 'short'});

    //Actual DateTime
    var act_start_date = $(this).attr('data-asd');
    var act_end_date = $(this).attr('data-aed');

    var now_asd = new Date(act_start_date);
    var now_ast = new Date(act_start_date);
    var asd = now_asd.toLocaleDateString();
    var ast = now_ast.toLocaleTimeString([], {timeStyle: 'short'});

    var now_aed = new Date(act_end_date);
    var now_aet = new Date(act_end_date);
    var aed = now_aed.toLocaleDateString();
    var aet = now_aet.toLocaleTimeString([], {timeStyle: 'short'});

    $('#ePC').html(projCode);
    $('#epTitle').val(title);
    $('#epDesc').val(desc);
    $('#epAddrHidden').html(location);
    $('#epAddr').val(location);

    $('#epLat').html(longitude);
    $('#epLon').html(latitude);
    // $('#epAddr').val(location);

    $('#epLTitle').attr('class','active');
    $('#epLDesc').attr('class','active');
    $('#epLAddr').attr('class','active');
    
    //Estimated DateTime
    $('#estStartDEdit').val(esd);
    $('#estStartTEdit').val(est);
    $('#estEndDEdit').val(eed);
    $('#estEndTEdit').val(eet);

    $('#ESDEditLabel').attr('class','active');
    $('#ESTEditLabel').attr('class','active');
    $('#EEDEditLabel').attr('class','active');
    $('#EETEditLabel').attr('class','active');

    //Actual DateTime
    $('#actStartDEdit').val(asd);
    $('#actStartTEdit').val(ast);
    $('#actEndDEdit').val(aed);
    $('#actEndTEdit').val(aet);

    $('#ASDEditLabel').attr('class','active');
    $('#ASTEditLabel').attr('class','active');
    $('#AEDEditLabel').attr('class','active');
    $('#AETEditLabel').attr('class','active');

    $('#updateProj').attr('data-projcode',projCode);

    // addr_searchE();
    // SelectAddrE(latitude + ", " + longitude + ", \'" + location + "\'");

    setTimeout(function(){ mapE.invalidateSize()}, 500);
    //PM
    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('project_dropdown') }}",
        method: "POST",
        data:{
            proceed:"TRUE",
            type:"PM",
            code:projCode
        }, 
        success:function(data)
        {
            $("#pmDivEdit").html(data);
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
    //EMP
    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('project_dropdown') }}",
        method: "POST",
        data:{
            proceed:"TRUE",
            type:"EMP",
            code:projCode
        }, 
        success:function(data)
        {
            $("#empDivEdit").html(data);
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
    //Task
    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('project_dropdown') }}",
        method: "POST",
        data:{
            proceed:"TRUE",
            type:"TASK",
            code:projCode
        }, 
        success:function(data)
        {
            $("#taskDivEdit").html(data);
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
</script>

<script>
 $(document).ready(function () {

    //Project Manager
        $("#epSearchPM").click(function () {
            pmDropdownDiv();
            getUnselected();
        });

        $(".select-all-pm").click(function () {
            $('input[name=pmChck]').prop('checked', true);
        });

        $(".select-none-pm").click(function () {
            $('input[name=pmChck]').prop('checked', false);
        });

        function pmDropdownDiv() {
            var x = document.getElementById("pmDivEdit");
            if (x.style.display === "none") {
                x.style.display = "block";
                getUnselected();
            } else {
                x.style.display = "none";
            }

            var y = document.getElementById("pmUnselect");
            if (y.style.display === "none") {
                y.style.display = "block";
                getUnselected();
            } else {
                y.style.display = "none";
            }

            var z = document.getElementById("pmSelectCat");
            if (z.style.display === "none") {
                z.style.display = "block";
                getUnselected();
            } else {
                z.style.display = "none";
            }
        }

        function getUnselected(){
            var pmChck = []; 
            $("input:checkbox[name=pmChck]:checked").each(function() { 
                pmChck.push($(this).val());
            });
            $.ajax({
                headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url: "{{ route('project_unselected') }}",
                method: "POST",
                data:{
                    proceed:"TRUE",
                    type:"PM",
                    pmChck:pmChck
                }, 
                success:function(data)
                {
                    $("#pmUnselect").html(data);
                },
                error: function(xhr, ajaxOptions, thrownError){
                    console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }

    //Employee
        $("#epSearchEMP").click(function () {
            empDropdownDiv();
            getUnselectedEmp();
        });

        $(".select-all-emp").click(function () {
            $('input[name=empChck]').prop('checked', true);
        });

        $(".select-none-emp").click(function () {
            $('input[name=empChck]').prop('checked', false);
        });

        function empDropdownDiv() {
            var x = document.getElementById("empDivEdit");
            if (x.style.display === "none") {
                x.style.display = "block";
                getUnselectedEmp();
            } else {
                x.style.display = "none";
            }

            var y = document.getElementById("empUnselect");
            if (y.style.display === "none") {
                y.style.display = "block";
                getUnselectedEmp();
            } else {
                y.style.display = "none";
            }

            var z = document.getElementById("empSelectCat");
            if (z.style.display === "none") {
                z.style.display = "block";
                getUnselectedEmp();
            } else {
                z.style.display = "none";
            }
        }

        function getUnselectedEmp(){
            var empChck = []; 
            $("input:checkbox[name=empChck]:checked").each(function() { 
                empChck.push($(this).val());
            });
            $.ajax({
                headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url: "{{ route('project_unselected') }}",
                method: "POST",
                data:{
                    proceed:"TRUE",
                    type:"EMP",
                    empChck:empChck
                }, 
                success:function(data)
                {
                    $("#empUnselect").html(data);
                },
                error: function(xhr, ajaxOptions, thrownError){
                    console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
    //Task
    $("#epSearchTask").click(function () {
            taskDropdownDiv();
            getUnselectedTask();
        });

        $(".select-all-task").click(function () {
            $('input[name=taskChck]').prop('checked', true);
        });

        $(".select-none-task").click(function () {
            $('input[name=taskChck]').prop('checked', false);
        });

        function taskDropdownDiv() {
            var x = document.getElementById("taskDivEdit");
            if (x.style.display === "none") {
                x.style.display = "block";
                getUnselectedTask();
            } else {
                x.style.display = "none";
            }

            var y = document.getElementById("taskUnselect");
            if (y.style.display === "none") {
                y.style.display = "block";
                getUnselectedTask();
            } else {
                y.style.display = "none";
            }

            var z = document.getElementById("taskSelectCat");
            if (z.style.display === "none") {
                z.style.display = "block";
                getUnselectedTask();
            } else {
                z.style.display = "none";
            }
        }

        function getUnselectedTask(){
            var taskChck = []; 
            $("input:checkbox[name=taskChck]:checked").each(function() { 
                taskChck.push($(this).val());
            });
            $.ajax({
                headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url: "{{ route('project_unselected') }}",
                method: "POST",
                data:{
                    proceed:"TRUE",
                    type:"TASK",
                    taskChck:taskChck
                }, 
                success:function(data)
                {
                    $("#taskUnselect").html(data);
                },
                error: function(xhr, ajaxOptions, thrownError){
                    console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
});
</script>


<script>
    // Material Design example
        $(document).ready(function () {
        $('#dtMaterialDesignExample').DataTable();
        $('#dtMaterialDesignExample_wrapper').find('label').each(function () {
            $(this).parent().append($(this).children());
        });
        $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('input').each(function () {
            const $this = $(this);
            $this.attr("placeholder", "Search");
            $this.removeClass('form-control-sm');
        });
        $('#dtMaterialDesignExample_wrapper .dataTables_length').addClass('d-flex flex-row');
        $('#dtMaterialDesignExample_wrapper .dataTables_filter').addClass('md-form');
        $('#dtMaterialDesignExample_wrapper select').removeClass(
        'custom-select custom-select-sm form-control form-control-sm');
        $('#dtMaterialDesignExample_wrapper select').addClass('mdb-select');
        // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
        $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('label').remove();
        });
</script>

<script>      
    //type="text/javascript"
    $("#newProject").click(function () {
        $('#modalLoc').modal('show');
        setTimeout(function(){ map.invalidateSize()}, 500);
    });
</script>

<script type="text/javascript">
    var startlat = 14.599512;
    var startlon = 120.984222;
    
    var options = {
    center: [startlat, startlon],
    zoom: 15
    }
    
    document.getElementById('lat').innerHTML = startlat;
    document.getElementById('lon').innerHTML = startlon;
    
    var map = L.map('svsMap', options);
    var nzoom = 15;
    
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'OSM'}).addTo(map);
    
    var myMarker = L.marker([startlat, startlon], {title: "Coordinates", alt: "Coordinates", draggable: true}).addTo(map).on('dragend', function() {
        var lat = myMarker.getLatLng().lat.toFixed(8);
        var lon = myMarker.getLatLng().lng.toFixed(8);
        var czoom = map.getZoom();
        if(czoom < 18) { nzoom = czoom + 2; }
        if(nzoom > 18) { nzoom = 18; }
        if(czoom != 18) { map.setView([lat,lon], nzoom); } else { map.setView([lat,lon]); }
        document.getElementById('lat').value = lat;
        document.getElementById('lon').value = lon;
        myMarker.bindPopup("Lat " + lat + "<br />Lon " + lon).openPopup();
    });
    
    function SelectAddr(lat1, lng1, add1)
    {
        myMarker.closePopup();
        map.setView([lat1, lng1],15);
        myMarker.setLatLng([lat1, lng1]);
        lat = lat1.toFixed(8);
        lon = lng1.toFixed(8);
        document.getElementById('lat').innerHTML = lat;
        document.getElementById('lon').innerHTML = lon;
        document.getElementById('addr').value = add1;
        myMarker.bindPopup("Latitude : " + lat + "<br />Longitude : " + lon+ "<br />Location : " + add1).openPopup();
    }
    
    function myFunction(arr)
    {
        var out = "<br />";
        var i;
        
        if(arr.length > 0)
        {
        for(i = 0; i < arr.length; i++)
        {
        out += "<div class='address container-fluid card svs-map-add' title='Show Location and Coordinates' onclick='SelectAddr(" + arr[i].lat + ", " + arr[i].lon + ",\"" + arr[i].display_name + "\");return false;'>" + arr[i].display_name + "</div>";
        }
        document.getElementById('results').innerHTML = out;
        }
        else
        {
        document.getElementById('results').innerHTML = "Sorry, no results...";
        }
    }
    
    function addr_search()
    {
        var inp = document.getElementById("addr");
        var xmlhttp = new XMLHttpRequest();
        var url = "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + inp.value;
        xmlhttp.onreadystatechange = function()
        {
        if (this.readyState == 4 && this.status == 200)
        {
            var myArr = JSON.parse(this.responseText);
            myFunction(myArr);
        }
        };
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

</script>

<script>
    var startlatE = 14.599512;
    var startlonE = 120.984222;
    
    var optionsE = {
    center: [startlatE, startlonE],
    zoom: 15
    }
    
    document.getElementById('lat').innerHTML = startlatE;
    document.getElementById('lon').innerHTML = startlonE;
    
    var mapE = L.map('svsMapE', options);
    var nzoomE = 15;
    
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'OSM'}).addTo(mapE);
    
    var myMarkerE = L.marker([startlatE, startlonE], {title: "Coordinates", alt: "Coordinates", draggable: true}).addTo(mapE).on('dragend', function() {
        var latE = myMarkerE.getLatLng().lat.toFixed(8);
        var lonE = myMarkerE.getLatLng().lng.toFixed(8);
        var czoomE = mapE.getZoom();
        if(czoomE < 18) { nzoomE = czoomE + 2; }
        if(nzoomE > 18) { nzoomE = 18; }
        if(czoomE != 18) { mapE.setView([latE,lonE], nzoomE); } else { mapE.setView([latE,lonE]); }
        document.getElementById('epLat').value = latE;
        document.getElementById('epLon').value = lonE;
        myMarkerE.bindPopup("Lat " + latE + "<br />Lon " + lonE).openPopup();
    });

    function SelectAddrE(lat1, lng1, add1)
    {
        myMarkerE.closePopup();
        mapE.setView([lat1, lng1],15);
        myMarkerE.setLatLng([lat1, lng1]);
        latE = lat1.toFixed(8);
        lonE = lng1.toFixed(8);
        document.getElementById('epLat').innerHTML = latE;
        document.getElementById('epLon').innerHTML = lonE;
        document.getElementById('epAddr').value = add1;
        document.getElementById('epAddrHidden').innerHTML = add1;
        myMarkerE.bindPopup("Latitude : " + latE + "<br />Longitude : " + lonE+ "<br />Location : " + add1).openPopup();
    }
    
    function myFunctionE(arr)
    {
        var out = "<br />";
        var i;
        
        if(arr.length > 0)
        {
        for(i = 0; i < arr.length; i++)
        {
        out += "<div class='address container-fluid card svs-map-add' title='Show Location and Coordinates' onclick='SelectAddrE(" + arr[i].lat + ", " + arr[i].lon + ",\"" + arr[i].display_name + "\");return false;'>" + arr[i].display_name + "</div>";
        }
        document.getElementById('ep-results').innerHTML = out;
        }
        else
        {
        document.getElementById('ep-results').innerHTML = "Sorry, no results...";
        }
    }
    
    function addr_searchE()
    {
        var inp = document.getElementById("epAddr");
        var xmlhttp = new XMLHttpRequest();
        var url = "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + inp.value;
        xmlhttp.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200)
            {
                var myArr = JSON.parse(this.responseText);
                myFunctionE(myArr);
            }
        };
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }
</script>

<script>
    $(function (){
        $('[data-toggle="datepicker"]').datetimepicker({
            format: 'L'
        });
        $('[data-toggle="timepicker"]').datetimepicker({
            format: 'LT'
        });
    });
</script>

<script>
//Add task by button and select
$(document).ready(function() {
    var MaxInputs       = 5; //maximum extra input boxes allowed
    var InputsWrapper   = $("#InputsWrapper"); //Input boxes wrapper ID
    var AddButton       = $("#AddMoreFileBox"); //Add button ID

    var x = InputsWrapper.length; //initlal text box count
    var FieldCount=1; //to keep track of text box added

    //on add input button click
    $(AddButton).click(function (e) {
            //max input box allowed
            if(x <= MaxInputs) {
                FieldCount++; //text box added ncrement
                //add input box
                $(InputsWrapper).append('<div class="md-form mb-0"><select id="field_'+ FieldCount +'" name ="myTask[]" class="mdb-select md-form mb-0 svs-select"><option value="" selected disabled>Select Task</option><?php if(count($task_record)) { foreach($task_record as $field) { ?><option value="<?php echo $field->taskCode; ?>"><?php echo $field->task_title; ?></option> <?php } } ?> </select><a href="#" class="removeclass">Remove</a></div>');
                x++; //text box increment
                
                $("#AddMoreFileId").show();
                
                $('AddMoreFileBox').html("Add field");
                
                // Delete the "add"-link if there is 3 fields.
                if(x == 6) {
                    $("#AddMoreFileId").hide();
                    $("#lineBreak").html("<br>");
                }
            }
            return false;
    });

    $("body").on("click",".removeclass", function(e){ //user click on remove text
            if( x > 1 ) {
                    $(this).parent('div').remove(); //remove text box
                    x--; //decrement textbox

                    $("#AddMoreFileId").show();
                
                    $("#lineBreak").html("");
                
                    // Adds the "add" link again when a field is removed.
                    $('AddMoreFileBox').html("Add field");
            }
        return false;
    }) 
});
</script>


<script>
$('#subNewProj').click(function(){ 
    var proj_title = $('#proj_title').val();
    var proj_desc = $('#proj_desc').val();

    var lon = $('#lon').html();
    var lat = $('#lat').html();
    var addr = $('#addr').val();

    var est_start_d = $('#estStartD').val();
    var est_start_t = $('#estStartT').val();
    var est_end_d = $('#estEndD').val();
    var est_end_t = $('#estEndT').val();

    var act_start_d = $('#actStartD').val();
    var act_start_t = $('#actStartT').val();
    var act_end_d = $('#actEndD').val();
    var act_end_t = $('#actEndT').val();

    //Split Select v1
    // var task = document.getElementsByName('myTask[]');
    // for (var i = 0, iLen = task.length; i < iLen; i++) {
    //     alert(task[i].value);
    // }

    //Split Select v2
    // var myTask = document.getElementsByName('myTask[]');
    // var myTaskArr = [];
    // myTask.forEach(function(element) {
    //     console.log(element.value);
    //     myTaskArr.push(element.value);
    // });
    // var taskData = JSON.stringify(myTaskArr);

    // var myEmp = document.getElementsByName('empSol[]');
    // var myEmpArr = [];
    // myEmp.forEach(function(element) {
    //     console.log(element.value);
    //     myEmpArr.push(element.value);
    // });
    // var empData = JSON.stringify(myEmpArr);

    // var myPm = document.getElementsByName('pmSol[]');
    // var myPmArr = [];
    // myPm.forEach(function(element) {
    //     console.log(element.value);
    //     myPmArr.push(element.value);
    // });
    // var pmData = JSON.stringify(myPmArr);

    // //Split Select v3
    // const taskData = Array.from(
    //     document.getElementsByName('myTask[]'),
    //     select => select.value
    // );

    var taskData = []; 
    $("input:checkbox[name=myTask]:checked").each(function() { 
        taskData.push($(this).val()); 
    }); 

    var empData = []; 
    $("input:checkbox[name=empSol]:checked").each(function() { 
        empData.push($(this).val()); 
    }); 

    var pmData = []; 
    $("input:checkbox[name=pmSol]:checked").each(function() { 
        pmData.push($(this).val()); 
    }); 

//Ajax
    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('new_project') }}",
        method: "POST",
        data:{
            type:"NEWPROJECT",
            proj_title:proj_title,
            proj_desc:proj_desc,
            lon:lon,
            lat:lat,
            addr:addr,
            est_start_d:est_start_d,
            est_start_t:est_start_t,
            est_end_d:est_end_d,
            est_end_t:est_end_t,
            act_start_d:act_start_d,
            act_start_t:act_start_t,
            act_end_d:act_end_d,
            act_end_t:act_end_t,
            taskData:taskData,
            empData:empData,
            pmData:pmData
        }, 
        dataType: "json",
        success:function(data)
        {
            if(data.success.length > 0){
                
                var x = document.getElementById("subNewProj");
                x.innerHTML = "Loading..";
                document.getElementById("subNewProj").disabled = true;

                $.ajax({
                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    url: "{{ route('save_project') }}",
                    method: "POST",
                    data:{
                        type:"NEWPROJECT",
                        proj_title:proj_title,
                        proj_desc:proj_desc,
                        lon:lon,
                        lat:lat,
                        addr:addr,
                        est_start_d:est_start_d,
                        est_start_t:est_start_t,
                        est_end_d:est_end_d,
                        est_end_t:est_end_t,
                        act_start_d:act_start_d,
                        act_start_t:act_start_t,
                        act_end_d:act_end_d,
                        act_end_t:act_end_t,
                        taskData:taskData,
                        empData:empData,
                        pmData:pmData
                    }, 
                    dataType: "json",
                    success:function(data)
                    {
                        if(data.success.length > 0){
                            var projCode = data.success[0];
                            $.ajax({
                                headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                                url: "{{ route('session_success') }}",
                                method: "POST",
                                data:{
                                    type:"NEWPROJECT",
                                    proj_title:proj_title,
                                    proj_desc:proj_desc,
                                    lon:lon,
                                    lat:lat,
                                    addr:addr,
                                    code:projCode
                                }, 
                                dataType: "json",
                                success:function(data)
                                {
                                    if(data.success.length > 0){
                                        location.reload();
                                        // toastr.success(data.success[0]);
                                    }else{
                                        toastr.error(data.error[0]);
                                    }
                                },
                                error: function(xhr, ajaxOptions, thrownError){
                                    console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });    
                        }else{
                            toastr.error(data.error[0]);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });    
            }else{
                toastr.error(data.error[0]);
            }
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });    
//Ajax

});
</script>

@endsection