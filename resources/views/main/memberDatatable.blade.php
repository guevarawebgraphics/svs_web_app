
        <div id="table-wrap">
            <table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%" summary="test">
                <colgroup>
                    <col width="40px">
                        <col span="4" width="25%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="th-sm">Member Code
                        </th>
                        <th class="th-sm">Member Name
                        </th>
                        <th class="th-sm">Contact
                        </th>
                        <th class="th-sm">Position
                        </th>
                        <th class="th-sm">Type
                        </th>
                        <th class="th-sm">Addresss
                        </th>
                        <th class="th-sm">Created At
                        </th>

                        @if($manage_user_mem[0]->full_access_data == 1 || $manage_user_mem[0]->custom_data == 1)
                            @if($manage_user_mem[0]->full_access_data == 1 || $manage_user_mem[0]->delete_data == 1 || $manage_user_proj[0]->edit_data == 1)
                                <th class="th-lg">Action
                                </th>
                            @endif
                        @endif
                    </tr>
                </thead>
                <tbody>
                    @if(count($member_record))
                        @foreach($member_record as $field)
                            <tr>
                                <td>{{$field->memberCode}}</td>
                                <td>{{$field->member_name}}</td>
                                <td>
                                    {{$field->member_email}}
                                    <br>
                                    {{$field->member_contact_no}}
                                </td>
                                <td>{{$field->member_position}}</td>
                                <td>{{$field->member_type}}</td>
                                <td>{{$field->member_address}}</td>
                                <td><small>{{ date('F d Y - h:i a',strtotime($field->created_at)) }}</small></td>
                                            
                                {{-- Checks if Full Access Or Custom Access --}}
                                @if($manage_user_mem[0]->full_access_data == 1 || $manage_user_mem[0]->custom_data == 1)
                                    {{-- Checks if Full Access or Which Custom Access is on --}}
                                    @if($manage_user_mem[0]->full_access_data == 1 || $manage_user_mem[0]->delete_data == 1 || $manage_user_mem[0]->edit_data == 1)
                                        <td>
                                            <div class="row text-center">
                                                {{-- Checks if Delete --}}
                                                @if($manage_user_mem[0]->full_access_data == 1 || $manage_user_mem[0]->delete_data == 1)
                                                    <button class="svs-action delMember btn" data-id="{{$field->id}}" data-memcode="{{$field->memberCode}}" data-name="{{$field->member_name}}" data-email="{{$field->member_email}}" data-contact="{{$field->member_contact_no}}"  data-position = "{{$field->member_position}}" data-address="{{$field->member_address}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-type="{{$field->member_type}}" ><i class="fa fa-trash"></i></button>
                                                @endif
                                                @if($manage_user_mem[0]->full_access_data == 1 || $manage_user_mem[0]->edit_data == 1)
                                                    <button class="svs-action editMember btn" data-id="{{$field->id}}" data-memcode="{{$field->memberCode}}" data-name="{{$field->member_name}}" data-email="{{$field->member_email}}" data-contact="{{$field->member_contact_no}}" data-position = "{{$field->member_position}}" data-address="{{$field->member_address}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-type="{{$field->member_type}}" ><i class="fa fa-pencil-alt"></i></button>
                                                @endif
                                            </div>
                                        </td>
                                    @endif
                                @endif
                            </tr>
                        @endforeach
                    @endif
                    
                </tbody>
            </table>

            