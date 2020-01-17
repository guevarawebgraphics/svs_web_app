@extends('layouts.app_admin')
@section('content')

<div class="container">
    <div class="card">
            <div class="card-body">
            <h3 class="card-title"><i class="fa fa-cog"></i> Account Settings</h3>
            <p class="note note-light">
                <strong>Note:</strong> 
                Update your account credential here.
                
            </p>


            @include('main.sessionAccountSettings')

            <br>
            <p class="h5">Personal Information</p>
            <div class="row">
                <div class="col-md-6">
                    <div class="md-form mb-0">
                    <input type="text" id="userName" name="userName" value="{{auth()->user()->name}}" class="form-control">
                        <label for="userName" class="active">Name *</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="md-form mb-0">
                        <input type="text" id="userEmail" name="userEmail" value="{{auth()->user()->email}}" class="form-control">
                        <label for="userEmail" class="active">Email *</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="password" id="userCurrentPassword" name="userCurrentPassword" class="form-control">
                        <label for="userCurrentPassword" class="">Current Password *</label>
                    </div>
                </div>
            </div>
            <br><hr><br>
            <p class="h5">Change Password</p>
            <p class="card-text">Updating your password is optional. You may leave this blank if you don't want to change it.</p>
            
            
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="password" id="userNewPassword" name="userNewPassword" class="form-control">
                        <label for="userNewPassword" class="">New Password</label>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="password" id="userConfirmPassword" name="userConfirmPassword" class="form-control">
                        <label for="userConfirmPassword" class="">Confirm New Password</label>
                    </div>
                </div>
            </div>

            <br>
            <button class="btn btn-outline-success waves-effect waves-light">Clear</button>
            <button id="infoUpdate" class="btn btn-success waves-effect waves-light">Update</button>
        </div>
      </div>
</div>


<script>
$("#infoUpdate").click(function () {
    var name = $("#userName").val();
    var email = $("#userEmail").val();
    var currentPass = $("#userCurrentPassword").val();
    var newPass = $("#userNewPassword").val();
    var confirmPass = $("#userConfirmPassword").val();

        $.ajax({
            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            url: "{{ route('account_settings_val') }}",
            method: "POST",
            data:{
                type:"EDIT_USER",
                code:"{{auth()->user()->company_id}}",
                name:name,
                email:email,
                currentPass:currentPass,
                newPass:newPass,
                confirmPass:confirmPass
            }, 
            dataType: "json",
            success:function(data)
            {
                if(data.success.length > 0){

                    var x = document.getElementById("infoUpdate");
                    x.innerHTML = "Loading...";
                    document.getElementById("infoUpdate").disabled = true;

                    $.ajax({
                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        url: "{{ route('account_settings_update') }}",
                        method: "POST",
                        data:{
                            type:"EDIT_USER",
                            code:"{{auth()->user()->company_id}}",
                            name:name,
                            email:email,
                            currentPass:currentPass,
                            newPass:newPass,
                            confirmPass:confirmPass
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


@endsection