<table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
        <th class="th-sm">User Code
            </th>
        <th class="th-sm">Name
        </th>
        <th class="th-sm">Email
        </th>
        @if(auth()->user()->is_admin == 2)
        <th class="th-sm">Type
        </th>
        @endif
        <th class="th-sm">Created By
        </th>

        @if($manage_user_um[0]->full_access_data == 1 || $manage_user_um[0]->custom_data == 1)
                @if($manage_user_um[0]->full_access_data == 1 || $manage_user_um[0]->delete_data == 1 || $manage_user_um[0]->edit_data == 1)
                    <th class="th-sm">Action
                    </th>
                @endif
        @endif
        
        </tr>
    </thead>
    <tbody id="userMngmtRcrd">
            @if(count($user_records_web))
                @foreach($user_records_web as $field)
                    <tr>
                        <td>{{$field->company_id}}</td>
                        <td>{{$field->name}}</td>
                        <td>{{$field->email}}</td>
                        @if(auth()->user()->is_admin == 2)
                            @if($field->is_admin == 2)
                            <td>Super Admin</td>
                            @else
                            <td>Admin</td>
                            @endif
                        @endif
                        <td>{{$field->created_by}}
                            <br>
                            <small>{{date("F d Y - h:i a",strtotime($field->created_at))}}</small>
                        </td>
                        
                        {{-- Checks if Full Access Or Custom Access --}}
                        @if($manage_user_um[0]->full_access_data == 1 || $manage_user_um[0]->custom_data == 1)
                            {{-- Checks if Full Access or Which Custom Access is on --}}
                            @if($manage_user_um[0]->full_access_data == 1 || $manage_user_um[0]->delete_data == 1 || $manage_user_um[0]->edit_data == 1)
                                <td>
                                    {{-- Checks if Delete --}}
                                    @if($manage_user_um[0]->full_access_data == 1 || $manage_user_um[0]->delete_data == 1)
                                        <button data-id="{{$field->id}}" data-companyid="{{$field->company_id}}" data-name="{{$field->name}}" data-email = "{{$field->email}}" data-created_by = "{{$field->created_by}}" data-create_at = "{{$field->created_at}}" data-is_admin = "{{$field->is_admin}}" class="svs-action delUser btn"><i class="fa fa-trash"></i></button>
                                    @endif
                                    @if($manage_user_um[0]->full_access_data == 1 || $manage_user_um[0]->edit_data == 1)
                                        <button data-id="{{$field->id}}" data-companyid="{{$field->company_id}}" data-name="{{$field->name}}" data-email = "{{$field->email}}" data-created_by = "{{$field->created_by}}" data-create_at = "{{$field->created_at}}" data-is_admin = "{{$field->is_admin}}" class="svs-action editUser btn"><i class="fa fa-pencil-alt"></i></button>
                                        <button data-id="{{$field->id}}" data-companyid="{{$field->company_id}}" data-name="{{$field->name}}" data-email = "{{$field->email}}" data-created_by = "{{$field->created_by}}" data-create_at = "{{$field->created_at}}" data-is_admin = "{{$field->is_admin}}" class="svs-action manageAccessEdit btn"><i class="fa fa-key"></i></button>
                                    @endif
                                </td>
                            @endif
                        @endif


                    </tr>
                @endforeach
            @endif
    </tbody>
  
    </table>