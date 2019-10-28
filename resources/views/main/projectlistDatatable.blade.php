
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
                            <th class="th-sm">Created At
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
                                    <td>{{date("F d Y - h:i a",strtotime($field->created_at))}}</td>
                                    <td>
                                        <div class="row text-center">
                                        <button class="svs-action rowdt btn" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-href="{{$field->id}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}"><i class="fa fa-list"></i></button>
                                        <button class="svs-action delProj btn" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-lon="{{$field->longitude}}" data-lat="{{$field->latitude}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}"><i class="fa fa-trash"></i></button>
                                        <button class="svs-action editProj btn" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-location="{{$field->location}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-lon="{{$field->longitude}}" data-lat="{{$field->latitude}}" data-esd="{{$field->est_start_date}}" data-eed="{{$field->est_end_date}}" data-asd="{{$field->act_start_date}}" data-aed="{{$field->act_end_date}}"><i class="fa fa-pencil-alt"></i></button>
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

                                <div class="" id="divTask{{$field->proj_code}}">

                                </div>
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



            <script>
            $(document).ready(function () {
                $(".rowdt").click(function () {
                    var projCode = $(this).attr('data-projcode');
                    if ($('tr#' + $(this).data("href")).is(":visible")) {
                        $('tr#' + $(this).data("href")).remove();
                    } else {
                        $(this).closest('tr').after('<tr id="' + $(this).data("href") + '"><td colspan="6">' + $('#' + $(this).data("href")).html() + '</td></tr>');
                        
                        $.ajax({
                            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                            url: "{{ route('project_info') }}",
                            method: "POST",
                            data:{
                                proceed:"TRUE",
                                code:projCode
                            }, 
                            success:function(data)
                            {
                                $("#divTask"+projCode).html(data);
                            },
                            error: function(xhr, ajaxOptions, thrownError){
                                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    }  
                });
            });
            </script>