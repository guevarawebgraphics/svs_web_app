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
              
                <a class="nav-link svs-text" href="/dashboard">
                Dashboard
                <span class="sr-only">(current)</span>
              </a>
            </li>
            
            <li class="nav-item dropdown">
                
                    <a class="nav-link dropdown-toggle svs-text" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false">Project Configuration
                    </a>
                    <div class="dropdown-menu dropdown-default svs-text" aria-labelledby="navbarDropdownMenuLink-333">
                      
                      @if(session()->get('manage_task_no_access_data') != 1)
                      <a class="dropdown-item svs-text" href="/task">Tasks</a>
                      @endif
                      @if(session()->get('manage_proj_no_access_data') != 1)
                      <a class="dropdown-item svs-text" href="/projectlist">Project List</a>
                      @endif
                      @if(session()->get('manage_mem_no_access_data') != 1)
                      <a class="dropdown-item svs-text" href="/member">Member Records</a>
                      @endif
                      
                    </div>
            </li>
            
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle svs-text" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">Retrack <small><em>(Inactive)</em></small></a>
              <div class="dropdown-menu dropdown-default svs-text" aria-labelledby="navbarDropdownMenuLink-444">

                @if(session()->get('manage_task_no_access_data') != 1)
                <a class="dropdown-item svs-text" href="/retrack_task">Task </a>
                @endif
                @if(session()->get('manage_proj_no_access_data') != 1)
                <a class="dropdown-item svs-text" href="/retrack_project">Project List </a>
                @endif
                @if(session()->get('manage_mem_no_access_data') != 1)
                <a class="dropdown-item svs-text" href="/retrack_member">Member Records </a>
                @endif
                @if(session()->get('manage_um_no_access_data') != 1)
                <a class="dropdown-item svs-text" href="/retrack_web_users">Web Console Users</a>
                @endif
              </div>
            </li>

            @if(session()->get('manage_um_no_access_data') != 1)
            <li class="nav-item">
              
                {{-- @if(!empty(auth()->user()->is_admin) && auth()->user()->is_admin != 0) --}}

                <a class="nav-link svs-text" href="/user_management">
                User Management
                </a>
            </li>
            @endif

          </ul>
          <ul class="navbar-nav ml-auto nav-flex-icons">
            {{-- <li class="nav-item">
              <a class="nav-link waves-effect waves-light svs-text">
                <i class="fab fa-twitter svs-text"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect waves-light svs-text">
                <i class="fab fa-google-plus-g svs-text"></i>
              </a>
            </li> --}}
            @php
                $userType = "";
                 if(auth()->user()->is_admin == 1){
                    $userType = "Admin";
                 }else if(auth()->user()->is_admin == 2){
                    $userType = "Super Admin";
                 }
                @endphp
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle svs-text" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user svs-text"></i>&nbsp;&nbsp;&nbsp;{{ auth()->user()->name }} <small>({{$userType}})</small>
              </a>
              <div class="dropdown-menu dropdown-menu-right dropdown-default"
                aria-labelledby="navbarDropdownMenuLink-333">

                
                {{-- <a class="dropdown-item svs-text" href="#">{{ auth()->user()->name }} <small><em><b>({{$userType}})</b></em></small></a> --}}
                <a class="dropdown-item svs-text" href="/account_settings">Account Settings</a>
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