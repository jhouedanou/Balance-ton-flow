$(document).ready(function() {

    var sync1 = $("#sync1");
    var sync2 = $("#sync2");
    var slidesPerPage = 3; //globaly define number of elements per page
    var syncedSecondary = true;

    sync1.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: true,
        autoplay: true, 
        dots: true,
        loop: true,
        responsiveRefreshRate: 200,
        navText: ['<svg width="100%" height="100%" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="100%" height="100%" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'],
    }).on('changed.owl.carousel', syncPosition);

    sync2
        .on('initialized.owl.carousel', function() {
            sync2.find(".owl-item").eq(0).addClass("current");
        })
        .owlCarousel({
            items: slidesPerPage,
            dots: false,
            nav: true,
            smartSpeed: 200,
            slideSpeed: 500,
            slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
            responsiveRefreshRate: 100,
            navText: ['<svg width="100%" height="100%" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="100%" height="100%" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'],
        }).on('changed.owl.carousel', syncPosition2);

    function syncPosition(el) {
        //if you set loop to false, you have to restore this next line
        //var current = el.item.index;

        //if you disable loop you have to comment this block
        var count = el.item.count - 1;
        var current = Math.round(el.item.index - (el.item.count / 2) - .5);

        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }

        //end block

        sync2
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
        var onscreen = sync2.find('.owl-item.active').length - 1;
        var start = sync2.find('.owl-item.active').first().index();
        var end = sync2.find('.owl-item.active').last().index();

        if (current > end) {
            sync2.data('owl.carousel').to(current, 100, true);
        }
        if (current < start) {
            sync2.data('owl.carousel').to(current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            sync1.data('owl.carousel').to(number, 100, true);
        }
    }

    sync2.on("click", ".owl-item", function(e) {
        e.preventDefault();
        var number = $(this).index();
        sync1.data('owl.carousel').to(number, 300, true);
    });



    /** EDITABLE FIELDS */
    var $count = 0;

    var $eb = $('.edit-button');
    var $cb = $('.check-button');
    var $ei = $('.editable-input');

    

    $eb.on('click', function() {
        
        var id =  $(this).data('id');
        var clas =  $(this).data('id');
        var vel = $("."+clas+" input").val();
        $(this).addClass('hide');
        $(this).removeClass('show');
        $("."+clas+" #"+id).addClass('show');
        $count++
      if ($count < 2) {
        $("."+clas+" input").prop('readonly', false).focus();
        $("."+clas+" input").prop('placeholder','');
        $("."+clas+" input").val('');
        
       $("."+clas+" input").addClass('editing');
      } else {
        $("."+clas+" input").prop('readonly', false).focus();
        // $eb.addClass('show');
        $("."+clas+" input").addClass('editing'); 
      }

        $("."+clas+" #"+id).removeClass('hide');
        $("."+clas+" #"+id).show();
      //  alert(vel);


    });


    // valiuder

     $cb.on('click', function(event) {
        
        var clas =  $(this).data('id');
        var valeur = $("."+clas+" input").val();
        $(this).hide();
        
        $("."+clas+" .edit-button").removeClass('hide');/*  */
        $("."+clas+" .edit-button").addClass('show');/*  */
        event.preventDefault(); 
        $count++
        
        console.log(votejury);
       // Debut ajax
            if (valeur) {
                $.ajax({
                    method: 'POST',
                    url: votejury,
                    data: {
                        user_id: $(event.target).data("jury"),
                        recipe_id: $(event.target).data("recipe"),
                        category_id: $(event.target).data("category"),
                        owner_id: $(event.target).data("owner"),
                        note: valeur,
                        _token:_token
                    },
                    beforeSend:function (data){    
                    },
                    success: function(dataResult){
                    if(dataResult.status==200 && dataResult.vote==0){
                        toastr.options = {
                            "closeButton": true,
                            "progressBar" : true,
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
                    }
                    if(dataResult.status==200 && dataResult.vote==1){
                        toastr.options = {
                            "closeButton": true,
                            "progressBar" : true,
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
                        toastr.success("Mise à jour éffectué avec succès");
                    }
                },
                complete : function() {
                }
        
               })
            }else{
                toastr.options = {
                    "closeButton": true,
                    "progressBar" : true,
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
                toastr.error("Veuillez entrer une valeur");
            }

       //fin ajax
        

        $("."+clas+" input").prop('readonly', true).focus();
    });




        /** EDITABLE FIELDS LIEN VIDEO */
        var $count = 0;

        var $eb = $('.edit-video');
        var $cb = $('.check-video');
    
        
    
        $eb.on('click', function() {
            
            var id =  $(this).data('id');
            var clas =  $(this).data('id');
           // var vel = $("."+clas+" input").val();
            $(this).addClass('hide');
            $(this).removeClass('show');
            $("."+clas+" #"+id).addClass('show');
            $count++
          if ($count < 2) {
            $("."+clas+" input").prop('readonly', false).focus();
            $("."+clas+" input").prop('placeholder','');
            $("."+clas+" input").val('');
            
           $("."+clas+" input").addClass('editing');
          } else {
            $("."+clas+" input").prop('readonly', false).focus();
            // $eb.addClass('show');
            $("."+clas+" input").addClass('editing'); 
          }
    
            $("."+clas+" #"+id).removeClass('hide');
            $("."+clas+" #"+id).show();
          //  alert(vel);
    
    
        });
    
    
        // valiuder
    
         $cb.on('click', function(event) {
            
            $(this).hide();
            var clas =  $(this).data('id');
            $("."+clas+" .edit-video").removeClass('hide');/*  */
            $("."+clas+" .edit-video").addClass('show');/*  */
            event.preventDefault(); 
            $count++
            
            console.log(modVideo);
           // Debut ajax
               
                    $.ajax({
                        method: 'POST',
                        url: modVideo,
                        data: {
                            recipe_id: $(event.target).data("recipe"),
                            lien_video: $("input[name='lien_video']").val(),
                            _token:_token
                        },
                        beforeSend:function (data){    
                        },
                        success: function(dataResult){
                        if(dataResult.status==200 && dataResult.vote==0){
                            toastr.options = {
                                "closeButton": true,
                                "progressBar" : true,
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
                        }
                        if(dataResult.status==200 && dataResult.vote==1){
                            toastr.options = {
                                "closeButton": true,
                                "progressBar" : true,
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
                            toastr.success("Mise à jour éffectué avec succès");
                        }
                    },
                    complete : function() {
                    }
            
                   })
                
           //fin ajax
            
    
            $("."+clas+" input").prop('readonly', true).focus();
        });
    
        /** nFIN EDITABLE FIELDS LIEN VIDEO */

    
});