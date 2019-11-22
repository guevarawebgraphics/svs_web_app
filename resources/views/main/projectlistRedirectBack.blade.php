@if(session('errors'))

    <div class="alert alert-danger" role="alert">  
        @foreach($errors as $error)
            <li>{{$error}}</li>
        @endforeach
    </div>
    <hr>
@endif

@if(session('success'))

    <div class="alert alert-success" role="alert"> 
        {{ session('success') }}
    </div>
    <hr>

@endif