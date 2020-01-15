@if(!empty(session()->get('successRetrackMem')))
    <br>
        @if(!empty(session()->get('successRetrackMem')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successRetrackMem')}}</strong> 
        @endif
    <br>
    Member Code: {{session()->get('RetrackMemCode')}}
    <br>
    Name: {{session()->get('RetrackMemName')}}
    <br>
    Contact: {{session()->get('RetrackMemEmail')}} / {{session()->get('RetrackMemContact')}}
    <br>
    Position: {{session()->get('RetrackMemPosition')}}
    <br>
    Type: {{session()->get('RetrackMemType')}}

    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

    </div>
@endif
@php
    session()->forget('successRetrackMem');
    session()->forget('RetrackMemName');
    session()->forget('RetrackMemEmail');
    session()->forget('RetrackMemContact');
    session()->forget('RetrackMemType');
    session()->forget('RetrackMemPosition');
    session()->forget('RetrackMemCode');
@endphp
