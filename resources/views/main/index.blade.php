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

.font-svs{
    font-size:.9rem;
    font-weight:300;
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

        <div class="row" style="margin-top: 8em;">
            @if(count($view_project_percentage))
                @foreach($view_project_percentage as $field)
                    <div class="col-md-6">
                    <div class="rounded-rectangle-svs card current-proj showModal" data-code="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-percent="{{$field->total_weight_progress}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}" data-lon="{{$field->longitude}}" data-lat="{{$field->latitude}}" data-byname="{{$field->updated_by}}" data-cdate="{{$field->created_at}}">
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
                    <a href="" name="lon" id="lon" style="display:none;"></a>
                    <a href="" name="lat" id="lat" style="display:none;"></a>

                    <div id="svsMap" style="width: 100%; height:300px;"></div>
                    <br>
                    
                        <b>Project Code : </b><label id="vCode"></label><br>
                        <b>Title : </b><label id="vTitle"></label><br>
                        <b>Description : </b><label id="vDesc"></label><br>
                        <b>Location : </b><label id="vLoc"></label><br>
                        <b>Project Status : </b><label id="vStatus"></label>
                </div>
                <div class="col-md-6 font-svs">
                
                        <b>Estimated Start Date : </b><label id="vEst"></label><br>
                        <b>Estimated End Date : </b><label id="vEet"></label><br><br>
                        <b>Actual Start Date : </b><label id="vAst"></label><br>
                        <b>Actual End Date : </b><label id="vAet"></label><br><br>
                    <div class="" style="overflow-x:auto;">
                            <table class="table-view">
                                <thead>
                                    <tr>
                                        <th><b>Task Code</b></th>
                                        <th><b>Title</b></th>
                                        <th><b>Description</b></th>
                                        <th><b>Weight</b></th>
                                    </tr>
                                </thead>
                                <tbody id="taskView">

                                </tbody>
                            </table>
                    </div>
                    <br>
                    <div class="" style="overflow-x:auto;">
                            <table class="table-view">
                                <thead>
                                    <tr>
                                        <th><b>Project Manager</b></th>
                                        <th><b>Position</b></th>
                                        <th><b>Department</b></th>
                                        <th><b>Team</b></th>
                                    </tr>
                                </thead>
                                <tbody id="pmView">

                                </tbody>
                            </table>
                    </div>
                    <br>
                    <div class="" style="overflow-x:auto;">
                            <table class="table-view">
                                <thead>
                                    <tr>
                                        <th><b>Employee</b></th>
                                        <th><b>Position</b></th>
                                        <th><b>Department</b></th>
                                        <th><b>Team</b></th>
                                    </tr>
                                </thead>
                                <tbody id="empView">

                                </tbody>
                            </table>
                    </div>
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
    setTimeout(function(){ map.invalidateSize()}, 500);
    var projCode = $(this).attr('data-code');
    var title = $(this).attr('data-title');
    var desc = $(this).attr('data-desc');
    var location = $(this).attr('data-location');
    var percent = $(this).attr('data-percent');

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
    $('#vStatus').html(status);
    $('#vper').html(status);
    

    $('#vEst').html(esd);
    $('#vEet').html(eed);

    $('#vAst').html(asd);
    $('#vAet').html(aed);

    $('#vFooter').html("Created by : "+byname+"<br><small><em>"+formatCDate+"</small></em>");

    

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
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    //EndEMP

    // SelectAddr(" + arr[i].lat + ", " + arr[i].lon + ",\"" + arr[i].display_name + "\");
    SelectAddr(Number(lat),Number(lon),'\"'+location+'"\'');
});
</script>

<script>

//Map
    var startlat = 14.56051510;
    var startlon = 121.07671290;

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
        // document.getElementById('addr').value = add1;
        // myMarker.bindPopup("Latitude : " + lat + " Longitude : " + lon+ " Location : " + add1).openPopup();
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

//EndMap
</script>

@endsection