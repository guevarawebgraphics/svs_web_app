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
            <th class="th-sm">Action
            </th>
            
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
                            <td>
                            <button data-id="{{$field->id}}" data-title="{{$field->task_title}}" data-desc="{{$field->task_desc}}" data-code = "{{$field->taskCode}}" data-crt = "{{$field->created_at}}" class="svs-action delTask btn"><i class="fa fa-trash"></i></button>
                            <button data-id="{{$field->id}}" data-title="{{$field->task_title}}" data-desc="{{$field->task_desc}}" data-code = "{{$field->taskCode}}" data-crt = "{{$field->created_at}}" class="svs-action editTask btn"><i class="fa fa-pencil-alt"></i></button>
                            </td>
                        </tr>
                    @endforeach
                {{-- @else
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr> --}}
                @endif
        </tbody>
      
        </table>