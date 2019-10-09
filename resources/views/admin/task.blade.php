@extends('layouts.app_admin')
@section('content')

<div class="container" style="width:100%;">
    <div class="float-left" ><h2><i class="fa fa-tasks"></i>&nbsp;Task List</h2></div>
    <!-- Button trigger modal-->
    <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#modalTask"><i class="fa fa-plus"></i>&nbsp;New Task</button>
    
    <div class="container" style="margin-top:3em;">
    @if(!empty(session()->get('successTask')))
    <br>
    <div class="alert alert-success alert-dismissible fade show svs-success" role="alert">
    <strong>{{session()->get('successTask')}}</strong> 
    <br>
    Title: {{session()->get('titleTask')}}
    <br>
    Weight: {{session()->get('weightTask')}} 
    <br>
    Description: {{session()->get('descTask')}}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
    @php
        session()->forget('successTask');
        session()->forget('titleTask');
        session()->forget('weightTask');
        session()->forget('descTask');
    @endphp
        
    <div class="container svs-overflow" id="dtContainer">
        @include('admin.taskDatatable')
       
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
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="text" id="task_title" name="task_title" class="form-control">
                            <label for="task_title" class="">Title</label>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <input type="number" id="weight" name="weight" class="form-control">
                            <label for="weight" class="">Weight %</label>
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
                            <label for="desc">Description</label>
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
        <h4 class="modal-title" id="myModalLabel">Delete Task</h4>
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
                Title: <em>Title</em><br>
                Description <em>Desc</em><br>
                Weight: <em>11.34</em><br>
            </p>
        </div>
    

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
        <button class="btn btn-danger waves-effect">Delete</button>
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
        <h4 class="modal-title" id="myModalLabel">Edit Task</h4>
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
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="text" id="task_title" name="task_title" class="form-control">
                                    <label for="task_title" class="">Title</label>
                                </div>
                            </div>
                            <!--Grid column-->
        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="number" id="weight" name="weight" class="form-control">
                                    <label for="weight" class="">Weight %</label>
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
                                    <label for="desc">Description</label>
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
        <button class="btn btn-success waves-effect">Delete</button>
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
    var weight = $(this).attr('data-weight');
});

$(".delTask").click(function () {
    $('#delTask').modal('show');
    var id = $(this).attr('data-id');
    var title = $(this).attr('data-title')
    var desc = $(this).attr('data-desc');
    var weight = $(this).attr('data-weight');

    
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
            var weight = $('#weight').val();
            var desc = $('#desc').val();

            $.ajax({
                headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url: "{{ route('task_val') }}",
                method: "POST",
                data:{
                    proceed:"TRUE",
                    task_title:task_title,
                    weight:weight,
                    desc:desc
                }, 
                dataType: "json",
                success:function(data)
                {
                    if(data.success.length > 0){
                        $.ajax({
                            headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                            url: "{{ route('task_save') }}",
                            method: "POST",
                            data:{
                                proceed:"TRUE",
                                task_title:task_title,
                                weight:weight,
                                desc:desc
                            }, 
                            dataType: "json",
                            success:function(data)
                            {
                                if(data.success.length > 0){
                                    $.ajax({
                                        headers:{'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                                        url: "{{ route('session_success') }}",
                                        method: "POST",
                                        data:{
                                            type:"TASK",
                                            task_title:task_title,
                                            weight:weight,
                                            desc:desc
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