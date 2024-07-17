<header class="navbar-dark bg-dark">
    <div id="prenav">
        <div class="container">

            <div class="d-flex">
                @auth
                <div class="text-end logout">
                    <div class="user-badge">
                        <i class="fas fa-user"></i>
                        <span class="lesuser">{{ auth()->user()->name }}</span>
                    </div>
                    <p>&nbsp;|&nbsp;</p>
                    <a href="{{ route('signout') }}" class="btn me-2">Déconnexion</a>
                </div>

                @endauth

                @guest
                <div class="text-end">
                    <a href="{{ route('user-login') }}" class="btn btn-outline-light me-2">Connexion</a>
                    <a href="{{ route('register-user') }}" class="btn btn-warning">Inscription candidat</a>
                </div>
                @endguest
            </div>
        </div>
    </div>
    <div id="yeiu" class="container">
        <div>

            <nav class="navbar navbar-expand-lg sticky-top" id="NavBar">
                <div class="container-fluid">

                    <a href="{{ route('home') }}"
                        class="navbar-brand d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <!-- <?php $logo_site = Voyager::setting('site.logo', ''); ?>
                        <img src="{{ Voyager::image($logo_site) }}" alt="" srcset=""> -->
                        <img src="{!! url('assets/images/logo.png') !!}" alt="" />
                    </a>
                    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar top-bar"></span>
                        <span class="icon-bar middle-bar"></span>
                        <span class="icon-bar bottom-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            {{ (menu('front','front.layouts.partials.menu')) }}
                        </ul>
                    </div>
                </div>
            </nav>

        </div>
    </div>
</header>