@if(!empty(session()->get('successRetrack')))
    <br>
        @if(!empty(session()->get('successRetrack')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successRetrack')}}</strong> 
        @endif
    <br>
    Task Code: {{session()->get('codeRetrack')}}
    <br>
    Title: {{session()->get('titleRetrack')}}
    <br>
    Description: {{session()->get('descRetrack')}}

    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

    </div>
@endif
@php
    session()->forget('successRetrack');
    session()->forget('titleRetrack');
    session()->forget('descRetrack');
    session()->forget('codeRetrack');
@endphp