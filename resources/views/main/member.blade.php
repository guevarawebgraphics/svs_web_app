@extends('layouts.app_admin')
@section('content')


<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-file-alt"></i> Member Records</h2></div>
    <button type="button" class="btn btn-primary float-right newMember" id="newMember"><i class="fa fa-plus"></i>&nbsp;New Member</button>
    
    <div class="container" style="margin-top:3em;">

      @include('main.sessionMember')

    <div class="container svs-overflow">
      
      @include('main.memberDatatable')
            
    </div>
    </div>
</div>


<!-- Modal: New Member -->
<div class="modal fade" id="newMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">New Member</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-primary">
                <strong>Note :</strong> 
                You may register your new customer & stakeholder for the project. All fields are required.
                <br>
            </p>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="text" id="memName" name="memName" class="form-control">
                        <label for="memName" class="">Member Name</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="email" id="memEmail" name="memEmail" class="form-control">
                        <label for="memEmail" class="">Email</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="number" id="memNo" name="memNo" class="form-control" regex="/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/">
                        <label for="memNo" class="">Contact No</label>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="text" id="memPosition" name="memPosition" class="form-control">
                        <label for="memPosition" class="">Position</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="md-form">
                        <textarea type="text" id="memAddr" name="memAddr" maxlength="190" class="form-control md-textarea"></textarea>
                        <label for="memAddr">Address</label>
                    </div>
                </div>
            </div>

            <div class="row">
              <div class="col-md-12">
                <div class="md-form">
                    <select class="mdb-select" name="memCat" id="memCat" style="width:300px!important;">
                        <option value="" disabled selected>Choose your option</option>
                        <option value="CUSTOMER">Customer</option>
                        <option value="STAKEHOLDER">Stakeholder</option>
                      </select>
                </div>
              </div>
            </div>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary waves-effect waves-light" data-dismiss="modal">Close</button>
        <button class="btn btn-primary waves-effect waves-light" id="newSubmit">Submit</button>
      </div>
    </div>
  </div>
</div>



<!-- Modal: Delete Member -->
<div class="modal fade" id="delMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Delete Member : <span id="memDelSpan"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-danger">
                <strong>Note danger:</strong> 
                You are trying to delete this record <em id="memNameEM"></em>. This record will not be useful to any transaction
                <br>
            </p>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger waves-effect waves-light" data-dismiss="modal">Close</button>
        <button class="btn btn-danger waves-effect waves-light" id="delSubmit">Delete</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal: Edit Member -->
<div class="modal fade" id="editMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Update Member : <span id="memEditSpan"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-success">
                <strong>Note:</strong> 
                You are trying to update this record  <em id="memNameEdit"></em>. 
                <br>
            </p>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="text" id="memFNameEdit" name="memFNameEdit" class="form-control">
                        <label for="memFNameEdit" class="" id="memNameEditLabel">Member Name</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="email" id="memEmailEdit" name="memEmailEdit" class="form-control">
                        <label for="memEmailEdit" class="" id="memEmailEditLabel">Email</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="number" id="memNoEdit" name="memNoEdit" class="form-control" regex="/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/">
                        <label for="memNoEdit" class="" id="memNoEditLabel">Contact No</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="text" id="memPositionEdit" name="memPositionEdit" class="form-control">
                        <label for="memPositionEdit" class="" id="memPositionEditLabel">Position</label>
                    </div>
                </div>
            </div>

            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-md-12">
                    <div class="md-form">
                        <textarea type="text" id="memAddrEdit" name="memAddrEdit" maxlength="190" class="form-control md-textarea"></textarea>
                        <label for="memAddrEdit" id="memAddrEditLabel">Address</label>
                    </div>
                </div>
            </div>

            <div class="row">
              <div class="col-md-12">
                <div class="md-form">
                    <select class="mdb-select" name="memCatEdit" id="memCatEdit" style="width:300px!important;">
                        
                    </select>
                </div>
              </div>
            </div>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success waves-effect waves-light" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect waves-light" id="editSubmit">Update</button>
      </div>
    </div>
  </div>
</div>


<script>
//Show Modal New Member
  $(".newMember").click(function () {
      $('#newMemberModal').modal('show');
  });
//Show Modal New Member

//Submit New Member
  $("#newSubmit").click(function () {
    var name = $("#memName").val();
    var email = $("#memEmail").val();
    var contact = $("#memNo").val();
    var position = $("#memPosition").val();
    var addr = $("#memAddr").val();
    var cat = $("#memCat").val();

    $.ajax({
      headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
      url: "{{ route('val_new_member') }}",
      method: "POST",
      data:{
          proceed:"TRUE",
          type:"NEW_MEMBER",
          name:name,
          email:email,
          contact:contact,
          position:position,
          addr:addr,
          cat:cat
      }, 
      dataType: "json",
      success:function(data)
      {
        if(data.success.length > 0){
            var x = document.getElementById("newSubmit");
            x.innerHTML = "Loading...";
            document.getElementById("newSubmit").disabled = true;
          
            $.ajax({
              headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
              url: "{{ route('new_member') }}",
              method: "POST",
              data:{
                  proceed:"TRUE",
                  type:"NEW_MEMBER",
                  name:name,
                  email:email,
                  contact:contact,
                  position:position,
                  addr:addr,
                  cat:cat
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
        }else{
            toastr.error(data.error[0]);
        }
      },
      error: function(xhr, ajaxOptions, thrownError){
        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    }); 
  });
//Submit New Member

//Show Modal Delete Member
  $(".delMember").click(function () {
      $('#delMemberModal').modal('show');
      var id = $(this).attr('data-id');
      var memcode = $(this).attr('data-memcode');
      var name = $(this).attr('data-name');
      var email = $(this).attr('data-email');
      var contact = $(this).attr('data-contact');
      var address = $(this).attr('data-address');
      var date = $(this).attr('data-date');
      var type = $(this).attr('data-type');

      $('#memDelSpan').html(memcode);
      $('#memNameEM').html("("+name+")");

      $('#delSubmit').attr('data-id',id);
      $('#delSubmit').attr('data-memcode',memcode);
      $('#delSubmit').attr('data-name',name);
      $('#delSubmit').attr('data-email',email);
      $('#delSubmit').attr('data-contact',contact);
      $('#delSubmit').attr('data-address',address);
      $('#delSubmit').attr('data-date',date);
      $('#delSubmit').attr('data-type',type);

  });
//Show Modal Delete Member

//Submit Delete Member
  $("#delSubmit").click(function () {
    var memCode = $(this).attr('data-memcode');
    var name = $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var contact = $(this).attr('data-contact');
    var addr = $(this).attr('data-address');
    var cat = $(this).attr('data-type');

    $.ajax({
      headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
      url: "{{ route('val_new_member') }}",
      method: "POST",
      data:{
          proceed:"TRUE",
          type:"DELETE_MEMBER",
          code:memCode,
          name:name,
          email:email,
          contact:contact,
          addr:addr,
          cat:cat
          
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
              url: "{{ route('new_member') }}",
              method: "POST",
              data:{
                  proceed:"TRUE",
                  type:"DELETE_MEMBER",
                  code:memCode,
                  name:name,
                  email:email,
                  contact:contact,
                  addr:addr,
                  cat:cat
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
        }else{
            toastr.error(data.error[0]);
        }
      },
      error: function(xhr, ajaxOptions, thrownError){
        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    }); 
  });
//Submit Delete Member

//Show Modal Edit Member
  $(".editMember").click(function () {
      $('#editMemberModal').modal('show');

      var id = $(this).attr('data-id');
      var memcode = $(this).attr('data-memcode');
      var name = $(this).attr('data-name');
      var email = $(this).attr('data-email');
      var contact = $(this).attr('data-contact');
      var position = $(this).attr('data-position');
      var address = $(this).attr('data-address');
      var date = $(this).attr('data-date');
      var type = $(this).attr('data-type');

      $('#memNameEditLabel').attr('class','active');
      $('#memFNameEdit').val(name);

      $('#memEmailEditLabel').attr('class','active');
      $('#memEmailEdit').val(email);

      $('#memNoEditLabel').attr('class','active');
      $('#memNoEdit').val(contact);

      $('#memPositionEditLabel').attr('class','active');
      $('#memPositionEdit').val(position);

      $('#memAddrEditLabel').attr('class','active');
      $('#memAddrEdit').val(address);

      if(type == "CUSTOMER")
      {
        $('#memCatEdit').html('<option value="CUSTOMER" selected>Customer</option><option value="STAKEHOLDER">Stakeholder</option>');
      }
      else
      {
        $('#memCatEdit').html('<option value="CUSTOMER">Customer</option><option value="STAKEHOLDER" selected>Stakeholder</option>');
      }

      $('#memEditSpan').html(memcode);
      $('#memNameEdit').html("("+name+")");
      $('#editSubmit').attr('data-id',id);
      $('#editSubmit').attr('data-memcode',memcode);
      $('#editSubmit').attr('data-name',name);
      $('#editSubmit').attr('data-email',email);
      $('#editSubmit').attr('data-contact',contact);
      $('#editSubmit').attr('data-position',position);
      $('#editSubmit').attr('data-address',address);
      $('#editSubmit').attr('data-date',date);
      $('#editSubmit').attr('data-type',type);

     

  });
//Show Modal Edit Member

//Submit Edit Member
  $("#editSubmit").click(function () {
    var memCode = $(this).attr('data-memcode');
    var name = $("#memFNameEdit").val();
    var email = $("#memEmailEdit").val();
    var contact = $("#memNoEdit").val();
    var position = $("#memPositionEdit").val();
    var addr = $("#memAddrEdit").val();
    var cat = $("#memCatEdit").val();

    $.ajax({
      headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
      url: "{{ route('val_new_member') }}",
      method: "POST",
      data:{
          proceed:"TRUE",
          type:"EDIT_MEMBER",
          code:memCode,
          name:name,
          email:email,
          contact:contact,
          position:position,
          addr:addr,
          cat:cat
      }, 
      dataType: "json",
      success:function(data)
      {
        if(data.success.length > 0){
            var x = document.getElementById("editSubmit");
            x.innerHTML = "Loading...";
            document.getElementById("editSubmit").disabled = true;
          
            $.ajax({
              headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
              url: "{{ route('new_member') }}",
              method: "POST",
              data:{
                  proceed:"TRUE",
                  type:"EDIT_MEMBER",
                  code:memCode,
                  name:name,
                  email:email,
                  contact:contact,
                  position:position,
                  addr:addr,
                  cat:cat
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
        }else{
            toastr.error(data.error[0]);
        }
      },
      error: function(xhr, ajaxOptions, thrownError){
        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    }); 

  });
//Submit Edit Member
</script>

<script>
    // Material Design example
      $(document).ready(function () {
      $('#dtMaterialDesignExample').DataTable({
          "columnDefs": [
              { "orderable": false, "targets": 6 }
          ]
      });
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
    // Material Design example
</script>

@endsection