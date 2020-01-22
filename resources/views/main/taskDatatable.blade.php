<table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
            <th class="th-sm">Task Code
                </th>
            <th class="th-sm">Task Title
            </th>
            <th class="th-sm">Task Description
            </th>
            <th class="th-sm">Created By
            </th>
            <th class="th-sm">Created Date
            </th>
            @if($manage_user_task[0]->full_access_data == 1 || $manage_user_task[0]->custom_data == 1)
                @if($manage_user_task[0]->full_access_data == 1 || $manage_user_task[0]->delete_data == 1 || $manage_user_task[0]->edit_data == 1)
                    <th class="th-sm">Action
                    </th>
                @endif
            @endif
            
            </tr>
        </thead>
        <tbody id="taskRcrd">
                @if(count($task_record))
                    @foreach($task_record as $field)
                        <tr>
                            <td>{{$field->taskCode}}</td>
                            <td>{{$field->task_title}}</td>
                            <td>{{$field->task_desc}}</td>
                            <td>{{$field->updated_by}}</td>
                            <td>{{date("F d Y - h:i a",strtotime($field->created_at))}}</td>
                            {{-- Checks if Full Access Or Custom Access --}}
                            @if($manage_user_task[0]->full_access_data == 1 || $manage_user_task[0]->custom_data == 1)
                                {{-- Checks if Full Access or Which Custom Access is on --}}
                                @if($manage_user_task[0]->full_access_data == 1 || $manage_user_task[0]->delete_data == 1 || $manage_user_task[0]->edit_data == 1)
                                    <td>
                                        {{-- Checks if Delete --}}
                                        @if($manage_user_task[0]->full_access_data == 1 || $manage_user_task[0]->delete_data == 1)
                                            <button data-id="{{$field->id}}" data-title="{{$field->task_title}}" data-desc="{{$field->task_desc}}" data-code = "{{$field->taskCode}}" data-crt = "{{$field->created_at}}" class="svs-action delTask btn"><i class="fa fa-trash"></i></button>
                                        @endif
                                        {{-- Checks if Edit --}}
                                        @if($manage_user_task[0]->full_access_data == 1 || $manage_user_task[0]->edit_data == 1)
                                            <button data-id="{{$field->id}}" data-title="{{$field->task_title}}" data-desc="{{$field->task_desc}}" data-code = "{{$field->taskCode}}" data-crt = "{{$field->created_at}}" class="svs-action editTask btn"><i class="fa fa-pencil-alt"></i></button>
                                        @endif
                                    </td>
                                @endif
                            @endif
                        </tr>
                    @endforeach
                @endif
        </tbody>
      
        </table>