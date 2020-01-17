@if(!empty(session()->get('successRetrackUser')))
    <br>
        @if(!empty(session()->get('successRetrackUser')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successRetrackUser')}}</strong> 
        @endif
    <br>
    User Code: {{session()->get('RetrackUserCode')}}
    <br>
    Name: {{session()->get('RetrackUserName')}}
    <br>
    Contact: {{session()->get('RetrackUserEmail')}}
    <br>
    @if(session()->get('RetrackUserType') == 1)
        Type: Admin
    @else
        Type: Super Admin
    @endif

    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

    </div>
@endif
@php
    session()->forget('successRetrackUser');
    session()->forget('RetrackUserName');
    session()->forget('RetrackUserEmail');
    session()->forget('RetrackUserType');
    session()->forget('RetrackUserCode');


@endphp
