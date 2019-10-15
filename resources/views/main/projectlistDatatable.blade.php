<table id="dtMaterialDesignExample" class="table table-striped" cellspacing="0" width="100%">
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
            <th class="th-sm">Action
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
                            <td></td>
                        </tr>
                    @endforeach
                @endif
        </tbody>
        </table>