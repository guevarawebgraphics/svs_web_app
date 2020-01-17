@if(!empty(session()->get('successUserM')) || !empty(session()->get('deleteUserM')))
    <br>
        @if(!empty(session()->get('successUserM')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successUserM')}}</strong> 
        @elseif(!empty(session()->get('deleteUserM')))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-times"></i>&nbsp;{{session()->get('deleteUserM')}}</strong> 
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
    session()->forget('successUserM');
    session()->forget('deleteUserM');
    session()->forget('webUserCode');
    session()->forget('webUserName');
    session()->forget('webUserEmail');
@endphp
