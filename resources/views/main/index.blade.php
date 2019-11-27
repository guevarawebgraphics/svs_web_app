@extends('layouts.app_admin')
@section('content')
<!--Grid row-->

<style>
ul {
  list-style-type: none;
}
.table-view {
  border-collapse: collapse;
  width: 100%;
}

.table-view td{
  /* padding: 4px 4px; */
  text-align: left;
}

/* .table-view tr:nth-child(even){background-color: #f2f2f2;}

.table-view tr:hover {background-color: #ddd;} */

.table-view th {
  /* padding: 12px 12px; */
  text-align: left;
}

</style>

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

        <div class="row proj-status-list" style="margin-top: 8em;">
            @if(count($view_project_percentage))
            @php
            $counter = 0;    
            @endphp
                <div class="col-md-12 element-item">
                    <div class="card-deck two-col">
                @foreach($view_project_percentage as $field)
                    <div class="proj-status-item rounded-rectangle-svs card current-proj showModal" data-modalid="{{$counter}}" data-code="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-percent="{{$field->total_weight_progress}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}" data-lon="{{$field->longitude}}" data-lat="{{$field->latitude}}" data-byname="{{$field->updated_by}}" data-cdate="{{$field->created_at}}" data-issue="{{$field->issue}}" data-report="{{$field->report}}">
                            <h5 class="svs-text"><b>{{$field->proj_title}}</b></h5>
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
                    @php
                        $counter++;   
                    @endphp
                @endforeach
                    </div>
                </div>
            @endif
        </div>

    </div>
    <!--Grid column-->


<!--Grid row-->

<!-- Modal: Task -->
<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog svs-modal" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">View Project : <span id="vproj"></span>&nbsp;&nbsp;-&nbsp;&nbsp;<b><span class="svs-text-2" id="vper"></span></b></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
                <p class="note note-light">
                    <strong>Reminder:</strong> 
                    Shows the broad details about this project
                    <br>
                </p>
            <div class="row">
                <div class="col-md-6 font-svs">
                    {{-- <a href="" name="lon" id="lon" style="display:none;"></a>
                    <a href="" name="lat" id="lat" style="display:none;"></a> --}}

                    {{-- <div id="svsMap" style="width: 100%; height:300px;"></div> --}}

                    <br>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><b>Project Code : </b><label id="vCode"></label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Title : </b><label id="vTitle"></label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><b>Description : </b><label id="vDesc"></label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Location : </b><label id="vLoc"></label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><b>Estimated Start Date : </b><label id="vEst"></label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Estimated End Date : </b><label id="vEet"></label></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><b>Actual Start Date : </b><label id="vAst"></label></td>
                                    </tr>
                                    <tr>
                                        <td><b>Actual End Date : </b><label id="vAet"></label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br>
                       
                        
                    </div>
                    <br>
                    <div class="row container">
                        <div class="col-md-3">
                            <center><a class="svs-text-center">Reports</a></center>
                            <br>
                            <div class="card rounded-circle svs-circle btn-danger"><h5 class="svs-round-text"><b id="vReport">23</b></h5></div>
                        </div>
                        <div class="col-md-3">
                            <center><a class="svs-text-center">Issues</a></center>
                            <br>
                            <div class="card rounded-circle svs-circle btn-warning"><h5 class="svs-round-text"><b id="vIssue">23</b></h5></div>
                        </div>
                        <div class="col-md-3">
                            <center><a class="svs-text-center">Project Status</a></center>
                            <br>
                            <div class="card rounded-circle svs-circle btn-info"><h5 class="svs-round-text"><b id="vStatus">23</b></h5></div>
                        </div>
                        <div class="col-md-3">
                            <center><a class="svs-text-center">Remaining Days</a></center>
                            <br>
                            <div class="card rounded-circle svs-circle btn-success"><h5 class="svs-round-text"><b id="vRDays">3</b></h5></div>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-md-6 font-svs">
                    <!-- Classic tabs -->
                    <div class="classic-tabs mx-2">

                        <ul class="nav tabs-cyan" id="myClassicTabShadow" role="tablist">
                            <li class="nav-item svs-nav-item">
                                <a class="nav-link font-svs-normal waves-light active show" id="log-tab-classic-shadow" data-toggle="tab" href="#log-classic-shadow"
                                role="tab" aria-controls="log-classic-shadow" aria-selected="false">Project Logs</a>
                            </li>
                            <li class="nav-item svs-nav-item">
                                <a class="nav-link font-svs-normal waves-light" id="profile-tab-classic-shadow" data-toggle="tab" href="#profile-classic-shadow"
                                role="tab" aria-controls="profile-classic-shadow" aria-selected="true">Task</a>
                            </li>
                            <li class="nav-item svs-nav-item">
                                <a class="nav-link font-svs-normal waves-light" id="follow-tab-classic-shadow" data-toggle="tab" href="#follow-classic-shadow"
                                role="tab" aria-controls="follow-classic-shadow" aria-selected="false">Project Manager</a>
                            </li>
                            <li class="nav-item svs-nav-item">
                                <a class="nav-link font-svs-normal waves-light" id="contact-tab-classic-shadow" data-toggle="tab" href="#contact-classic-shadow"
                                role="tab" aria-controls="contact-classic-shadow" aria-selected="false">Employee</a>
                            </li>
                            <li class="nav-item svs-nav-item">
                                <a class="nav-link font-svs-normal waves-light" id="stake-tab-classic-shadow" data-toggle="tab" href="#stake-classic-shadow"
                                role="tab" aria-controls="stake-classic-shadow" aria-selected="true">Stakeholder</a>
                            </li>
                            {{-- <li class="nav-item svs-nav-item">
                                <a class="nav-link font-svs-normal waves-light" id="customer-tab-classic-shadow" data-toggle="tab" href="#customer-classic-shadow"
                                role="tab" aria-controls="customer-classic-shadow" aria-selected="true">Customer</a>
                            </li> --}}
                        </ul>
                    
                        <div class="tab-content" id="myClassicTabContentShadow">
                            <div class="tab-pane fade active show" id="log-classic-shadow" role="tabpanel" aria-labelledby="log-tab-classic-shadow">
                                    <div class="container svs-overflow">
                                        <table id="logViewMod" class="table table-striped table-view log-tb-mod" cellspacing="0" width="100%" summary="test">
                                            <colgroup>
                                                <col width="40px">
                                                    <col span="4" width="25%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th><small><b>Date</b></small></th>
                                                    <th><small><b>Activity</b></small></th>
                                                    <th><small><b>Type</b></small></th>
                                                    <th><small><b>SubmittedBy</b></small></th>
                                                    <th><small><b>Attachment</b></small></th>
                                                </tr>
                                            </thead>
                                            <tbody id="logView">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <div class="tab-pane fade" id="profile-classic-shadow" role="tabpanel" aria-labelledby="profile-tab-classic-shadow">
                                    <div class="container svs-overflow">
                                        <table id="taskViewMod" class="table table-striped table-view task-tb-mod" cellspacing="0" width="100%" summary="test">
                                            <colgroup>
                                                <col width="40px">
                                                    <col span="4" width="25%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th><small><b>TaskCode</b></small></th>
                                                    <th><small><b>Title</b></small></th>
                                                    <th><small><b>Description</b></small></th>
                                                    <th><small><b>Total%/Weight</b></small></th>
                                                    <th><small><b>PlanDays</b></small></th>
                                                    <th><small><b>ActualDays</b></small></th>
                                                    <th><small><b>Action</b></small></th>
                                                </tr>
                                            </thead>
                                            <tbody id="taskView">

                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <div class="tab-pane fade" id="follow-classic-shadow" role="tabpanel" aria-labelledby="follow-tab-classic-shadow">
                                    <div class="container svs-overflow">
                                        <table id="pmViewMod" class="table table-striped table-view pm-tb-mod" cellspacing="0" width="100%" summary="test">
                                            <colgroup>
                                                <col width="40px">
                                                    <col span="4" width="25%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th><small><b>Project Manager</b></small></th>
                                                    <th><small><b>Email</b></small></th>
                                                    <th><small><b>Position</b></small></th>
                                                </tr>
                                            </thead>
                                            <tbody id="pmView">

                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <div class="tab-pane fade" id="contact-classic-shadow" role="tabpanel" aria-labelledby="contact-tab-classic-shadow">
                                    <div class="container svs-overflow">
                                        <table id="empViewMod" class="table table-striped table-view emp-tb-mod" cellspacing="0" width="100%" summary="test">
                                            <colgroup>
                                                <col width="40px">
                                                    <col span="4" width="25%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th><small><b>Employee</b></small></th>
                                                    <th><small><b>Position</b></small></th>
                                                    <th><small><b>Department</b></small></th>
                                                    <th><small><b>Team</b></small></th>
                                                </tr>
                                            </thead>
                                            <tbody id="empView">

                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <div class="tab-pane fade" id="stake-classic-shadow" role="tabpanel" aria-labelledby="stake-tab-classic-shadow">
                                <div class="container svs-overflow">
                                    <table id="stakeViewMod" class="table table-striped table-view stake-tb-mod" cellspacing="0" width="100%" summary="test">
                                        <colgroup>
                                            <col width="40px">
                                                <col span="4" width="25%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th><small><b>Name</b></small></th>
                                                <th><small><b>Email</b></small></th>
                                                <th><small><b>Position</b></small></th>
                                            </tr>
                                        </thead>
                                        <tbody id="stakeView">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            {{-- <div class="tab-pane fade" id="customer-classic-shadow" role="tabpanel" aria-labelledby="customer-tab-classic-shadow">
                                <div class="container svs-overflow">
                                    <table id="customerViewMod" class="table table-striped table-view customer-tb-mod" cellspacing="0" width="100%" summary="test">
                                        <colgroup>
                                            <col width="40px">
                                                <col span="4" width="25%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th><small><b>Name</b></small></th>
                                                <th><small><b>Email</b></small></th>
                                                <th><small><b>Position</b></small></th>
                                            </tr>
                                        </thead>
                                        <tbody id="customerView">

                                        </tbody>
                                    </table>
                                </div>
                            </div> --}}
                        </div>
                    
                    </div>
                    <!-- Classic tabs -->
                </div>
            </div>
                
      </div>
      <!--Footer-->
      <div class="modal-footer font-svs">
        {{-- <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary waves-effect" id="conSubmit">Continue</button> --}}
            <p id="vFooter"></p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal: openTask -->
<div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog svs-modal-md" role="document">
    <div class="modal-content">
        <!--Header-->
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Report : <span id="titleReport"></span></h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
            </button>
        </div>
        <!--Body-->
        <div class="modal-body">
                <p class="note note-light">
                        <strong>Reminder:</strong> 
                        Shows submitted report from the app.
                        <br>
                    </p>
                <div class="container svs-overflow">
                        <table id="dtOpenTask" class="table table-striped table-view" cellspacing="0" width="100%" summary="test">
                            <colgroup>
                                <col width="40px">
                                    <col span="4" width="25%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><b>Weight</b></th>
                                    <th><b>Report</b></th>
                                    <th><b>Submitted by</b></th>
                                    <th><b>Created At</b></th>
                                </tr>
                            </thead>
                            <tbody id="taskOpenView">

                            </tbody>
                        </table>
                </div>
        </div>
        <!--Footer-->
        <div class="modal-footer font-svs">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        {{-- <button class="btn btn-primary waves-effect">Continue</button> --}}
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal: imgMod -->
<div class="modal fade" id="imgMod" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Activity Image</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        {{-- <p class="note note-success">
            <strong>Download Image:</strong> 
            <em>Click the image to download.</em>
            <br>
        </p> --}}
        <div class="container">
            <a id="activityImgHref" download>
                <img id="activityImg" style="width:100%;height:100%;">
            </a>
        </div>
    

      </div>
      <!--Footer-->
      {{-- <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect" id="upSubmit">Upload</button>
      </div> --}}
    </div>
  </div>
</div>

<script>
$('.proj-status-list').simpleLoadMore({
  item: '.proj-status-item',
  count: 6,
  itemsToLoad: 5,
  btnHTML: '<a href="#" class="btn btn-primary waves-effect load-more__btn" style="height:50px; margin:0 auto; margin-top: 2.5em!important;">View More <i class="fas fa-angle-down"></i></a>'
});
//Prevents showing error for multiple warning alert message
$.fn.dataTable.ext.errMode = 'none';
</script>

<script>
    function activityLog(projCode,attachment){
        var img = attachment;
        $("#activityImg").attr("src","{{ env('APP_API_BACKEND') }}"+img);
        $("#activityImgHref").attr("href","{{ env('APP_API_BACKEND') }}"+img);
        $("#imgMod").modal("show");
        
    }
</script>

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
function openTask(taskCode,projCode,taskTitle){
    $('#taskModal').modal('show');
    $('#titleReport').html(taskTitle);
    var code1 = projCode;
    var code2 = taskCode;
    //Task
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('open_task_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                projCode:code1,
                taskCode:code2
            }, 
            success:function(data)
            {
                $("#taskOpenView").html(data);
                $("#dtOpenTask").DataTable();
                $('#dtOpenTask_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#dtOpenTask_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#dtOpenTask_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#dtOpenTask_wrapper .dataTables_filter').addClass('md-form');
                $('#dtOpenTask_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#dtOpenTask_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#dtOpenTask_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //EndTask
}
</script>

<script>
$(".showModal").click(function () {
    $('#showModal').modal('show');
    // setTimeout(function(){ map.invalidateSize()}, 500);  
    var modalid = $(this).attr('data-modalid');
    var projCode = $(this).attr('data-code');
    var title = $(this).attr('data-title');
    var desc = $(this).attr('data-desc');
    var location = $(this).attr('data-location');
    var percent = $(this).attr('data-percent');

    var issue = $(this).attr('data-issue');
    var report = $(this).attr('data-report');

    var lon = $(this).attr('data-lon');
    var lat = $(this).attr('data-lat');

    var byname = $(this).attr('data-byname');

    var cdate = $(this).attr('data-cdate');
    var now_cdate = new Date(cdate);
    var formatCDate = now_cdate.toLocaleDateString()+" - "+now_cdate.toLocaleTimeString([], {timeStyle: 'short'});


    if(percent != ""){
        var status = $(this).attr('data-percent')+"%";
    }else{
        var status = "0.00%";
    }
    
    var es = $(this).attr('data-esd');
    var now_esd = new Date(es);
    var esd = now_esd.toLocaleDateString()+" - "+now_esd.toLocaleTimeString([], {timeStyle: 'short'});

    var ee = $(this).attr('data-eed');
    var now_eed = new Date(ee);
    var eed = now_eed.toLocaleDateString()+" - "+now_eed.toLocaleTimeString([], {timeStyle: 'short'});

    var as = $(this).attr('data-asd');
    var now_asd = new Date(as);
    var asd = now_asd.toLocaleDateString()+" - "+now_asd.toLocaleTimeString([], {timeStyle: 'short'});

    var ae = $(this).attr('data-aed');
    var now_aed = new Date(ae);
    var aed = now_aed.toLocaleDateString()+" - "+now_aed.toLocaleTimeString([], {timeStyle: 'short'});

    $('#vproj').html(title);
    $('#vCode').html(projCode);
    $('#vTitle').html(title);
    $('#vLoc').html(location);
    $('#vDesc').html(desc);
    $('#vReport').html(report);
    $('#vIssue').html(issue);
    $('#vStatus').html(status);
    $('#vper').html(status);
    $('#vEst').html(esd);
    $('#vEet').html(eed);
    $('#vAst').html(asd);
    $('#vAet').html(aed);
    $('#vFooter').html("Created by : "+byname+"<br><small><em>"+formatCDate+"</small></em>");

    //Get Remaining Days
        var curDate = new Date();
        var date1 = new Date(now_asd.toLocaleDateString());
        var date2 = new Date(now_aed.toLocaleDateString());
        var diffDays = parseInt((date2 - date1) / (1000 * 60 * 60 * 24), 10); 
        if(date1 > curDate){
            if(diffDays < 0)
            {
                remDays = 0;
            }
            else
            {
                remDays = parseInt((date2 - date1) / (1000 * 60 * 60 * 24), 10); 
            }
        }else{
            remDays = 0;
        }
        $('#vRDays').html(remDays);

    //Task
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('task_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"TASK",
                code:projCode
            }, 
            success:function(data)
            {
                $("#taskView").html(data);
                $("#taskViewMod").DataTable();
                $('#taskViewMod_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#taskViewMod_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#taskViewMod_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#taskViewMod_wrapper .dataTables_filter').addClass('md-form');
                $('#taskViewMod_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#taskViewMod_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#taskViewMod_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //EndTask

    //PM
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('pm_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"PM",
                code:projCode
            }, 
            success:function(data)
            {
                $("#pmView").html(data);
                $("#pmViewMod").DataTable();
                $('#pmViewMod_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#pmViewMod_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#pmViewMod_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#pmViewMod_wrapper .dataTables_filter').addClass('md-form');
                $('#pmViewMod_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#pmViewMod_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#pmViewMod_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //EndPM

    //EMP
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('emp_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"EMP",
                code:projCode
            }, 
            success:function(data)
            {
                $("#empView").html(data);
                $("#empViewMod").DataTable();
                $('#empViewMod_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#empViewMod_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#empViewMod_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#empViewMod_wrapper .dataTables_filter').addClass('md-form');
                $('#empViewMod_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#empViewMod_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#empViewMod_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //EndEMP

    //ActivityLogs
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('act_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"ACT",
                code:projCode
            }, 
            success:function(data)
            {
                $("#logView").html(data);
                $("#logViewMod").DataTable();
                $('#logViewMod_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#logViewMod_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#logViewMod_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#logViewMod_wrapper .dataTables_filter').addClass('md-form');
                $('#logViewMod_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#logViewMod_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#logViewMod_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //EndActivityLogs

    //Stakeholder
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('stake_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"STAKE",
                code:projCode
            }, 
            success:function(data)
            {
                $("#stakeView").html(data);
                $("#stakeViewMod").DataTable();
                $('#stakeViewMod_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#stakeViewMod_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#stakeViewMod_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#stakeViewMod_wrapper .dataTables_filter').addClass('md-form');
                $('#stakeViewMod_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#stakeViewMod_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#stakeViewMod_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //Stakeholder

    //Customer
        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('customer_view') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"CUSTOMER",
                code:projCode
            }, 
            success:function(data)
            {
                $("#customerView").html(data);
                $("#customerViewMod").DataTable();
                $('#customerViewMod_wrapper').find('label').each(function () {
                    $(this).parent().append($(this).children());
                });
                $('#customerViewMod_wrapper .dataTables_filter').find('input').each(function () {
                    const $this = $(this);
                    $this.attr("placeholder", "Search");
                    $this.removeClass('form-control-sm');
                });
                $('#customerViewMod_wrapper .dataTables_length').addClass('d-flex flex-row');
                $('#customerViewMod_wrapper .dataTables_filter').addClass('md-form');
                $('#customerViewMod_wrapper select').removeClass(
                'custom-select custom-select-sm form-control form-control-sm');
                $('#customerViewMod_wrapper select').addClass('mdb-select');
                // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                $('#customerViewMod_wrapper .dataTables_filter').find('label').remove();
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //Customer

    // SelectAddr(Number(lat),Number(lon),'\"'+location+'"\'');

});
</script>

<script>
//Map
    // var startlat = 14.56051510;
    // var startlon = 121.07671290;

    // var options = {
    // center: [startlat, startlon],
    // zoom: 15
    // }

    // document.getElementById('lat').innerHTML = startlat;
    // document.getElementById('lon').innerHTML = startlon;

    // var map = L.map('svsMap', options);
    // var nzoom = 15;

    // L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'OSM'}).addTo(map);

    // var myMarker = L.marker([startlat, startlon], {title: "Coordinates", alt: "Coordinates", draggable: true}).addTo(map).on('dragend', function() {
    //     var lat = myMarker.getLatLng().lat.toFixed(8);
    //     var lon = myMarker.getLatLng().lng.toFixed(8);
    //     var czoom = map.getZoom();
    //     if(czoom < 18) { nzoom = czoom + 2; }
    //     if(nzoom > 18) { nzoom = 18; }
    //     if(czoom != 18) { map.setView([lat,lon], nzoom); } else { map.setView([lat,lon]); }
    //     document.getElementById('lat').value = lat;
    //     document.getElementById('lon').value = lon;
    //     myMarker.bindPopup("Lat " + lat + "<br />Lon " + lon).openPopup();
    // });

    // function SelectAddr(lat1, lng1, add1)
    // {
    //     myMarker.closePopup();
    //     map.setView([lat1, lng1],15);
    //     myMarker.setLatLng([lat1, lng1]);
    //     lat = lat1.toFixed(8);
    //     lon = lng1.toFixed(8);
    //     document.getElementById('lat').innerHTML = lat;
    //     document.getElementById('lon').innerHTML = lon;
    //     // document.getElementById('addr').value = add1;
    //     // myMarker.bindPopup("Latitude : " + lat + " Longitude : " + lon+ " Location : " + add1).openPopup();
    // }

    // function myFunction(arr)
    // {
    //     var out = "<br />";
    //     var i;
        
    //     if(arr.length > 0)
    //     {
    //     for(i = 0; i < arr.length; i++)
    //     {
    //     out += "<div class='address container-fluid card svs-map-add' title='Show Location and Coordinates' onclick='SelectAddr(" + arr[i].lat + ", " + arr[i].lon + ",\"" + arr[i].display_name + "\");return false;'>" + arr[i].display_name + "</div>";
    //     }
    //     document.getElementById('results').innerHTML = out;
    //     }
    //     else
    //     {
    //     document.getElementById('results').innerHTML = "Sorry, no results...";
    //     }
    // }

    // function addr_search()
    // {
    //     var inp = document.getElementById("addr");
    //     var xmlhttp = new XMLHttpRequest();
    //     var url = "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + inp.value;
    //     xmlhttp.onreadystatechange = function()
    //     {
    //     if (this.readyState == 4 && this.status == 200)
    //     {
    //         var myArr = JSON.parse(this.responseText);
    //         myFunction(myArr);
    //     }
    //     };
    //     xmlhttp.open("GET", url, true);
    //     xmlhttp.send();
    // }

//EndMap
</script>
@endsection