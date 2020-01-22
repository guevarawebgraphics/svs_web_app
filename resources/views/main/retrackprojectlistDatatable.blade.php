<table id="projRow" class="table table-striped" cellspacing="0" width="100%" summary="test">
        <colgroup>
            <col width="40px">
                <col span="4" width="25%">
        </colgroup>
        <thead>
            <tr>
                <th class="th-sm">ProjCode</th>
                <th class="th-sm">Title </th>
                <th class="th-sm">Description</th>
                <th class="th-sm">Status</th>
                <th class="th-sm">CreatedBy</th>
                <th class="th-sm">CreatedDate</th>
                @if($manage_retrack_proj[0]->full_access_data == 1 || $manage_retrack_proj[0]->custom_data == 1)
                    @if($manage_retrack_proj[0]->full_access_data == 1 || $manage_retrack_proj[0]->retrack_data == 1)
                        <th class="th-sm">Action</th>
                    @endif
                @endif
            </tr>
        </thead>
        <tbody>
                @if(count($project_record))
                    @foreach($project_record as $field)
                        @php
                            if(!empty($field->total_weight_progress)){
                                $weight = $field->total_weight_progress;
                            }else{
                                $weight = "0.00%";
                            }
                        @endphp
                        <tr>
                            <td>{{$field->proj_code}}</td>
                            <td>{{$field->proj_title}}</td>
                            <td>{{$field->proj_desc}}</td>
                            <td>
                                {{$weight}}
                            </td>
                            <td>{{$field->updated_by}}</td>
                            <td>{{date('F d Y - h:i a',strtotime($field->created_at))}}</td>
                            @if($manage_retrack_proj[0]->full_access_data == 1 || $manage_retrack_proj[0]->custom_data == 1)
                                @if($manage_retrack_proj[0]->full_access_data == 1 || $manage_retrack_proj[0]->retrack_data == 1)
                                    <td>
                                        <a class="svs-action delProj btn btn-success waves-effect" data-id="{{$field->id}}" data-projcode="{{$field->proj_code}}" data-title="{{$field->proj_title}}" data-desc="{{$field->proj_desc}}" data-status="{{$weight}}" data-by="{{$field->updated_by}}" data-created="{{date('F d Y - h:i a',strtotime($field->created_at))}}">Retrack</a>
                                    </td>
                                @endif
                            @endif

                        </tr>
                    @endforeach
                @endif
        </tbody>
    </table>
<!-- Modal: delTask -->
<div class="modal fade" id="delProj" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                You are trying to retrack. After this transaction project will be able to use in any transaction.
                <br>
                Proj Code: <em id="delProjCode"></em><br>
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
    $("#projRow").DataTable();
    $('#projRow_wrapper').find('label').each(function () {
        $(this).parent().append($(this).children());
    });
    $('#projRow_wrapper .dataTables_filter').find('input').each(function () {
        const $this = $(this);
        $this.attr("placeholder", "Search");
        $this.removeClass('form-control-sm');
    });
    $('#projRow_wrapper .dataTables_length').addClass('d-flex flex-row');
    $('#projRow_wrapper .dataTables_filter').addClass('md-form');
    $('#projRow_wrapper select').removeClass(
    'custom-select custom-select-sm form-control form-control-sm');
    $('#projRow_wrapper select').addClass('mdb-select');
    // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
    $('#projRow_wrapper .dataTables_filter').find('label').remove();
</script>


<script>
$(document).ready(function () {
    $(".delProj").click(function () {
        $('#delProj').modal('show');

        var id = $(this).attr('data-id');
        var projCode = $(this).attr('data-projcode');
        var title = $(this).attr('data-title');
        var desc = $(this).attr('data-desc');
        var updated_by = $(this).attr('data-by');
        var created_at = $(this).attr('data-created');
        var status = $(this).attr('data-status');

        $("#delHeader").html(title);
        $("#delProjCode").html(projCode);
        $("#delTitle").html(title);
        $("#delDesc").html(desc);
        $("#delBy").html(updated_by);
        $("#delAt").html(created_at);

        $("#delContinue").attr('data-projcode',projCode);
    });
});
</script>


<script>
$(document).ready(function () {
    $("#delContinue").click(function () {
        var projCode = $(this).attr('data-projcode');

        var x = document.getElementById("delContinue");
        x.innerHTML = "Loading...";
        document.getElementById("delContinue").disabled = true;

        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('retrack_project') }}",
            method: "POST",
            data:{
                type:"retrack_project",
                code:projCode,
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