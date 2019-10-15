@extends('layouts.app_admin')
@section('content')

<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-file-alt"></i> Project List</h2></div>
    <!-- Button trigger modal-->
    <button type="button" class="btn btn-primary float-right" id="newProject"><i class="fa fa-plus"></i>&nbsp;New Project</button>
    
    <div class="container" style="margin-top:3em;">

            @include('main.sessionProj')

    <div class="container svs-overflow">
        <table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
            <th class="th-sm">Name
            </th>
            <th class="th-sm">Position
            </th>
            <th class="th-sm">Office
            </th>
            <th class="th-sm">Age
            </th>
            <th class="th-sm">Start date
            </th>
            <th class="th-sm">Salary
            </th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <td>Tiger Nixon</td>
            <td>System Architect</td>
            <td>Edinburgh</td>
            <td>61</td>
            <td>2011/04/25</td>
            <td>$320,800</td>
            </tr>
            <tr>
            <td>Garrett Winters</td>
            <td>Accountant</td>
            <td>Tokyo</td>
            <td>63</td>
            <td>2011/07/25</td>
            <td>$170,750</td>
            </tr>
            <tr>
            <td>Ashton Cox</td>
            <td>Junior Technical Author</td>
            <td>San Francisco</td>
            <td>66</td>
            <td>2009/01/12</td>
            <td>$86,000</td>
            </tr>
            <tr>
            <td>Cedric Kelly</td>
            <td>Senior Javascript Developer</td>
            <td>Edinburgh</td>
            <td>22</td>
            <td>2012/03/29</td>
            <td>$433,060</td>
            </tr>
            <tr>
            <td>Airi Satou</td>
            <td>Accountant</td>
            <td>Tokyo</td>
            <td>33</td>
            <td>2008/11/28</td>
            <td>$162,700</td>
            </tr>
            <tr>
            <td>Brielle Williamson</td>
            <td>Integration Specialist</td>
            <td>New York</td>
            <td>61</td>
            <td>2012/12/02</td>
            <td>$372,000</td>
            </tr>
            <tr>
            <td>Herrod Chandler</td>
            <td>Sales Assistant</td>
            <td>San Francisco</td>
            <td>59</td>
            <td>2012/08/06</td>
            <td>$137,500</td>
            </tr>
            <tr>
            <td>Rhona Davidson</td>
            <td>Integration Specialist</td>
            <td>Tokyo</td>
            <td>55</td>
            <td>2010/10/14</td>
            <td>$327,900</td>
            </tr>
            <tr>
            <td>Colleen Hurst</td>
            <td>Javascript Developer</td>
            <td>San Francisco</td>
            <td>39</td>
            <td>2009/09/15</td>
            <td>$205,500</td>
            </tr>
            <tr>
            <td>Sonya Frost</td>
            <td>Software Engineer</td>
            <td>Edinburgh</td>
            <td>23</td>
            <td>2008/12/13</td>
            <td>$103,600</td>
            </tr>
            <tr>
            <td>Jena Gaines</td>
            <td>Office Manager</td>
            <td>London</td>
            <td>30</td>
            <td>2008/12/19</td>
            <td>$90,560</td>
            </tr>
            <tr>
            <td>Quinn Flynn</td>
            <td>Support Lead</td>
            <td>Edinburgh</td>
            <td>22</td>
            <td>2013/03/03</td>
            <td>$342,000</td>
            </tr>
            <tr>
            <td>Charde Marshall</td>
            <td>Regional Director</td>
            <td>San Francisco</td>
            <td>36</td>
            <td>2008/10/16</td>
            <td>$470,600</td>
            </tr>
            <tr>
            <td>Haley Kennedy</td>
            <td>Senior Marketing Designer</td>
            <td>London</td>
            <td>43</td>
            <td>2012/12/18</td>
            <td>$313,500</td>
            </tr>
            <tr>
            <td>Tatyana Fitzpatrick</td>
            <td>Regional Director</td>
            <td>London</td>
            <td>19</td>
            <td>2010/03/17</td>
            <td>$385,750</td>
            </tr>
            <tr>
            <td>Michael Silva</td>
            <td>Marketing Designer</td>
            <td>London</td>
            <td>66</td>
            <td>2012/11/27</td>
            <td>$198,500</td>
            </tr>
            <tr>
            <td>Paul Byrd</td>
            <td>Chief Financial Officer (CFO)</td>
            <td>New York</td>
            <td>64</td>
            <td>2010/06/09</td>
            <td>$725,000</td>
            </tr>
            <tr>
            <td>Gloria Little</td>
            <td>Systems Administrator</td>
            <td>New York</td>
            <td>59</td>
            <td>2009/04/10</td>
            <td>$237,500</td>
            </tr>
            <tr>
            <td>Bradley Greer</td>
            <td>Software Engineer</td>
            <td>London</td>
            <td>41</td>
            <td>2012/10/13</td>
            <td>$132,000</td>
            </tr>
            <tr>
            <td>Dai Rios</td>
            <td>Personnel Lead</td>
            <td>Edinburgh</td>
            <td>35</td>
            <td>2012/09/26</td>
            <td>$217,500</td>
            </tr>
            <tr>
            <td>Jenette Caldwell</td>
            <td>Development Lead</td>
            <td>New York</td>
            <td>30</td>
            <td>2011/09/03</td>
            <td>$345,000</td>
            </tr>
            <tr>
            <td>Yuri Berry</td>
            <td>Chief Marketing Officer (CMO)</td>
            <td>New York</td>
            <td>40</td>
            <td>2009/06/25</td>
            <td>$675,000</td>
            </tr>
            <tr>
            <td>Caesar Vance</td>
            <td>Pre-Sales Support</td>
            <td>New York</td>
            <td>21</td>
            <td>2011/12/12</td>
            <td>$106,450</td>
            </tr>
            <tr>
            <td>Doris Wilder</td>
            <td>Sales Assistant</td>
            <td>Sidney</td>
            <td>23</td>
            <td>2010/09/20</td>
            <td>$85,600</td>
            </tr>
            <tr>
            <td>Angelica Ramos</td>
            <td>Chief Executive Officer (CEO)</td>
            <td>London</td>
            <td>47</td>
            <td>2009/10/09</td>
            <td>$1,200,000</td>
            </tr>
            <tr>
            <td>Gavin Joyce</td>
            <td>Developer</td>
            <td>Edinburgh</td>
            <td>42</td>
            <td>2010/12/22</td>
            <td>$92,575</td>
            </tr>
            <tr>
            <td>Jennifer Chang</td>
            <td>Regional Director</td>
            <td>Singapore</td>
            <td>28</td>
            <td>2010/11/14</td>
            <td>$357,650</td>
            </tr>
            <tr>
            <td>Brenden Wagner</td>
            <td>Software Engineer</td>
            <td>San Francisco</td>
            <td>28</td>
            <td>2011/06/07</td>
            <td>$206,850</td>
            </tr>
            <tr>
            <td>Fiona Green</td>
            <td>Chief Operating Officer (COO)</td>
            <td>San Francisco</td>
            <td>48</td>
            <td>2010/03/11</td>
            <td>$850,000</td>
            </tr>
            <tr>
            <td>Shou Itou</td>
            <td>Regional Marketing</td>
            <td>Tokyo</td>
            <td>20</td>
            <td>2011/08/14</td>
            <td>$163,000</td>
            </tr>
            <tr>
            <td>Michelle House</td>
            <td>Integration Specialist</td>
            <td>Sidney</td>
            <td>37</td>
            <td>2011/06/02</td>
            <td>$95,400</td>
            </tr>
            <tr>
            <td>Suki Burks</td>
            <td>Developer</td>
            <td>London</td>
            <td>53</td>
            <td>2009/10/22</td>
            <td>$114,500</td>
            </tr>
            <tr>
            <td>Prescott Bartlett</td>
            <td>Technical Author</td>
            <td>London</td>
            <td>27</td>
            <td>2011/05/07</td>
            <td>$145,000</td>
            </tr>
            <tr>
            <td>Gavin Cortez</td>
            <td>Team Leader</td>
            <td>San Francisco</td>
            <td>22</td>
            <td>2008/10/26</td>
            <td>$235,500</td>
            </tr>
            <tr>
            <td>Martena Mccray</td>
            <td>Post-Sales support</td>
            <td>Edinburgh</td>
            <td>46</td>
            <td>2011/03/09</td>
            <td>$324,050</td>
            </tr>
            <tr>
            <td>Unity Butler</td>
            <td>Marketing Designer</td>
            <td>San Francisco</td>
            <td>47</td>
            <td>2009/12/09</td>
            <td>$85,675</td>
            </tr>
            <tr>
            <td>Howard Hatfield</td>
            <td>Office Manager</td>
            <td>San Francisco</td>
            <td>51</td>
            <td>2008/12/16</td>
            <td>$164,500</td>
            </tr>
            <tr>
            <td>Hope Fuentes</td>
            <td>Secretary</td>
            <td>San Francisco</td>
            <td>41</td>
            <td>2010/02/12</td>
            <td>$109,850</td>
            </tr>
            <tr>
            <td>Vivian Harrell</td>
            <td>Financial Controller</td>
            <td>San Francisco</td>
            <td>62</td>
            <td>2009/02/14</td>
            <td>$452,500</td>
            </tr>
            <tr>
            <td>Timothy Mooney</td>
            <td>Office Manager</td>
            <td>London</td>
            <td>37</td>
            <td>2008/12/11</td>
            <td>$136,200</td>
            </tr>
            <tr>
            <td>Jackson Bradshaw</td>
            <td>Director</td>
            <td>New York</td>
            <td>65</td>
            <td>2008/09/26</td>
            <td>$645,750</td>
            </tr>
            <tr>
            <td>Olivia Liang</td>
            <td>Support Engineer</td>
            <td>Singapore</td>
            <td>64</td>
            <td>2011/02/03</td>
            <td>$234,500</td>
            </tr>
            <tr>
            <td>Bruno Nash</td>
            <td>Software Engineer</td>
            <td>London</td>
            <td>38</td>
            <td>2011/05/03</td>
            <td>$163,500</td>
            </tr>
            <tr>
            <td>Sakura Yamamoto</td>
            <td>Support Engineer</td>
            <td>Tokyo</td>
            <td>37</td>
            <td>2009/08/19</td>
            <td>$139,575</td>
            </tr>
            <tr>
            <td>Thor Walton</td>
            <td>Developer</td>
            <td>New York</td>
            <td>61</td>
            <td>2013/08/11</td>
            <td>$98,540</td>
            </tr>
            <tr>
            <td>Finn Camacho</td>
            <td>Support Engineer</td>
            <td>San Francisco</td>
            <td>47</td>
            <td>2009/07/07</td>
            <td>$87,500</td>
            </tr>
            <tr>
            <td>Serge Baldwin</td>
            <td>Data Coordinator</td>
            <td>Singapore</td>
            <td>64</td>
            <td>2012/04/09</td>
            <td>$138,575</td>
            </tr>
            <tr>
            <td>Zenaida Frank</td>
            <td>Software Engineer</td>
            <td>New York</td>
            <td>63</td>
            <td>2010/01/04</td>
            <td>$125,250</td>
            </tr>
            <tr>
            <td>Zorita Serrano</td>
            <td>Software Engineer</td>
            <td>San Francisco</td>
            <td>56</td>
            <td>2012/06/01</td>
            <td>$115,000</td>
            </tr>
            <tr>
            <td>Jennifer Acosta</td>
            <td>Junior Javascript Developer</td>
            <td>Edinburgh</td>
            <td>43</td>
            <td>2013/02/01</td>
            <td>$75,650</td>
            </tr>
            <tr>
            <td>Cara Stevens</td>
            <td>Sales Assistant</td>
            <td>New York</td>
            <td>46</td>
            <td>2011/12/06</td>
            <td>$145,600</td>
            </tr>
            <tr>
            <td>Hermione Butler</td>
            <td>Regional Director</td>
            <td>London</td>
            <td>47</td>
            <td>2011/03/21</td>
            <td>$356,250</td>
            </tr>
            <tr>
            <td>Lael Greer</td>
            <td>Systems Administrator</td>
            <td>London</td>
            <td>21</td>
            <td>2009/02/27</td>
            <td>$103,500</td>
            </tr>
            <tr>
            <td>Jonas Alexander</td>
            <td>Developer</td>
            <td>San Francisco</td>
            <td>30</td>
            <td>2010/07/14</td>
            <td>$86,500</td>
            </tr>
            <tr>
            <td>Shad Decker</td>
            <td>Regional Director</td>
            <td>Edinburgh</td>
            <td>51</td>
            <td>2008/11/13</td>
            <td>$183,000</td>
            </tr>
            <tr>
            <td>Michael Bruce</td>
            <td>Javascript Developer</td>
            <td>Singapore</td>
            <td>29</td>
            <td>2011/06/27</td>
            <td>$183,000</td>
            </tr>
            <tr>
            <td>Donna Snider</td>
            <td>Customer Support</td>
            <td>New York</td>
            <td>27</td>
            <td>2011/01/25</td>
            <td>$112,000</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
            <th>Name
            </th>
            <th>Position
            </th>
            <th>Office
            </th>
            <th>Age
            </th>
            <th>Start date
            </th>
            <th>Salary
            </th>
            </tr>
        </tfoot>
        </table>
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

                 {{-- <!--Grid row-->
                 <div class="row" style="margin-top:1.5em;">
                    <!--Grid column-->
                    <div class="col-md-6">
                        <label for="pmSelect" class="svs-small"><small>Project Manager</small></label>
                        <select id="pmSelect" class="mdb-select md-form mb-0 svs-select">
                            <option value="" selected disabled>Choose Project Manager</option>
                            @if(count($user_record))
                                @foreach($user_record as $field)
                                    <option value="{{$field->id}}">{{$field->name}}</option>
                                @endforeach
                            @else
                                <option value="">No record found..</option>
                            @endif
                        </select>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <label for="demoSOL" class="svs-small"><small>Employee</small></label>
                        <select id="demoSOL" name="employeeSol" class="mdb-select multi-sol-svs" multiple="multiple">
                            <optgroup label="Employee Name" title="Opiton Group 1">
                                @if(count($user_record))
                                    @foreach($user_record as $field)
                                        <option title="Subgroup 1" value="{{$field->id}}">{{$field->name}}</option>
                                    @endforeach
                                @else
                                    <option value="" title="Subgroup 1">No record found..</option>
                                @endif
                            </optgroup>
                        </select>
                    </div>
                </div>
                <!--Grid row--> --}}

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

                <div class="row">
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
                </div>
            </form>

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


    // var task = document.getElementsByName('myTask[]');
    // for (var i = 0, iLen = task.length; i < iLen; i++) {
    //     alert(task[i].value);
    // }

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
            act_end_t:act_end_t
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
                        act_end_t:act_end_t
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

});
</script>
@endsection