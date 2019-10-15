
@if(!empty(session()->get('successProj')) || !empty(session()->get('deleteProj')))
    <br>
        @if(!empty(session()->get('successProj')))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successProj')}}</strong> 
        @elseif(!empty(session()->get('deleteProj')))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong><i class="fas fa-times"></i>&nbsp;{{session()->get('deleteProj')}}</strong> 
        @endif
    <br>
    Project Code: {{session()->get('codeProj')}}
    <br>
    Title: {{session()->get('titleProj')}}
    <br>
    Description: {{session()->get('descProj')}} 
    <br>
    Longitude: {{session()->get('lonProj')}}
    <br>
    Latitude: {{session()->get('latProj')}}
    <br>
    Address: {{session()->get('addrProj')}}

    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

    </div>
@endif
@php
    session()->forget('successProj');
    session()->forget('deleteProj');
    session()->forget('titleProj');
    session()->forget('descProj');
    session()->forget('lonProj');
    session()->forget('latProj');
    session()->forget('addrProj');
    session()->forget('codeProj');
@endphp