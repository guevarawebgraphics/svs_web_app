@extends('layouts.app_admin')
@section('content')


<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-history"></i> Retrack Web Console Users</h2></div>
    
    <div class="container" style="margin-top:3em;">

            @include('main.sessionRetrackUserManagement')

        <div class="container svs-overflow">

            @include('main.retrackusermanagementDatatable')
                
        </div>
    </div>
</div>




<!-- Modal: retrackUser -->
<div class="modal fade" id="retrackUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Retrack Web User  : <span id="retrackHeader"></span></h4>
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
                User Code: <em id="retUserCode"></em><br>
                Name: <em id="retUserName"></em><br>
                Email :<em id="retUserEmail"></em><br>
                User Type :<em id="retUserType"></em><br>
                Created At :<em id="retUserCreatedAt"></em><br>
            </p>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect retContinue" id="retContinue">Continue</button>
      </div>
    </div>
  </div>
</div>

<script>
$(".retrackUser").click(function () {
    $('#retrackUserModal').modal('show');
    var id = $(this).attr('data-id');
    var company_id = $(this).attr('data-company_id');
    var name= $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var user_type = $(this).attr('data-user_type');
    var created_by = $(this).attr('data-created_by');
    var created_at = $(this).attr('data-created_at');

    $("#retContinue").attr('data-id',id);
    $("#retContinue").attr('data-company_id',company_id);
    $("#retContinue").attr('data-name',name);
    $("#retContinue").attr('data-email',email);
    $("#retContinue").attr('data-user_type',user_type);
    $("#retContinue").attr('data-created_by',created_by);
    $("#retContinue").attr('data-created_at',created_at);


    $("#retrackHeader").html(company_id);
    $("#retUserCode").html(company_id);
    $("#retUserName").html(name);
    $("#retUserEmail").html(email);

    if(user_type == 1){
        $("#retUserType").html("Admin");
    }else{
        $("#retUserType").html("Super Admin");
    }
    
    $("#retUserCreatedAt").html(created_at);

});
</script>


<script>
$("#retContinue").click(function () {
    var id = $(this).attr('data-id');
    var company_id = $(this).attr('data-company_id');
    var name= $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var user_type = $(this).attr('data-user_type');
    var created_by = $(this).attr('data-created_by');
    var created_at = $(this).attr('data-created_at');

    var x = document.getElementById("retContinue");
    x.innerHTML = "Loading...";
    document.getElementById("retContinue").disabled = true;

    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('retrack_web_users') }}",
        method: "POST",
        data:{
            type:"retrack_web_user",
            code:company_id,
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
</script>


<script>
    // Material Design example
    $(document).ready(function () {
        $('#dtMaterialDesignExample').DataTable();
        $('#dtMaterialDesignExample_wrapper').find('label').each(function () {
            $(this).parent().append($(this).children());
        });
        $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('input').each(function () {
            const $this = $(this);
            $this.attr("placeholder", "Search");
            $this.removeClass('form-control-sm');
        });
        $('#dtMaterialDesignExample_wrapper .dataTables_length').addClass('d-flex flex-row');
        $('#dtMaterialDesignExample_wrapper .dataTables_filter').addClass('md-form');
        $('#dtMaterialDesignExample_wrapper select').removeClass(
        'custom-select custom-select-sm form-control form-control-sm');
        $('#dtMaterialDesignExample_wrapper select').addClass('mdb-select');
        // $('#dtMaterialDesignExample_wrapper .mdb-select').materialSelect();
        $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('label').remove();
    });
</script>
@endsection