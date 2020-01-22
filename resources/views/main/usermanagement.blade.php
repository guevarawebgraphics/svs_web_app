@extends('layouts.app_admin')
@section('content')

<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-users"></i> User Management</h2></div>
    <!-- Button trigger modal-->
    
    @if($manage_user_um[0]->full_access_data == 1 || ($manage_user_um[0]->custom_data == 1 && $manage_user_um[0]->add_data == 1))
        <button type="button" class="btn btn-primary float-right" id="newUserBtn"><i class="fa fa-plus"></i>&nbsp;New Web Console User</button>
    @endif

    <div class="container" style="margin-top:3em;">

            @include('main.sessionUsermanagement')

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
                    You are trying to register new web console user. This record will be useful to any transaction.
                    
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
                            <div class="md-form">
                                <select class="mdb-select isAdmin" name="isAdmin" id="isAdmin" style="width:300px!important;">
                                    
                                    
                                    @if(auth()->user()->is_admin == 2)
                                    <option value="" disabled selected>Select User Type</option>
                                    <option value="1">Admin</option>
                                    <option value="2">Super Admin</option>
                                    @else
                                    <option value="1">Admin</option>
                                    @endif
                                </select>
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
                    @if(count($manage_access_list))
                        @foreach($manage_access_list as $field)
                            <div class="row">
                                <div class="col-md-2">
                                    {{$field->access_desc}}
                                </div>
                                <div class="col-md-2">
                                <select class="access-select mdb-select accessSelect{{$field->id}}" data-id = "{{$field->id}}" name="accessSelect{{$field->id}}" id="accessSelect{{$field->id}}" style="width: 170px!important;">
                                        <option value="" disabled selected>Select Access Right</option>
                                        {{-- @if($field->id != 1) --}}
                                        <option value="ALL">All Access</option>
                                        <option value="NO">No Access</option>
                                        <option value="READ">Read Only</option>
                                        {{-- @if($field->id != 1) --}}
                                        <option value="CONFIG">Custom Access</option>
                                        {{-- @endif --}}
                                    </select>
                                </div>

                                    <div class="col-md-2 access-right-{{$field->id}}" style="display:none;">
                                        <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input add{{$field->id}}" name="config{{$field->id}}" value = "ADD" id="add{{$field->id}}">
                                            <label class="custom-control-label" for="add{{$field->id}}">Add</label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 access-right-{{$field->id}}" style="display:none;">
                                        <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input edit{{$field->id}}" name="config{{$field->id}}" value = "EDIT" id="edit{{$field->id}}">
                                            <label class="custom-control-label" for="edit{{$field->id}}">Edit</label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 access-right-{{$field->id}}" style="display:none;">
                                        <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input remove{{$field->id}}" name="config{{$field->id}}" value = "REMOVE" id="remove{{$field->id}}">
                                            <label class="custom-control-label" for="remove{{$field->id}}">Remove</label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 access-right-{{$field->id}}" style="display:none;">
                                        <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input remove{{$field->id}}" name="config{{$field->id}}" value = "RETRACK" id="retrack{{$field->id}}">
                                            <label class="custom-control-label" for="retrack{{$field->id}}">Retrack</label>
                                        </div>
                                    </div>

                            </div>
                        @endforeach
                    @endif
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
<!-- Modal: New User -->



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
<!-- Modal: delUser -->



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
                    Update user account credential here. Current password is required, please enter your current account password.
                    
                    <br>
                </p>

                <br>
                <p class="h5">Personal Information</p>

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
                            <div class="md-form">
                                <select class="mdb-select isAdminEdit" name="isAdminEdit" id="isAdminEdit" style="width:300px!important;">

                                </select>
                            </div>
                        </div>
                    
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="md-form mb-0">
                                <input type="password" id="userCurrPassEdit" name="userCurrPassEdit" class="form-control">
                            <label for="userCurrPassEdit" class="" id="EditLabelCurrPass">Your Current Password *</label>
                            </div>
                        </div>
                    
                    </div>

                    <br><hr><br>
                    <p class="h5">Change Password</p>
                    <p class="card-text">Updating account password is optional. You may leave this blank if you don't want to change it.</p>
                
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
<!-- Modal: Edit User -->


<!-- Modal: Manage Access Right -->
    <div class="modal fade" id="MAUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog svs-modal-md" role="document">
        <div class="modal-content">
        <!--Header-->
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Manage Access Right : <span id="HeaderMA"></span></h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
            </button>
        </div>
        <!--Body-->
        <div class="modal-body">
            <div class="container">
                <p class="note note-success">
                    <strong>Note :</strong> 
                    You are trying to update access right of <em id="userMA"></em>.
                    <br>
                </p>

                <div class="container" id="MngAcssDiv">

                </div>
            </div>
        

        </div>
        <!--Footer-->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
            <button class="btn btn-success waves-effect" id="MASubmit">Update</button>
        </div>
        </div>
    </div>
    </div>
<!-- Modal: Manage Access Right -->


<script>
//Open New User Modal
$("#newUserBtn").click(function () {
    $('#newUserModal').modal('show');
    

});
</script>


<script>
//Submit New User
$("#newUserSubmit").click(function () {
    var name = $('#userName').val();
    var email = $('#userEmail').val();
    var newPass = $('#userNewPass').val();
    var confirmPass = $('#userConfirmPass').val();
    var isAdmin = $('#isAdmin').val();

    // var select1 = $("#accessSelect1").val();
    var select2 = $("#accessSelect2").val();
    var select3 = $("#accessSelect3").val();
    var select4 = $("#accessSelect4").val();
    var select5 = $("#accessSelect5").val();

    // var config1 = [];
    var config2 = [];
    var config3 = [];
    var config4 = [];
    var config5 = [];

    // $.each($("input[name='config1']:checked"), function(){
    //     config1.push($(this).val());
    // });
    $.each($("input[name='config2']:checked"), function(){
        config2.push($(this).val());
    });
    $.each($("input[name='config3']:checked"), function(){
        config3.push($(this).val());
    });
    $.each($("input[name='config4']:checked"), function(){
        config4.push($(this).val());
    });
    $.each($("input[name='config5']:checked"), function(){
        config5.push($(this).val());
    });

    // var dashboard = config1;
    var tasklist = config2;
    var projectlist = config3;
    var memberrecords = config4;
    var usermanagement = config5;

    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('val_web_user') }}",
        method: "POST",
        data:{
            type:"NEW_USER",
            name:name,
            email:email,
            newPass:newPass,
            confirmPass:confirmPass,
            isAdmin:isAdmin,
            select2:select2,
            select3:select3,
            select4:select4,
            select5:select5,
            tasklist:tasklist,
            projectlist:projectlist,
            memberrecords:memberrecords,
            usermanagement:usermanagement
        }, 
        dataType: "json",
        success:function(data)
        {
            if(data.success.length > 0){

                var x = document.getElementById("newUserSubmit");
                x.innerHTML = "Loading...";
                document.getElementById("newUserSubmit").disabled = true;

                $.ajax({
                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    url: "{{ route('new_web_user') }}",
                    method: "POST",
                    data:{
                        type:"NEW_USER",
                        name:name,
                        email:email,
                        newPass:newPass,
                        confirmPass:confirmPass,
                        isAdmin:isAdmin,
                        select2:select2,
                        select3:select3,
                        select4:select4,
                        select5:select5,
                        tasklist:tasklist,
                        projectlist:projectlist,
                        memberrecords:memberrecords,
                        usermanagement:usermanagement
                    }, 
                    dataType: "json",
                    success:function(data)
                    {
                        if(data.success.length > 0){
                            location.reload();
                            // toastr.success(data.success[0]);
                        }else{
                            toastr.error(data.error[0]);
                            // alert(data.error[0]);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }else{
                toastr.error(data.error[0]);
                // alert(data.error[0]);
            }
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
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
    var isAdmin = $(this).attr('data-is_admin');
    var accountType = "{{auth()->user()->is_admin}}";

    $("#HeaderUserEdit").html(company_id);

    $("#editUserSubmit").attr("data-id",id);
    $("#editUserSubmit").attr("data-companyid",company_id);
    $("#editUserSubmit").attr("data-name",name);
    $("#editUserSubmit").attr("data-email",email);
    $("#editUserSubmit").attr("data-created_by",created_by);
    $("#editUserSubmit").attr("data-create_at",created_at);



    $("#userNameEdit").val(name);
    $("#userEmailEdit").val(email);


    if(accountType == 2){
        if(isAdmin == 1){
        $("#isAdminEdit").html("<option value='1' selected>Admin</option><option value='2'>Super Admin</option>");
        
        }else{
            $("#isAdminEdit").html("<option value='1'>Admin</option><option value='2' selected>Super Admin</option>");
        }
    }else{
        if(isAdmin == 1){
        $("#isAdminEdit").html("<option value='1' selected>Admin</option>");
        
        }else{
            $("#isAdminEdit").html("<option value='1'>Admin</option>");
        }

    }
    
    $("#EditLabelName").attr("class","active");
    $("#EditLabelEmail").attr("class","active");

    
});
</script>


<script>
$("#editUserSubmit").click(function () {
    var id = $(this).attr('data-id');
    var company_id = $(this).attr('data-companyid');
    var name = $("#userNameEdit").val();
    var email = $("#userEmailEdit").val();
    // var name = $(this).attr('data-name');
    // var email = $(this).attr('data-email');
    // var created_by = $(this).attr('data-created_by');
    // var created_at = $(this).attr('data-create_at');.

    var curPass = $("#userCurrPassEdit").val();

    var newPass = $("#userNewPassEdit").val();
    var confirmPass = $("#userConfirmPassEdit").val();
    var isAdmin = $("#isAdminEdit").val();

    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('val_edit_web_user') }}",
        method: "POST",
        data:{
            type:"EDIT_USER",
            code:company_id,
            name:name,
            email:email,
            curPass:curPass,
            newPass:newPass,
            confirmPass:confirmPass,
            isAdmin:isAdmin
        }, 
        dataType: "json",
        success:function(data)
        {
            if(data.success.length > 0){

                var x = document.getElementById("editUserSubmit");
                x.innerHTML = "Loading...";
                document.getElementById("editUserSubmit").disabled = true;

                $.ajax({
                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    url: "{{ route('edit_web_user') }}",
                    method: "POST",
                    data:{
                        type:"EDIT_USER",
                        code:company_id,
                        name:name,
                        email:email,
                        curPass:curPass,
                        newPass:newPass,
                        confirmPass:confirmPass,
                        isAdmin:isAdmin
                    }, 
                    dataType: "json",
                    success:function(data)
                    {
                        if(data.success.length > 0){
                            location.reload();
                            // toastr.success(data.success[0]);
                        }else{
                            toastr.error(data.error[0]);
                            // alert(data.error[0]);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }else{
                toastr.error(data.error[0]);
                // alert(data.error[0]);
            }
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 


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
    
    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('val_delete_web_user') }}",
        method: "POST",
        data:{
            type:"DELETE_USER",
            code:company_id,
            name:name,
            email:email
        }, 
        dataType: "json",
        success:function(data)
        {
            if(data.success.length > 0){
                var x = document.getElementById("delSubmit");
                x.innerHTML = "Loading...";
                document.getElementById("delSubmit").disabled = true;

                $.ajax({
                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    url: "{{ route('delete_web_user') }}",
                    method: "POST",
                    data:{
                        type:"DELETE_USER",
                        code:company_id,
                        name:name,
                        email:email
                    }, 
                    dataType: "json",
                    success:function(data)
                    {
                        if(data.success.length > 0){
                            location.reload();
                            // toastr.success(data.success[0]);
                        }else{
                            toastr.error(data.error[0]);
                            // alert(data.error[0]);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }else{
                toastr.error(data.error[0]);
                // alert(data.error[0]);
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

<script>
//Hide show
    // $(".access-select").on('change', function() {
    //         var id = $(this).attr('data-id');
    //         if(this.value == "ALL"){
    //            $(".access-right-"+id).hide();
    //         }
    //         else if (this.value == "NO"){
    //             $(".access-right-"+id).hide();
    //         }
    //         else if(this.value == "CONFIG"){
    //             $(".access-right-"+id).show();
    //         }
    //   });
//Hide show
$("[id^=accessSelect]").on('change', function() { 
    var $accessRights = $(this).closest('.row').children('[class*=access-right]');
    if($(this).val() == "CONFIG") {
        $accessRights.show();
    }
    else {
       $accessRights.hide();
    }
});
  
</script>

<script>
//Show Modal Manage Access Edit
    $(".manageAccessEdit").click(function () {
        
        var id = $(this).attr('data-id');
        var company_id = $(this).attr('data-companyid');
        var name = $(this).attr('data-name');
        var email = $(this).attr('data-email');
        var created_by = $(this).attr('data-created_by');
        var created_at = $(this).attr('data-create_at');
        var isAdmin = $(this).attr('data-is_admin');

        $("#HeaderMA").html(company_id);
        $("#userMA").html(name);

        $("#MASubmit").attr("data-id",id);
        $("#MASubmit").attr("data-companyid",company_id);
        $("#MASubmit").attr("data-name",name);
        $("#MASubmit").attr("data-email",email);
        $("#MASubmit").attr("data-created_by",created_by);
        $("#MASubmit").attr("data-create_at",created_at);


        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('manage_access_edit') }}",
            method: "POST",
            data:{
                proceed:"TRUE",
                type:"MANAGE_ACCESS_EDIT",
                company_id:company_id
            }, 
            success:function(data)
            {
                $("#MngAcssDiv").html(data);
            },
            error: function(xhr, ajaxOptions, thrownError){
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
        $('#MAUserModal').modal('show');
    });
//Show Modal Manage Access Edit
</script>


<script>
//Update Usermanagement
$("#MASubmit").click(function () {
    var companyID = $(this).attr('data-companyid');

    // var select1 = $("#accessSelectEdit1").val();
    var select2 = $("#accessSelectEdit2").val();
    var select3 = $("#accessSelectEdit3").val();
    var select4 = $("#accessSelectEdit4").val();
    var select5 = $("#accessSelectEdit5").val();

    // var config1 = [];
    var config2 = [];
    var config3 = [];
    var config4 = [];
    var config5 = [];

    // $.each($("input[name='configE1']:checked"), function(){
    //     config1.push($(this).val());
    // });
    $.each($("input[name='configE2']:checked"), function(){
        config2.push($(this).val());
    });
    $.each($("input[name='configE3']:checked"), function(){
        config3.push($(this).val());
    });
    $.each($("input[name='configE4']:checked"), function(){
        config4.push($(this).val());
    });
    $.each($("input[name='configE5']:checked"), function(){
        config5.push($(this).val());
    });

    // var dashboard = config1;
    var tasklist = config2;
    var projectlist = config3;
    var memberrecords = config4;
    var usermanagement = config5;

    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('manage_access_update_val') }}",
        method: "POST",
        data:{
            type:"UPDATE_ACCESS",
            companyID:companyID,
            select2:select2,
            select3:select3,
            select4:select4,
            select5:select5,
            tasklist:tasklist,
            projectlist:projectlist,
            memberrecords:memberrecords,
            usermanagement:usermanagement
        }, 
        dataType: "json",
        success:function(data)
        {
            if(data.success.length > 0){

                var x = document.getElementById("MASubmit");
                x.innerHTML = "Loading...";
                document.getElementById("MASubmit").disabled = true;

                $.ajax({
                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    url: "{{ route('manage_access_update') }}",
                    method: "POST",
                    data:{
                        type:"UPDATE_ACCESS",
                        companyID:companyID,
                        select2:select2,
                        select3:select3,
                        select4:select4,
                        select5:select5,
                        tasklist:tasklist,
                        projectlist:projectlist,
                        memberrecords:memberrecords,
                        usermanagement:usermanagement
                    }, 
                    dataType: "json",
                    success:function(data)
                    {
                        if(data.success.length > 0){
                            // toastr.success(data.success[0]);
                            location.reload();
                        }else{
                            toastr.error(data.error[0]);
                            // alert(data.error[0]);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }else{
                toastr.error(data.error[0]);
                // alert(data.error[0]);
            }
        },
        error: function(xhr, ajaxOptions, thrownError){
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
//Update Usermanagement
</script>
@endsection