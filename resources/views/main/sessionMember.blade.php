
@if(!empty(session()->get('successMem')) || !empty(session()->get('deleteMem')))
<br>
    @if(!empty(session()->get('successMem')))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong><i class="fas fa-check"></i>&nbsp;{{session()->get('successMem')}}</strong> 
    @elseif(!empty(session()->get('deleteMem')))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong><i class="fas fa-times"></i>&nbsp;{{session()->get('deleteMem')}}</strong> 
    @endif
<br>
Member Code: {{session()->get('memCode')}}
<br>
Name: {{session()->get('memName')}}
<br>
Email: {{session()->get('memEmail')}} 
<br>
Contact: {{session()->get('memContact')}}
<br>
Type: {{session()->get('memCat')}}
<br>
Address: {{session()->get('memAddr')}}

<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
</button>

</div>
@endif
@php
session()->forget('deleteMem');
session()->forget('successMem');
session()->forget('memCode');
session()->forget('memName');
session()->forget('memEmail');
session()->forget('memContact');
session()->forget('memCat');
session()->forget('memAddr');
@endphp