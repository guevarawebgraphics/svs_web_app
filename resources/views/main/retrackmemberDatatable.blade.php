<table id="retrackMemberTB" class="table table-striped" cellspacing="0" width="100%" summary="test">
        <colgroup>
            <col width="40px">
                <col span="4" width="25%">
        </colgroup>
        <thead>
            <tr>
                <th class="th-sm">Member Code</th>
                <th class="th-sm">Member Name </th>
                <th class="th-sm">Contact</th>
                <th class="th-sm">Position</th>
                <th class="th-sm">Type</th>
                <th class="th-sm">Address</th>
                <th class="th-sm">Created At</th>
                <th class="th-lg">Action</th>
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
                        <td>
                        <a class="svs-action delMember btn btn-success waves-effect" data-id="{{$field->id}}" data-memcode="{{$field->memberCode}}" data-name="{{$field->member_name}}" data-email="{{$field->member_email}}" data-contact = "{{$field->member_contact_no}}" data-addr = "{{$field->member_address}}" data-type = "{{$field->member_type}}" data-by="{{$field->updated_by}}" data-created="{{date('F d Y - h:i a',strtotime($field->created_at))}}">Retrack</a>
                        </td>
                    </tr>
                @endforeach
            @endif
        </tbody>
    </table>


<!-- Modal: delTask -->
<div class="modal fade" id="delMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Retrack Member  : <span id="delHeader"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-success">
                <strong>Note danger:</strong> 
                You are trying to retrack. After this transaction member will be able to use in any transaction.
                <br>
                Member Code: <em id="delMemCode"></em><br>
                Name: <em id="delMemName"></em><br>
                Contact :<em id="delContact"></em><br>
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
$("#retrackMemberTB").DataTable({
    "columnDefs": [
        { "orderable": false, "targets": 5 }
    ]
});
$('#retrackMemberTB_wrapper').find('label').each(function () {
    $(this).parent().append($(this).children());
});
$('#retrackMemberTB_wrapper .dataTables_filter').find('input').each(function () {
    const $this = $(this);
    $this.attr("placeholder", "Search");
    $this.removeClass('form-control-sm');
});
$('#retrackMemberTB_wrapper .dataTables_length').addClass('d-flex flex-row');
$('#retrackMemberTB_wrapper .dataTables_filter').addClass('md-form');
$('#retrackMemberTB_wrapper select').removeClass(
'custom-select custom-select-sm form-control form-control-sm');
$('#retrackMemberTB_wrapper select').addClass('mdb-select');
// $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
$('#retrackMemberTB_wrapper .dataTables_filter').find('label').remove();
</script>

<script>
    $(document).ready(function () {
        $(".delMember").click(function () {
            $('#delMemberModal').modal('show');

            var id = $(this).attr('data-id');
            var memCode = $(this).attr('data-memcode');
            var name = $(this).attr('data-name');
            var email = $(this).attr('data-email');
            var contact = $(this).attr('data-contact');
            var updated_by = $(this).attr('data-by');
            var created_at = $(this).attr('data-created');

            $("#delHeader").html(memCode);
            $("#delMemCode").html(memCode);
            $("#delMemName").html(name);
            $("#delContact").html(email+"<br>"+contact);
            $("#delBy").html(updated_by);
            $("#delAt").html(created_at);

            $("#delContinue").attr('data-memcode',memCode);
        });
    });
</script>



<script>
$(document).ready(function () {
    $("#delContinue").click(function () {
        var memCode = $(this).attr('data-memcode');

        var x = document.getElementById("delContinue");
        x.innerHTML = "Loading...";
        document.getElementById("delContinue").disabled = true;

        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('retrack_member') }}",
            method: "POST",
            data:{
                type:"retrack_member",
                code:memCode,
            }, 
            dataType: "json",
            success:function(data)
            {
                if(data.success.length > 0){
                    location.reload();
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