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
                        
                        {{-- <div id="map" style="width: 100%; height:300px;"></div>
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
                        </script> --}}
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
    
    function chooseAddr(lat1, lng1, add1)
    {
     myMarker.closePopup();
     map.setView([lat1, lng1],15);
     myMarker.setLatLng([lat1, lng1]);
     lat = lat1.toFixed(8);
     lon = lng1.toFixed(8);
     document.getElementById('lat').value = lat;
     document.getElementById('lon').value = lon;addr
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
       out += "<div class='address container-fluid card svs-map-add' title='Show Location and Coordinates' onclick='chooseAddr(" + arr[i].lat + ", " + arr[i].lon + ",\"" + arr[i].display_name + "\");return false;'>" + arr[i].display_name + "</div>";
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
    $("#newProject").click(function () {
        $('#modalLoc').modal('show');
        setTimeout(function(){ map.invalidateSize()}, 500);
    });
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