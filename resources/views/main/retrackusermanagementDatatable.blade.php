<table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
        <th class="th-sm">User Code
            </th>
        <th class="th-sm">Name
        </th>
        <th class="th-sm">Email
        </th>
        <th class="th-sm">Created By
        </th>
        <th class="th-sm">Created Date
        </th>
        <th class="th-sm">Action
        </th>
        
        </tr>
    </thead>
    <tbody id="userMngmtRcrd">
            @if(count($user_records_web))
                @foreach($user_records_web as $field)
                    <tr>
                        <td>{{$field->company_id}}</td>
                        <td>{{$field->name}}</td>
                        <td>{{$field->email}}</td>
                        <td>{{$field->created_by}}</td>
                        <td>{{date("F d Y - h:i a",strtotime($field->created_at))}}</td>
                        <td>
                            <a class="svs-action retrackUser btn btn-success waves-effect" 
                                data-id = "{{$field->id}}"
                                data-company_id = "{{$field->company_id}}"
                                data-name = "{{$field->name}}"
                                data-email = "{{$field->email}}"
                                data-user_type = "{{$field->is_admin}}"
                                    data-created_by = "{{$field->created_by}}"
                                    data-created_at = "{{date("F d Y - h:i a",strtotime($field->created_at))}}">
                                    Retrack
                            </a>
                        </td>
                    </tr>
                @endforeach
            @endif
    </tbody>
  
    </table>