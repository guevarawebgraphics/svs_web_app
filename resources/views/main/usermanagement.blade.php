@extends('layouts.app_admin')
@section('content')

<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-users"></i> User Management</h2></div>
    <!-- Button trigger modal-->
    
    <button type="button" class="btn btn-primary float-right" id="newUserBtn"><i class="fa fa-plus"></i>&nbsp;New Web Console User</button>
    
    <div class="container" style="margin-top:3em;">

            {{-- @include('main.sessionProj') --}}

    <div class="container svs-overflow">

            @include('main.usermanagementDatatable')
            
    </div>
    </div>
</div>



<!-- Modal: New User -->
<div class="modal fade" id="newUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog svs-modal-sm" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">New Web Console User</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">

            <p class="note note-primary">
                <strong>Note:</strong> 
                You are register new web console user. This record will be useful to any transaction.
                
                <br>
            </p>

            <!--Grid row-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" id="userName" name="userName" class="form-control">
                            <label for="userName" class="">Name</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" id="userEmail" name="userEmail" class="form-control">
                            <label for="userEmail" class="">Email</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        
                        <div class="md-form mb-0">
                            <input type="password" id="userNewPass" name="userNewPass" class="form-control">
                            <label for="userNewPass" class="">New Password</label>
                        </div>
                        <div class="md-form mb-0">
                            <input type="password" id="userConfirmPass" name="userConfirmPass" class="form-control">
                            <label for="userConfirmPass" class="">Confirm Password</label>
                        </div>
                    </div>
                </div>
                <br>
                <p><b>Note : </b><em>You may select multiple account privileges. This serves as filtering of privileges for every user of Web Console.</em></p>
                <div class="row">
                    <div class="col-md-6">
                        <h6>Viewing Records</h6>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt1" name="opt1" id="opt1">
                            <label class="custom-control-label" for="opt1">Dashboard</label>
                        </div>
                        <br>
                        <h6>Project Configuration</h6>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt2" name="opt2" id="opt2">
                            <label class="custom-control-label" for="opt2">Task List</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt3" name="opt3" id="opt3">
                            <label class="custom-control-label" for="opt3">Project List</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt4" name="opt4" id="opt4">
                            <label class="custom-control-label" for="opt4">Member Records</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h6>Retrack</h6>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt5" name="opt5" id="opt5">
                            <label class="custom-control-label" for="opt5">Task List</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt6" name="opt6" id="opt6">
                            <label class="custom-control-label" for="opt6">Project List</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt7" name="opt7" id="opt7">
                            <label class="custom-control-label" for="opt7">Member Records</label>
                        </div>
                        <br>
                        <br>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input opt8" name="opt8" id="opt8">
                            <label class="custom-control-label" for="opt8">User Management</label>
                        </div>                        
                    </div>
                </div>

        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary waves-effect" id="newUserSubmit">Submit</button>
      </div>
    </div>
  </div>
</div>



<!-- Modal: delUser -->
<div class="modal fade" id="delUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Delete Web Console User : <span id="HeaderDel"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-danger">
                <strong>Note danger:</strong> 
                You are trying to delete this record. This record will not be useful to any transaction
                <br>
                Name: <em id="delUserName"></em><br>
                Email <em id="delUserEmail"></em><br>
            </p>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
        <button class="btn btn-danger waves-effect" id="delSubmit">Delete</button>
      </div>
    </div>
  </div>
</div>





<!-- Modal: Edit User -->
<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog svs-modal-sm" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Edit Web Console User :  <span id="HeaderUserEdit"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">

            <p class="note note-success">
                <strong>Note:</strong> 
                You are trying to edit web console user. This record will be useful to any transaction.
                
                <br>
            </p>

            <!--Grid row-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" id="userNameEdit" name="userNameEdit" class="form-control">
                            <label for="userNameEdit" class="" id="EditLabelName">Name</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                            <div class="md-form mb-0">
                                <input type="text" id="userEmailEdit" name="userEmailEdit" class="form-control">
                                <label for="userEmailEdit" class="" id="EditLabelEmail">Email</label>
                            </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="md-form mb-0">
                            <input type="password" id="userNewPassEdit" name="userNewPassEdit" class="form-control">
                            <label for="userNewPassEdit" class="" id="EditLabelNewPass">New Password</label>
                        </div>
                        <div class="md-form mb-0">
                            <input type="password" id="userConfirmPassEdit" name="userConfirmPassEdit" class="form-control">
                            <label for="userConfirmPassEdit" class="" id="EditLabelConfirmPass">Confirm Password</label>
                        </div>
                    </div>
                </div>
                <br>
                {{-- <p><b>Note : </b><em>You may select multiple account privileges. This serves as filtering of privileges for every user of Web Console.</em></p> --}}
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect" id="editUserSubmit">Update</button>
      </div>
    </div>
  </div>
</div>





<script>
//Open New User Modal
$("#newUserBtn").click(function () {
    $('#newUserModal').modal('show');
});
</script>


<script>
//Open User Delete Modal
$(".delUser").click(function () {
    $('#delUserModal').modal('show');
    var id = $(this).attr('data-id');
    var company_id = $(this).attr('data-companyid');
    var name = $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var created_by = $(this).attr('data-created_by');
    var created_at = $(this).attr('data-create_at');

    $("#HeaderDel").html(company_id);
    $("#delUserName").html(name);
    $("#delUserEmail").html(email);

    $("#delSubmit").attr("data-id",id);
    $("#delSubmit").attr("data-companyid",company_id);
    $("#delSubmit").attr("data-name",name);
    $("#delSubmit").attr("data-email",email);
    $("#delSubmit").attr("data-created_by",created_by);
    $("#delSubmit").attr("data-create_at",created_at);
});
</script>


<script>
//Open User Edit Modal
$(".editUser").click(function () {
    $('#editUserModal').modal('show');
    var id = $(this).attr('data-id');
    var company_id = $(this).attr('data-companyid');
    var name = $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var created_by = $(this).attr('data-created_by');
    var created_at = $(this).attr('data-create_at');

    $("#HeaderUserEdit").html(company_id);

    $("#editUserSubmit").attr("data-id",id);
    $("#editUserSubmit").attr("data-companyid",company_id);
    $("#editUserSubmit").attr("data-name",name);
    $("#editUserSubmit").attr("data-email",email);
    $("#editUserSubmit").attr("data-created_by",created_by);
    $("#editUserSubmit").attr("data-create_at",created_at);


    $("#userNameEdit").val(name);
    $("#userEmailEdit").val(email);
    
    $("#EditLabelName").attr("class","active");
    $("#EditLabelEmail").attr("class","active");

    
});
</script>

<script>
//Submit Delete User
$("#delSubmit").click(function () {
    var id = $(this).attr('data-id');
    var company_id = $(this).attr('data-companyid');
    var name = $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var created_by = $(this).attr('data-created_by');
    var created_at = $(this).attr('data-created_at');
    alert(id);
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