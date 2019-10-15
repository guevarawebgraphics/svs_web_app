<!--Navbar -->
<nav class="mb-1 navbar navbar-expand-lg navbar-dark svs-nav">
        
<a class="navbar-brand" href="{{ env('APP_URL') }}"><img class="img-fluid svs-logo" style="width:200px;" src="{{ asset('/img/svs2.png') }}"></a>
        
        <button class="navbar-toggler svs-text" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
          aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
          <span class="fa fa-bars"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              
                @if(!empty(auth()->user()->is_admin) && auth()->user()->is_admin != 0)
                <a class="nav-link svs-text" href="/admin/index">
                Dashboard
                @else
                <a class="nav-link svs-text" href="/user/index">
                Home
                @endif
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link svs-text" href="#">Users</a>
            </li>
            <li class="nav-item dropdown">
                @if(!empty(auth()->user()->is_admin) && auth()->user()->is_admin != 0)
                    <a class="nav-link dropdown-toggle svs-text" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false">Project Configuration
                    </a>
                    <div class="dropdown-menu dropdown-default svs-text" aria-labelledby="navbarDropdownMenuLink-333">
                      {{-- <a class="dropdown-item svs-text" href="/admin/location">Location</a> --}}
                      <a class="dropdown-item svs-text" href="/task">Tasks</a>
                      <a class="dropdown-item svs-text" href="/projectlist">Project List</a>
                      <a class="dropdown-item svs-text" href="/assignproject">Assign Project</a>
                    </div>
                @else
                  <a class="nav-link svs-text" href="#">
                    Features
                  </a>
                @endif
            </li>
          </ul>
          <ul class="navbar-nav ml-auto nav-flex-icons">
            <li class="nav-item">
              <a class="nav-link waves-effect waves-light svs-text">
                <i class="fab fa-twitter svs-text"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect waves-light svs-text">
                <i class="fab fa-google-plus-g svs-text"></i>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle svs-text" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user svs-text"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-right dropdown-default"
                aria-labelledby="navbarDropdownMenuLink-333">
                <a class="dropdown-item svs-text" href="#">{{ auth()->user()->name }}</a>
                <a class="dropdown-item svs-text" href="#">Settings</a>
                <form id="out" action="{{route('logout')}}" method="POST">
                    @csrf                                                                                              
                </form>
                <a class="dropdown-item svs-text" onclick="$('#out').submit();">Sign Out</a>
              </div>
            </li>
          </ul>
        </div>
    </nav>
    <!--/.Navbar -->