@extends('layouts.app_admin')
@section('content')


<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-file-alt"></i> Member Records</h2></div>
    <button type="button" class="btn btn-primary float-right newMember" id="newMember"><i class="fa fa-plus"></i>&nbsp;New Member</button>
    
    <div class="container" style="margin-top:3em;">

        <!-- Session -->

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
                <strong>Note danger:</strong> 
                You are trying to delete this record <em id="memNameEM"></em>. This record will not be useful to any transaction
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
                        <input type="text" id="memEmail" name="memEmail" class="form-control">
                        <label for="memEmail" class="">Email</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="md-form mb-0">
                        <input type="number" id="memNo" name="memNo" class="form-control">
                        <label for="memNo" class="">Contact No</label>
                    </div>
                </div>
            </div>
            <!--Grid row-->
            <div class="row">

                <!--Grid column-->
                <div class="col-md-12">

                    <div class="md-form">
                        <textarea type="text" id="memAddr" name="memAddr" maxlength="190" class="form-control md-textarea"></textarea>
                        <label for="memAddr">Address</label>
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
        <h4 class="modal-title" id="myModalLabel">Delete Member : <span id="memEditSpan"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <p class="note note-success">
                <strong>Note:</strong> 
                You are trying to delete this record  <em id="memNameEdit"></em>. This record will not be useful to any transaction
                <br>
            </p>
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
$(".newMember").click(function () {
    $('#newMemberModal').modal('show');
});

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

$(".editMember").click(function () {
    $('#editMemberModal').modal('show');

    var id = $(this).attr('data-id');
    var memcode = $(this).attr('data-memcode');
    var name = $(this).attr('data-name');
    var email = $(this).attr('data-email');
    var contact = $(this).attr('data-contact');
    var address = $(this).attr('data-address');
    var date = $(this).attr('data-date');
    var type = $(this).attr('data-type');

    $('#memDelSpan').html(memcode);
    $('#memNameEdit').html("("+name+")");

    $('#editSubmit').attr('data-id',id);
    $('#editSubmit').attr('data-memcode',memcode);
    $('#editSubmit').attr('data-name',name);
    $('#editSubmit').attr('data-email',email);
    $('#editSubmit').attr('data-contact',contact);
    $('#editSubmit').attr('data-address',address);
    $('#editSubmit').attr('data-date',date);
    $('#editSubmit').attr('data-type',type);

});
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
</script>

@endsection