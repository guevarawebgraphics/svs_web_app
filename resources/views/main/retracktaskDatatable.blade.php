
<table id="taskRow" class="table table-striped" cellspacing="0" width="100%" summary="test">
    <colgroup>
        <col width="40px">
            <col span="4" width="25%">
    </colgroup>
    <thead>
        <tr>
            <th class="th-sm">Task Code</th>
            <th class="th-sm">Task Title </th>
            <th class="th-sm">Task Description</th>
            <th class="th-sm">Created By</th>
            <th class="th-sm">Created Date</th>
            <th class="th-sm">Action</th>
        </tr>
    </thead>
    <tbody>
            @if(count($task))
                @foreach($task as $field)
                    <tr>
                        <td>{{$field->taskCode}}</td>
                        <td>{{$field->task_title}}</td>
                        <td>{{$field->task_desc}}</td>
                        <td>{{$field->updated_by}}</td>
                        <td>{{date('F d Y - h:i a',strtotime($field->created_at))}}</td>
                        <td>
                            <a class="svs-action delTask btn btn-success waves-effect" data-id="{{$field->id}}" data-taskcode="{{$field->taskCode}}" data-title="{{$field->task_title}}" data-desc="{{$field->task_desc}}" data-by="{{$field->updated_by}}" data-created="{{date('F d Y - h:i a',strtotime($field->created_at))}}">Retrack</a>
                        </td>
                    </tr>
                @endforeach
            @endif
    </tbody>
</table>



<!-- Modal: delTask -->
<div class="modal fade" id="delTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Retrack Task  : <span id="delHeader"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-success">
                <strong>Note danger:</strong> 
                You are trying to retrack. After this transaction task will be able to use in any transaction.
                <br>
                Task Code: <em id="delTaskCode"></em><br>
                Title: <em id="delTitle"></em><br>
                Description :<em id="delDesc"></em><br>
                Created By :<em id="delBy"></em><br>
                Created At :<em id="delAt"></em><br>
            </p>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect delContinue" id="delContinue">Continue</button>
      </div>
    </div>
  </div>
</div>


<script>
$("#taskRow").DataTable({
    "columnDefs": [
        { "orderable": false, "targets": 5 }
    ]
});
$('#taskRow_wrapper').find('label').each(function () {
    $(this).parent().append($(this).children());
});
$('#taskRow_wrapper .dataTables_filter').find('input').each(function () {
    const $this = $(this);
    $this.attr("placeholder", "Search");
    $this.removeClass('form-control-sm');
});
$('#taskRow_wrapper .dataTables_length').addClass('d-flex flex-row');
$('#taskRow_wrapper .dataTables_filter').addClass('md-form');
$('#taskRow_wrapper select').removeClass(
'custom-select custom-select-sm form-control form-control-sm');
$('#taskRow_wrapper select').addClass('mdb-select');
// $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
$('#taskRow_wrapper .dataTables_filter').find('label').remove();
</script>


<script>
$(document).ready(function () {
    $(".delTask").click(function () {
        $('#delTask').modal('show');

        var id = $(this).attr('data-id');
        var taskCode = $(this).attr('data-taskcode');
        var title = $(this).attr('data-title');
        var desc = $(this).attr('data-desc');
        var updated_by = $(this).attr('data-by');
        var created_at = $(this).attr('data-created');

        $("#delHeader").html(title);
        $("#delTaskCode").html(taskCode);
        $("#delTitle").html(title);
        $("#delDesc").html(desc);
        $("#delBy").html(updated_by);
        $("#delAt").html(created_at);

        $("#delContinue").attr('data-taskcode',taskCode);
    });
});
</script>

<script>
$(document).ready(function () {
    $("#delContinue").click(function () {
        var taskCode = $(this).attr('data-taskcode');

        var x = document.getElementById("delContinue");
        x.innerHTML = "Loading...";
        document.getElementById("delContinue").disabled = true;

        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('retrack_task') }}",
            method: "POST",
            data:{
                type:"retrack_task",
                code:taskCode,
            }, 
            dataType: "json",
            success:function(data)
            {
                if(data.success.length > 0){
                    location.reload();
                    // toastr.success(data.success[0]);
                }else{
                    toastr.error(data.error[0]);
                }
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });    
    });
});
</script>