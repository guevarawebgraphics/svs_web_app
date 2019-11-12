<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    {{-- <script src="{{ asset('js/app.js') }}" defer></script> --}}

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="{{ asset('css/mdb.min.css') }}" rel="stylesheet">

    <!-- Your custom styles (optional) -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">

    <!-- JQuery -->
    <script type="text/javascript" src="{{ asset('js/jquery-3.4.1.min.js') }}"></script>

    <!-- DataTables CSS -->
    <link href="{{ asset('css/addons/datatables.min.css') }}" rel="stylesheet">
    <!-- DataTables JS -->
    <script src="{{ asset('js/addons/datatables.min.js') }}"></script>

    <!-- DataTables Select CSS -->
    <link href="{{ asset('css/addons/datatables-select.min.css') }}" rel="stylesheet">
    <!-- DataTables Select JS -->
    <script src="{{ asset('js/addons/datatables-select.min.js') }}"></script>

    <!-- Toastr CSS -->
    <link href="{{ asset('css/addons/toastr.min.css') }}" rel="stylesheet">
    <!-- Toastr JS -->
    <script src="{{ asset('js/addons/toastr.min.js') }}"></script>

    <!-- Load more -->
    <script src="{{asset('plugins/static-load-more/jquery.simpleLoadMore.min.js') }}"></script>

</head>
<body>
    
    @include('includes.nav') 
    
    <div id="app">
        <main class="py-4">
            @yield('content')
        </main>
    </div>



    <!-- SCRIPTS -->
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="{{ asset('js/popper.min.js') }}"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="{{ asset('js/bootstrap.min.js') }}"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="{{ asset('js/mdb.min.js') }}"></script>
</body>
</html>
