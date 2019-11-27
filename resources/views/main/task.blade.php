@extends('layouts.app_admin')
@section('content')

<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-tasks"></i>&nbsp;Task List</h2></div>
    <!-- Button trigger modal-->
    <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#modalTask"><i class="fa fa-plus"></i>&nbsp;New Task</button>
    
    <div class="container" style="margin-top:3em;">
        @include('main.sessionTask')

    <div class="container svs-overflow" id="dtContainer">
        @include('main.taskDatatable')
       
    </div>
    </div>
</div>


<!-- Modal: modalTask -->
<div class="modal fade" id="modalTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">New Task</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">
            <form >

                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-md-12">
                        <div class="md-form mb-0">
                            <input type="text" id="task_title" name="task_title" class="form-control">
                            <label for="task_title" class="">Title</label>
                        </div>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12">
                        <div class="md-form">
                            <textarea type="text" id="desc" name="desc" maxlength="190" class="form-control md-textarea"></textarea>
                            {{-- <label for="desc">Description</label> --}}
                            <label for="desc">Work Breakdown Structure</label>
                        </div>
                    </div>
                </div>
                <!--Grid row-->

            </form>

        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" id="submitTask">Submit</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal: delTask -->
<div class="modal fade" id="delTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Delete Task : <span id="dTC"></span></h4>
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
                Title: <em id="delTitle"></em><br>
                Description <em id="delDesc"></em><br>
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


<!-- Modal: editTask -->
<div class="modal fade" id="editTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Edit Task : <span id="eTC"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="container">

                <p class="note note-success"><strong>Note update:</strong> 
                    You are trying to update this record. Any changes made will be applied to all transactions
                </p>

                <form >

                        <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-12">
                                <div class="md-form mb-0" id="divTitle">

                                </div>
                            </div>
                            <!--Grid column-->
        
        
                        </div>
                        <!--Grid row-->
        
                        <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-12">
        
                                <div class="md-form" id="divTxtarea">

                                </div>
        
                            </div>
                        </div>
                        <!--Grid row-->
        
                    </form>

        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
        <button class="btn btn-success waves-effect" id="updateTask">Update</button>
      </div>
    </div>
  </div>
</div>


<script>
$(".editTask").click(function () {
    $('#editTask').modal('show');
    var id = $(this).attr('data-id');
    var title = $(this).attr('data-title')
    var desc = $(this).attr('data-desc');
    var code = $(this).attr('data-code');
    var crt = $(this).attr('data-crt');
    $("#divTitle").html("<input type='text' value='"+title+"' id='editTitle' name='editTitle' class='form-control'> <label for='editTitle' class='active'>Title</label>");
    $("#divTxtarea").html("<textarea type='text' id='editDesc' name='editDesc' maxlength='190' class='form-control md-textarea'>"+desc+"</textarea> <label for='editDesc' class='active'>Work Breakdown Structure</label>");
    $("#eTC").html(code);
    $("#updateTask").attr("data-id",id);
    $("#updateTask").attr("data-title",title);
    $("#updateTask").attr("data-desc",desc);
    $("#updateTask").attr("data-code",code);
    $("#updateTask").attr("data-crt",crt);
});

$("#updateTask").click(function () {
    var id = $(this).attr('data-id');
    var title = $(this).attr('data-title')
    var desc = $(this).attr('data-desc');
    var code = $(this).attr('data-code');
    var crt = $(this).attr('data-crt');

    var nTitle = $('#editTitle').val();
    var nDesc = $('#editDesc').val();

    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('update_task_val') }}",
        method: "POST",
        data:{
            type:"update_task",
            id:id,
            title:nTitle,
            desc:nDesc,
            crt:crt,
            code:code
        }, 
        dataType: "json",
        success:function(data)
        {
            if(data.success.length > 0){
                var x = document.getElementById("updateTask");
                x.innerHTML = "Loading...";
                document.getElementById("updateTask").disabled = true;

                $.ajax({
                    headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    url: "{{ route('update_task') }}",
                    method: "POST",
                    data:{
                        type:"update_task",
                        id:id,
                        title:nTitle,
                        desc:nDesc,
                        crt:crt,
                        code:code
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

$(".delTask").click(function () {
    $('#delTask').modal('show');
    var id = $(this).attr('data-id');
    var title = $(this).attr('data-title')
    var desc = $(this).attr('data-desc');
    var code = $(this).attr('data-code');
    var crt = $(this).attr('data-crt');
    $("#dTC").html(code);
    $('#delTitle').html(title);
    $('#delDesc').html(desc);
    $("#delSubmit").attr("data-id",id);
    $("#delSubmit").attr("data-title",title);
    $("#delSubmit").attr("data-desc",desc);
    $("#delSubmit").attr("data-code",code);
    $("#delSubmit").attr("data-crt",crt);
});

$("#delSubmit").click(function () {
    var id = $(this).attr('data-id');
    var title = $(this).attr('data-title')
    var desc = $(this).attr('data-desc');
    var code = $(this).attr('data-code');
    var crt = $(this).attr('data-crt');

    var x = document.getElementById("delSubmit");
    x.innerHTML = "Loading...";
    document.getElementById("delSubmit").disabled = true;

    $.ajax({
        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        url: "{{ route('delete_task') }}",
        method: "POST",
        data:{
            type:"delete_task",
            id:id,
            title:title,
            desc:desc,
            code:code,
            crt:crt
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
});

</script>

<!-- Modal: Submit -->
<script>
    $(document).ready(function(){
        $("#submitTask").click(function(){
            newTask();
        });

        function newTask(){
            var task_title = $('#task_title').val();
            var desc = $('#desc').val();

            $.ajax({
                headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url: "{{ route('task_val') }}",
                method: "POST",
                data:{
                    proceed:"TRUE",
                    task_title:task_title,
                    desc:desc
                }, 
                dataType: "json",
                success:function(data)
                {
                    if(data.success.length > 0){
                        var x = document.getElementById("submitTask");
                        x.innerHTML = "Loading...";
                        document.getElementById("submitTask").disabled = true;
                        $.ajax({
                            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                            url: "{{ route('task_save') }}",
                            method: "POST",
                            data:{
                                proceed:"TRUE",
                                task_title:task_title,
                                desc:desc
                            }, 
                            dataType: "json",
                            success:function(data)
                            {
                                if(data.success.length > 0){
                                    var taskCode = data.success[0];
                                    $.ajax({
                                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                                        url: "{{ route('session_success') }}",
                                        method: "POST",
                                        data:{
                                            type:"TASK",
                                            task_title:task_title,
                                            desc:desc,
                                            code:taskCode
                                        }, 
                                        dataType: "json",
                                        success:function(data)
                                        {
                                            if(data.success.length > 0){
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
                    }else{
                        toastr.error(data.error[0]);
                        // alert(data.error[0]);
                    }
                },
                error: function(xhr, ajaxOptions, thrownError){
                    console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
    });
</script>
<!-- Modal: Submit -->


<!-- Modal: modalTask -->
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