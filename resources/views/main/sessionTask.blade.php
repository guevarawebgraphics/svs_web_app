@if(!empty(session()->get('successTask')) || !empty(session()->get('deleteTask')))
    <br>
        @if(!empty(session()->get('successTask')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successTask')}}</strong> 
        @elseif(!empty(session()->get('deleteTask')))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-times"></i>&nbsp;{{session()->get('deleteTask')}}</strong> 
        @endif
    <br>
    Task Code: {{session()->get('codeTask')}}
    <br>
    Title: {{session()->get('titleTask')}}
    <br>
    Description: {{session()->get('descTask')}}

    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

    </div>
@endif
@php
    session()->forget('successTask');
    session()->forget('deleteTask');
    session()->forget('titleTask');
    session()->forget('descTask');
    session()->forget('codeTask');
@endphp