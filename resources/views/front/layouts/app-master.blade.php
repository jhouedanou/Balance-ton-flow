<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.87.0">
    <title>@yield('page_title', setting('site.title') . " - " . setting('site.description'))</title>

    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <!-- Favicon -->
    <?php $admin_favicon = Voyager::setting('admin.icon_image', ''); ?>
    @if($admin_favicon == '')
    <link rel="shortcut icon" href="{{ voyager_asset('images/logo-icon.png') }}" type="image/png">
    @else
    <link rel="shortcut icon" href="{{ Voyager::image($admin_favicon) }}" type="image/png">
    @endif
    <!-- Bootstrap core CSS -->
    <link href="{!! url('assets/css/signin.css') !!}" rel="stylesheet">
    <link href="{!! url('assets/css/style.css') !!}" rel="stylesheet">
    <link href="{!! url('assets/bootstrap/css/bootstrap.min.css') !!}" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.7/css/fileinput.css" media="all"
        rel="stylesheet" type="text/css" />
    <!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> -->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'>

    <link rel='stylesheet'
        href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.3/assets/owl.carousel.min.css'>
    <link rel='stylesheet'
        href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.3/assets/owl.theme.default.min.css'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="{!! url('assets/css/toastr.css') !!}">

    <style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }


    /* spinner */
    #overlay {
        position: fixed;
        top: 0;
        z-index: 100;
        width: 100%;
        height: 100%;
        display: none;
        background: rgba(0, 0, 0, 0.6);
    }

    .cv-spinner {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .spinner {
        width: 40px;
        height: 40px;
        border: 4px #ddd solid;
        border-top: 4px #2e93e6 solid;
        border-radius: 50%;
        animation: sp-anime 0.8s infinite linear;
    }

    @keyframes sp-anime {
        100% {
            transform: rotate(360deg);
        }
    }

    .is-hide {
        display: none;
    }

    .back-btn .fa {
        font-size: 20px;
        color: #000;
    }

    .back-btn {
        color: #000;
        margin: 10px 0px;
    }

    .moyenne span {
        padding: 2px 4px;
        background: #7de7b6;
        color: #000;
        font-weight: bold;
        font-size: 20px;
        border-radius: 100%;
    }

    .see-trans {
        border: 1px solid #ccc;
        color: #fff;
        background-color: #000;
        border-radius: 25px;
        padding: 1px 12px;
        cursor: pointer;
    }
    </style>


    <!-- Custom styles for this template -->
    <link href="{!! url('assets/css/app.css') !!}" rel="stylesheet">
</head>

<body>
    @include('front.layouts.partials.navbar')


    <main class="main">
        @yield('content')
    </main>

    <div id="overlay">
        <div class="cv-spinner">
            <span class="spinner"></span> <span class="text-white"></span>
        </div>

    </div>
    @include('front.layouts.partials.app-footer')

    <script src="{!! url('assets/bootstrap/js/bootstrap.bundle.min.js') !!}"></script>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.7/js/fileinput.js"
        type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.7/themes/fa/theme.js"
        type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.7/js/locales/fr.js"
        type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" type="text/javascript">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript">
    </script>
    @yield('javascript')

    <script>
    var loggedIn = {
        {
            auth() - > check() ? 'true' : 'false'
        }
    };
    var votejury = "{{ route('votejury') }}";
    var modVideo = "{{ route('video') }}";
    var _token = '{{ csrf_token() }}';
    </script>
    <script>
    jQuery(document).ready(function($) {
        /* */

        jQuery('.voter').on('click', function(event) {

            if (loggedIn) {
                /* */
                var $this = $(this);
                $this.button('loading');
                /*  setTimeout(function() {
                    $this.button('reset');
                }, 5000); */

                var urlVote = "{{ route('votes') }}";
                var sslug = $(event.target).data("slug");
                event.preventDefault();

                $.ajax({
                    method: 'POST',
                    url: urlVote,
                    data: {
                        user_id: $(event.target).data("id"),
                        recipe_id: $(event.target).data("recipe"),
                        category_id: $(event.target).data("category"),
                        owner_id: $(event.target).data("owner"),
                        //slug: $(event.target).data("slug"),
                        _token: '{{ csrf_token() }}'
                    },
                    beforeSend: function(data) {


                    },
                    success: function(dataResult) {

                        if (dataResult.status == 200 && dataResult.vote == 0) {
                            toastr.options = {
                                "closeButton": true,
                                "progressBar": true,
                                "debug": false,
                                "positionClass": "toast-top-full-width",
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "3000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            };
                            toastr.success("Vous avez voté avec succès");
                            console.log(dataResult.vote);
                            console.log(dataResult.cptvote);
                            $("#" + sslug + "").html(
                                '<i class="fa fa-thumbs-up" aria-hidden="true"></i> ' +
                                dataResult.cptvote);
                            // window.location.href = "{{ route('user-login')}}";
                        }

                        if (dataResult.status == 200 && dataResult.vote == 1) {

                            toastr.options = {
                                "closeButton": true,
                                "progressBar": true,
                                "debug": false,
                                "positionClass": "toast-top-full-width",
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "3000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            };
                            toastr.error("Vous avez déja  voté");
                            console.log(dataResult.vote);
                        }

                        if (dataResult.status == 200 && dataResult.vote == 2) {

                            toastr.options = {
                                "closeButton": true,
                                "progressBar": true,
                                "debug": false,
                                "positionClass": "toast-top-full-width",
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "3000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            };
                            toastr.error(
                                "Les votes sont terminés ou ne sont pas encore disponible"
                                );
                            console.log(dataResult.vote);
                        }
                    },
                    complete: function() {
                        $this.button('reset');
                        //remove loading gif
                    }

                })
            } else {
                //alert('not Logged In as user!');
                toastr.options = {
                    "closeButton": true,
                    "progressBar": true,
                    "debug": false,
                    "positionClass": "toast-top-full-width",
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "3000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.warning(
                    "Vous devez vous connecter avant de voter ! redirection à la page de connexion ..."
                    );

                setTimeout(function() {
                    window.location.href = "{{ route('user-login')}}";
                }, 3000);

            }

        })
    });
    </script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

    <script src="{!! url('assets/js/toastr.js') !!}"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.3/owl.carousel.min.js'></script>
    <script src="{!! url('assets/js/script.js') !!}"></script>

    @php ($cat = \App\Models\ContestCategory::where('active',1)->first())
    @php ($today = \Carbon\Carbon::parse(\Carbon\Carbon::now())->format('Y-m-d H:i:s'))
    <!-- {{$today}} -->

    @if(request()->route()->getName() == 'home')


    @if(isset($cat))
    @if(($today >= $cat->start_recipe) && ($today <= $cat->end_recipe))

        <script>
        function updateTimer() {
            future = Date.parse("{{$cat->end_recipe}}");
            now = new Date();
            diff = future - now;

            days = Math.floor(diff / (1000 * 60 * 60 * 24));
            hours = Math.floor(diff / (1000 * 60 * 60));
            mins = Math.floor(diff / (1000 * 60));
            secs = Math.floor(diff / 1000);

            d = days;
            h = hours - days * 24;
            m = mins - hours * 60;
            s = secs - mins * 60;

            document.getElementById("timer")
                .innerHTML =
                '<h5><span>Fin d\'ajout des recettes dans : </span></h5>' +
                '<div>' + d + '<span>jours</span></div>' +
                '<div>' + h + '<span>heures</span></div>' +
                '<div>' + m + '<span>minutes</span></div>' +
                '<div>' + s + '<span>seconds</span></div>';
        }
        setInterval('updateTimer()', 1000);
        </script>
        @endif

        @if(($today >= $cat->start_vote) && ($today <= $cat->end_vote))

            <script>
            function updateTimer() {
                future = Date.parse("{{$cat->end_vote}}");
                now = new Date();
                diff = future - now;

                days = Math.floor(diff / (1000 * 60 * 60 * 24));
                hours = Math.floor(diff / (1000 * 60 * 60));
                mins = Math.floor(diff / (1000 * 60));
                secs = Math.floor(diff / 1000);

                d = days;
                h = hours - days * 24;
                m = mins - hours * 60;
                s = secs - mins * 60;

                document.getElementById("timer")
                    .innerHTML =
                    '<h5><span>Fin des votes dans : </span></h5>' +
                    '<div>' + d + '<span>jours</span></div>' +
                    '<div>' + h + '<span>heures</span></div>' +
                    '<div>' + m + '<span>minutes</span></div>' +
                    '<div>' + s + '<span>seconds</span></div>';
            }
            setInterval('updateTimer()', 1000);
            </script>
            @endif



            @endif

            @endif


            <!-- Inclure la bibliothèque JavaScript de Magnific Popup -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js">
            </script>
            <script>
            $(document).ready(function() {

                $('.vue-pop').on('click', function() {
                    var videoUrl = $(this).data('link');
                    console.log('Video URL ' + videoUrl);

                    $.magnificPopup.open({

                        items: {
                            src: videoUrl,
                            type: 'iframe'
                        },
                        iframe: {
                            markup: '<div class="mfp-iframe-scaler">' +
                                '<div class="mfp-close"></div>' +
                                '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>' +
                                '</div>',
                            patterns: {
                                youtube: {
                                    index: 'youtube.com/',
                                    id: 'v=',
                                    src: '//www.youtube.com/embed/%id%?autoplay=1'
                                },
                                vimeo: {
                                    index: 'vimeo.com/',
                                    id: '/',
                                    src: '//player.vimeo.com/video/%id%?autoplay=1'
                                },
                                gmaps: {
                                    index: '//maps.google.',
                                    src: '%id%&output=embed'
                                }
                            },
                            srcAction: 'iframe_src'
                        }
                    });
                });
            });
            // script pour remplacer les occurences de "é" par "e" dans l'ensemble des textes utilisant la police custom aldo 
            $(document).ready(function() {
                $('body *').contents().each(function() {
                    if (this.nodeType === Node.TEXT_NODE && $(this).closest('*').css('font-family')
                        .includes('aldo_the_apacheregular')) {
                        this.nodeValue = this.nodeValue.replace(/é/g, 'e');
                    }
                });
            });
            </script>
</body>

</html>