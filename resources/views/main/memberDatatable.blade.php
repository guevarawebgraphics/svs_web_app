
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
                        <th class="th-sm">Email
                        </th>
                        <th class="th-sm">Contact No
                        </th>
                        <th class="th-sm">Addresss
                        </th>
                        <th class="th-sm">Created At
                        </th>
                        <th class="th-lg">Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @if(count($member_record))
                        @foreach($member_record as $field)
                            <tr>
                                <td>{{$field->memberCode}}</td>
                                <td>{{$field->member_name}}</td>
                                <td>{{$field->member_email}}</td>
                                <td>{{$field->member_contact_no}}</td>
                                <td>{{$field->member_address}}</td>
                                <td>{{ date('F d Y - h:i a',strtotime($field->created_at)) }}</td>
                                <td>
                                    <div class="row text-center">
                                        {{-- <button class="svs-action btn" data-id="{{$field->id}}" data-memcode="{{$field->memberCode}}" data-name="{{$field->member_name}}" data-email="{{$field->member_email}}" data-contact="{{$field->member_contact_no}}" data-address="{{$field->member_address}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-type="{{$field->member_type}}" ><i class="fa fa-list"></i></button> --}}
                                        <button class="svs-action delMember btn" data-id="{{$field->id}}" data-memcode="{{$field->memberCode}}" data-name="{{$field->member_name}}" data-email="{{$field->member_email}}" data-contact="{{$field->member_contact_no}}" data-address="{{$field->member_address}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-type="{{$field->member_type}}" ><i class="fa fa-trash"></i></button>
                                        <button class="svs-action editMember btn" data-id="{{$field->id}}" data-memcode="{{$field->memberCode}}" data-name="{{$field->member_name}}" data-email="{{$field->member_email}}" data-contact="{{$field->member_contact_no}}" data-address="{{$field->member_address}}" data-date="{{date("F d Y - h:i a",strtotime($field->created_at))}}" data-type="{{$field->member_type}}" ><i class="fa fa-pencil-alt"></i></button>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                    
                </tbody>
            </table>

            