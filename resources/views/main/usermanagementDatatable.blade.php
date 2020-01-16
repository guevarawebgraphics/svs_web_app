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
                        <button data-id="{{$field->id}}" data-companyid="{{$field->company_id}}" data-name="{{$field->name}}" data-email = "{{$field->email}}" data-created_by = "{{$field->created_by}}" data-create_at = "{{$field->created_at}}" class="svs-action delUser btn"><i class="fa fa-trash"></i></button>
                            <button data-id="{{$field->id}}" data-companyid="{{$field->company_id}}" data-name="{{$field->name}}" data-email = "{{$field->email}}" data-created_by = "{{$field->created_by}}" data-create_at = "{{$field->created_at}}" class="svs-action editUser btn"><i class="fa fa-pencil-alt"></i></button>
                        </td>
                    </tr>
                @endforeach
            @endif
    </tbody>
  
    </table>