<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
{{-- lang="{{ str_replace('_', '-', app()->getLocale()) }}" --}}
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

    <!-- Date Time Picker jQuery -->
    <script type="text/javascript" src="{{asset('plugins/datetimepicker/js/moment.min.js') }}" ></script>
    <script type="text/javascript" src="{{asset('plugins/datetimepicker/js/tempusdominus-bootstrap-4.min.js') }}"></script>
    <link rel="stylesheet" href="{{asset('plugins/datetimepicker/css/tempusdominus-bootstrap-4.min.css') }}" />

    <script type="text/javascript" src="{{asset('plugins/datetimepicker/js/bootstrap-datetimepicker.min.js') }}"></script>
    <link rel="stylesheet" href="{{asset('plugins/datetimepicker/css/bootstrap-datetimepicker.min.css') }}" />


    <!-- Leaflet Map JS -->
    <link rel="stylesheet" href="{{asset('plugins/leaflet/dist/leaflet.css') }}" />
    <script type="text/javascript" src="{{asset('plugins/leaflet/dist/leaflet.js') }}"></script>

    <!-- 
        Note: Link for reference
        CDN: https://cdnjs.cloudflare.com/ajax/libs/esri-leaflet-geocoder/2.2.14/esri-leaflet-geocoder-debug.js
        Original Link   :https://cdn-geoweb.s3.amazonaws.com/esri-leaflet/0.0.1-beta.5/esri-leaflet.js 
                        :https://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.js
                        :https://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.css
    -->
    
    <script src="{{asset('plugins/esri-leaflet/distLink/esri-leaflet.js') }}"></script>
    <script src="{{asset('plugins/esri-leaflet/distLink/esri-leaflet-geocoder.js') }}"></script>
    <link rel="stylesheet" type="text/css" href="{{asset('plugins/esri-leaflet/distLink/esri-leaflet-geocoder.css') }}">
    
    <!-- Search Check List JS -->
    <link rel="stylesheet" href="{{asset('plugins/search-option-list/sol.css') }}" />
    <script type="text/javascript" src="{{asset('plugins/search-option-list/sol.js') }}"></script>

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
