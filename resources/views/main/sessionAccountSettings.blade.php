@if(!empty(session()->get('successUserAS')))
    <br>
        @if(!empty(session()->get('successUserAS')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successUserAS')}}</strong> 
        @endif
    <br>
    User Code: {{session()->get('webUserCode')}}
    <br>
    Name: {{session()->get('webUserName')}}
    <br>
    Contact: {{session()->get('webUserEmail')}}

    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

    </div>
@endif
@php

    session()->forget('successUserAS');
    session()->forget('webUserCode');
    session()->forget('webUserName');
    session()->forget('webUserEmail');
@endphp
