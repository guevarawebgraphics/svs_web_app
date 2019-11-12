
        <div id="table-wrap">
                <table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%" summary="test">
                    <colgroup>
                        <col width="40px">
                            <col span="4" width="25%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="th-sm">Project Code
                            </th>
                            <th class="th-sm">Project Title
                            </th>
                            <th class="th-sm">Project Desc
                            </th>
                            <th class="th-sm">Location
                            </th>
                            <th class="th-sm">Project Status
                            </th>
                            <th class="th-sm">CreatedAt
                            </th>
                            <th class="th-lg">Action
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @if(count($project_record))
                            @foreach($project_record as $field)
                                <tr>
                                    <td>{{$field->proj_code}}</td>
                                    <td>{{$field->proj_title}}</td>
                                    <td>{{$field->proj_desc}}</td>
                                    <td><p>{{$field->location}}</p></td>
                                    <td>
                                        @if(!empty($field->total_weight_progress))
                                            {{$field->total_weight_progress}}%
                                        @else
                                            0.00%
                                        @endif
                                    </td>
                                    <td>{{date("F d Y - h:i a",strtotime($field->created_at))}}</td>
                                    <td>
                                        <div class="row text-center">
                                        <button class="svs-action rowdt btn" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-href="{{$field->id}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}" data-percent="{{$field->total_weight_progress}}"><i class="fa fa-list"></i></button>
                                        <button class="svs-action delProj btn" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-lon="{{$field->longitude}}" data-lat="{{$field->latitude}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}" data-percent="{{$field->total_weight_progress}}"><i class="fa fa-trash"></i></button>
                                        <button class="svs-action editProj btn" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-lon="{{$field->longitude}}" data-lat="{{$field->latitude}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}" data-percent="{{$field->total_weight_progress}}"><i class="fa fa-pencil-alt"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        @endif
                    </tbody>
                </table>
                @if(count($project_record))
                    @foreach($project_record as $field)
                        <div id="{{$field->id}}" data-pcode="{{$field->proj_code}}" class="" style="display:none; width: 100%;">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><b>Project : </b></label>&nbsp;{{$field->proj_title}}<br>
                                        <label><b>Project Code: </b></label>&nbsp;{{$field->proj_code}}<br>
                                        <label><b>Project Status: </b></label>&nbsp;
                                            @if(!empty($field->total_weight_progress))
                                                {{$field->total_weight_progress}}%
                                            @else
                                                0.00%
                                            @endif
                                        <br>
                                        <label><b>Location: </b></label>&nbsp;{{$field->location}}<br>
                                        <label><b>Description : </b></label>&nbsp;{{$field->proj_desc}}
                                        
                                    </div>
                                    <div class="col-md-6">
                                            <label><b>Estimated Start Date : </b></label>&nbsp;{{date('F d Y - h:i a',strtotime($field->est_start_date))}}<br>
                                            <label><b>Estimated End Date : </b></label>&nbsp;{{date('F d Y - h:i a',strtotime($field->est_end_date))}}<br>
                                            <label><b>Actual Start Date : </b></label>&nbsp;{{date('F d Y - h:i a',strtotime($field->act_start_date))}}<br>
                                            <label><b>Actual End Date : </b></label>&nbsp;{{date('F d Y - h:i a',strtotime($field->act_end_date))}}<br>
                                    </div>
                                </div>
                                <hr>
                                <!-- Classic tabs -->
                                <div class="classic-tabs mx-2">

                                        <ul class="nav tabs-cyan" id="myClassicTabShadow" role="tablist">
                                            <li class="nav-item svs-nav-item">
                                                <a class="nav-link font-svs-normal waves-light active show" id="profile-tab-classic-shadow" data-toggle="tab" href="#profile-classic-shadow{{$field->proj_code}}"
                                                role="tab" aria-controls="profile-classic-shadow" aria-selected="true">Task</a>
                                            </li>
                                            <li class="nav-item svs-nav-item">
                                                <a class="nav-link font-svs-normal waves-light" id="follow-tab-classic-shadow" data-toggle="tab" href="#follow-classic-shadow{{$field->proj_code}}"
                                                role="tab" aria-controls="follow-classic-shadow" aria-selected="false">Project Manager</a>
                                            </li>
                                            <li class="nav-item svs-nav-item">
                                                <a class="nav-link font-svs-normal waves-light" id="contact-tab-classic-shadow" data-toggle="tab" href="#contact-classic-shadow{{$field->proj_code}}"
                                                role="tab" aria-controls="contact-classic-shadow" aria-selected="false">Employee</a>
                                            </li>
                                        </ul>
                                    
                                        <div class="tab-content" id="myClassicTabContentShadow">
                                            <div class="tab-pane fade active show" id="profile-classic-shadow{{$field->proj_code}}" role="tabpanel" aria-labelledby="profile-tab-classic-shadow{{$field->proj_code}}">
                                                    
                                                    <div class="container svs-overflow">
                                                        <table id="taskRow{{$field->proj_code}}" class="svs-table-mini" cellspacing="0" width="100%" summary="test">
                                                            <colgroup>
                                                                <col width="40px">
                                                                    <col span="4" width="25%">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th><b>Task Code</b></th>
                                                                    <th><b>Title</b></th>
                                                                    <th><b>Description</b></th>
                                                                    <th><b>Weight</b></th>
                                                                    <th><b>Action</b></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="divTask{{$field->proj_code}}">
                    
                                                            </tbody>
                                                        </table>
                                                    </div>


                                            </div>
                                            <div class="tab-pane fade" id="follow-classic-shadow{{$field->proj_code}}" role="tabpanel" aria-labelledby="follow-tab-classic-shadow{{$field->proj_code}}">
                                                    
                                                    <div class="container svs-overflow">
                                                        <table id="pmRow{{$field->proj_code}}" class="svs-table-mini" cellspacing="0" width="100%" summary="test">
                                                            <colgroup>
                                                                <col width="40px">
                                                                    <col span="4" width="25%">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th><b>Project Manager Name</b></th>
                                                                    <th><b>Position</b></th>
                                                                    <th><b>Department</b></th>
                                                                    <th><b>Team</b></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="divPm{{$field->proj_code}}">
                    
                                                            </tbody>
                                                        </table>
                                                    </div>

                                            </div>
                                            <div class="tab-pane fade" id="contact-classic-shadow{{$field->proj_code}}" role="tabpanel" aria-labelledby="contact-tab-classic-shadow{{$field->proj_code}}">
                                                    
                                                <div class="container svs-overflow">
                                                    <table id="empRow{{$field->proj_code}}" class="svs-table-mini" cellspacing="0" width="100%" summary="test">
                                                        <colgroup>
                                                            <col width="40px">
                                                                <col span="4" width="25%">
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th><b>Employee Name</b></th>
                                                                <th><b>Position</b></th>
                                                                <th><b>Department</b></th>
                                                                <th><b>Team</b></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="divEmp{{$field->proj_code}}">
                
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    
                                </div>
                                <!-- Classic tabs -->

                                {{-- <div class="" id="divTask{{$field->proj_code}}">

                                </div> --}}
                                <br><br>
                                <div class="container">
                                    <h6 class="float-right">Created By: {{$field->updated_by}}</h6>
                                    <br>
                                    <br>
                                    <small class="float-right">Date: {{ date('F d Y - h:i a',strtotime($field->created_at)) }}</small>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
               
            </div>
            <!-- table-wrap -->


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



        
<script>
    $(document).ready(function () {
        $(".rowdt").click(function () {
            var projCode = $(this).attr('data-projcode');
            if ($('tr#' + $(this).data("href")).is(":visible")) {
                $('tr#' + $(this).data("href")).remove();
            } else {
                $(this).closest('tr').after('<tr id="' + $(this).data("href") + '"><td colspan="7">' + $('#' + $(this).data("href")).html() + '</td></tr>');
                
                //Task
                    $.ajax({
                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        url: "{{ route('project_info_task') }}",
                        method: "POST",
                        data:{
                            proceed:"TRUE",
                            code:projCode
                        }, 
                        success:function(data)
                        {
                            $("#divTask"+projCode).html(data);
                            $("#taskRow"+projCode).DataTable({
                                "columnDefs": [
                                    { "orderable": false, "targets": 4 }
                                ]
                            });
                            $('#taskRow'+projCode+'_wrapper').find('label').each(function () {
                                $(this).parent().append($(this).children());
                            });
                            $('#taskRow'+projCode+'_wrapper .dataTables_filter').find('input').each(function () {
                                const $this = $(this);
                                $this.attr("placeholder", "Search");
                                $this.removeClass('form-control-sm');
                            });
                            $('#taskRow'+projCode+'_wrapper .dataTables_length').addClass('d-flex flex-row');
                            $('#taskRow'+projCode+'_wrapper .dataTables_filter').addClass('md-form');
                            $('#taskRow'+projCode+'_wrapper select').removeClass(
                            'custom-select custom-select-sm form-control form-control-sm');
                            $('#taskRow'+projCode+'_wrapper select').addClass('mdb-select');
                            // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                            $('#taskRow'+projCode+'_wrapper .dataTables_filter').find('label').remove();
                        },
                        error: function(xhr, ajaxOptions, thrownError){
                            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                //EndTask

                //Pm
                    $.ajax({
                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        url: "{{ route('project_info_pm') }}",
                        method: "POST",
                        data:{
                            proceed:"TRUE",
                            code:projCode
                        }, 
                        success:function(data)
                        {
                            $("#divPm"+projCode).html(data);
                            $("#pmRow"+projCode).DataTable();
                            $('#pmRow'+projCode+'_wrapper').find('label').each(function () {
                                $(this).parent().append($(this).children());
                            });
                            $('#pmRow'+projCode+'_wrapper .dataTables_filter').find('input').each(function () {
                                const $this = $(this);
                                $this.attr("placeholder", "Search");
                                $this.removeClass('form-control-sm');
                            });
                            $('#pmRow'+projCode+'_wrapper .dataTables_length').addClass('d-flex flex-row');
                            $('#pmRow'+projCode+'_wrapper .dataTables_filter').addClass('md-form');
                            $('#pmRow'+projCode+'_wrapper select').removeClass(
                            'custom-select custom-select-sm form-control form-control-sm');
                            $('#pmRow'+projCode+'_wrapper select').addClass('mdb-select');
                            // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                            $('#pmRow'+projCode+'_wrapper .dataTables_filter').find('label').remove();
                        },
                        error: function(xhr, ajaxOptions, thrownError){
                            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                //EndPm

                //Pm
                    $.ajax({
                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        url: "{{ route('project_info_emp') }}",
                        method: "POST",
                        data:{
                            proceed:"TRUE",
                            code:projCode
                        }, 
                        success:function(data)
                        {
                            $("#divEmp"+projCode).html(data);
                            $("#empRow"+projCode).DataTable();
                            $('#empRow'+projCode+'_wrapper').find('label').each(function () {
                                $(this).parent().append($(this).children());
                            });
                            $('#empRow'+projCode+'_wrapper .dataTables_filter').find('input').each(function () {
                                const $this = $(this);
                                $this.attr("placeholder", "Search");
                                $this.removeClass('form-control-sm');
                            });
                            $('#empRow'+projCode+'_wrapper .dataTables_length').addClass('d-flex flex-row');
                            $('#empRow'+projCode+'_wrapper .dataTables_filter').addClass('md-form');
                            $('#empRow'+projCode+'_wrapper select').removeClass(
                            'custom-select custom-select-sm form-control form-control-sm');
                            $('#empRow'+projCode+'_wrapper select').addClass('mdb-select');
                            // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
                            $('#empRow'+projCode+'_wrapper .dataTables_filter').find('label').remove();
                        },
                        error: function(xhr, ajaxOptions, thrownError){
                            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                //EndPm
            }  
        });
    });
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
                    url: "{{ route('open_task_view_list') }}",
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