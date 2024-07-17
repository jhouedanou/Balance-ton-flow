@extends('front.layouts.app-master')

@section('page_title','Edit recipe')

<style>
    .imgPreview img{
        width: 100px;
    }
    .main-section{
            margin:0 auto;
            padding: 20px;
            margin-top: 100px;
            background-color: #fff;
            box-shadow: 0px 0px 20px #c1c1c1;
        }
        .fileinput-remove,
        .fileinput-upload{
            display: none;
        }
</style>
@section('content')

<div class="recipe">
<div class="container mt-5">

@if(session()->has('message'))
    <div class="alert alert-success">
        {{ session()->get('message') }}
    </div>
@endif
        <h3 class="text-center mb-5">Modifier ma vidéo</h3>
    
      
            @csrf
          
                    
            <div class="custom-file">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-sm-12 col-11 main-section ">
                              <form action="{{route('update-recipe')}}" method="post" enctype="multipart/form-data">
                                @csrf
                            
                                <div class="form-group">
                                
                                     <div class="file-loading">
                                        <input id="file-1" type="file" name="imageFile[]" multiple class="file" required="required" accept="image/*,video/*" autofocus data-overwrite-initial="false" data-min-file-count="1">
                                    </div>
                               
                               
                                <div>
                                    <input type="hidden" name="user_id"  id="user_id" value='{{ $videos->user_id }}'>
                                    <input type="hidden" name="category_id" id="category_id" value='{{ $videos->category_id }}'>
                                    <input type="hidden" name="recipe_id" id="recipe_id" value='{{ $videos->id }}'>
                                </div>
                                    
                           {{--      <div class="sub">
                                        
                                        <div class="col-md-12">
                                            <button class="w-100 btn btn-lg btn-primary" id="clickload">MODIFIER <i class="fa fa-pencil "></i></button>
                                        
                                        </div>
                                    </div> --}}
                                    <div class="clearfix"></div>
                                </div>
                             </form>
                        </div>

                      {{--   <div class="col-lg-4 col-sm-12 col-11">
                            
                            @php 
                            $first = json_decode($videos->images, true)
                            @endphp
                            <div >
                                @if($first)
                                    <video class="kv-preview-data file-preview-video" controls style="max-width: 100%;">
                                    <source src='{{ asset("storage/$first[0]") }}'  >
                                    </video>
                                @endif
                             </div>

                        </div> --}}

                    </div>
                </div>
            </div>
    </div>
</div>
     @php 
    $area = json_decode($videos->images, true); 
    @endphp
@endsection


@section('javascript')


<script type="text/javascript">
 $(document).ready(function(){
    if (document.getElementsByClassName("file-input-ajax-new").length > 0) {
        $('#modif-btn').hide();
    }
  
   

    $('#file-1').on('change', function(event) {
        $('#modif-btn').show();
    }); 

  
    $('#kvFileinputModal .kv-zoom-actions .btn-fullscreen').click(function(){
        /* alert('ok');
        $('#kvFileinputModal').modal('hide'); */
    });
    $('.file-drop-zone-title').html('Cliquez ici ou sur (Parcourir) pour charger vos recettes.');
   
});

$("#file-1").fileinput({
theme: "fa",
maxFileCount: 1,
language: "fr",
allowedFileTypes: ['image', 'video'],
showCancel: true,
showUpload: true,
showClose:true,
browseClass: "btn btn-info",
browseLabel: "Parcourir",
removeClass: "btn btn-danger",
removeLabel: "Effacer",
uploadClass: "btn btn-success",
uploadLabel: "Envoyer",
overwriteInitial: false,
browseOnZoneClick: true,
type: 'POST',
cache: false,
uploadUrl: "{{route('update-recipe')}}",
enctype: 'multipart/form-data',
overwriteInitial: true,
msgSizeTooLarge: "File {name} ({size} KB) exceeds maximum upload size of {maxSize} KB. Please Try again",
msgFilesTooMany: "Number of Files selected for upload ({n}) exceeds maximum allowed limit of {m}",
msgInvalidFileType: 'Invalid type for file "{name}". Only {types} files are supported.',
msgInvalidFileExtension: 'Invalid extension for file {name}. Only "{extensions} files are supported.',
  deleteExtraData: {
    '_token': '{{csrf_token()}}',
  },
  uploadExtraData: function () {
    return {
      _token: $("input[name='_token']").val(),
      user_id: $("input[name='user_id']").val(),
      category_id: $("input[name='category_id']").val(),
      recipe_id: $("input[name='recipe_id']").val(),
      lien_video: $("input[name='lien_video']").val(),
    };
  },
  allowedFileExtensions: ['jpg', 'png', 'gif', 'jpeg', 'webp', 'mp4', 'mov'],
  initialPreview: [
    @php 
    $area = json_decode($videos->images, true); 
    @endphp
    @foreach($area as $i => $v)
    @if (pathinfo($v, PATHINFO_EXTENSION) == "mp4" || pathinfo($v, PATHINFO_EXTENSION) == "mov")
    '{{ asset('storage/'.$v)}}',
    @else
    "{{ asset('storage/'.$v)}}",
    @endif
    @endforeach
  ],
  initialPreviewAsData: true,
  maxFileSize: 100000,
  maxFilesNum: 5,

  initialPreviewConfig: [
    @php 
    $cle = 0;
    $area = json_decode($videos->images, true); 
    @endphp
    @foreach($area as $i => $v)
    @if (pathinfo($v, PATHINFO_EXTENSION) == "mp4" || pathinfo($v, PATHINFO_EXTENSION) == "mov")
    @php 
    $size = filesize("storage/".$v);  
    $cle = $i;
    @endphp
    {
      type: 'video',
      filetype: 'video/mp4',
      size: "{{$size}}",
     // caption: '{{ asset('storage/'.$v)}}',
      url: '{{route('edit-recipe.post',['recipe_id' => $videos->id ,'id' => $i , '_token' => csrf_token()])}}',
      key: '{{$i}}',
      video: true, // Indique que c'est une vidéo
      videoUrl: '{{ asset('storage/'.$v)}}' // Ajoutez l'URL de la vidéo ici
    },
    @else
    @php 
    $size = filesize("storage/".$v);  
    $cle = $i;
    @endphp
    {
      size: "{{$size}}",
      width: "120px",
      url: "{{route('edit-recipe.post',['recipe_id' => $videos->id ,'id' => $i , '_token' => csrf_token()])}}"
    },
    @endif
    @endforeach
  ],
  deleteUrl: "{{ route('edit-recipe.post', ['recipe_id' => $videos->id,'id' => $cle]) }}",
  headers: {
    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('value')
  },
  // Callback pour personnaliser l'affichage des aperçus vidéo
  fileActionSettings: {
    showVideo: function (config, previewId, isDisabled) {
      var html = '<video class="kv-preview-data file-preview-video" controls style="max-width: 100%; max-height: 160px;">' +
        '<source src="' + config.url + '" type="' + config.filetype + '" >' +
        '</video>';
      return html;
    }
  }
}).on('fileuploaded', function(event, previewId, index, fileId) {
        console.log('File Uploaded', 'ID: ' + fileId + ', Thumb ID: ' + previewId);
    }).on('fileuploaderror', function(event, data, msg) {
        console.log('File Upload Error', 'ID: ' + data.fileId + ', Thumb ID: ' + data.previewId);
    }).on('filebatchuploadcomplete', function(event, preview, config, tags, extraData) {
        console.log('File Batch Uploaded', preview, config, tags, extraData);
    }).on('filezoomshow', function(event,params,e) {
       // e.preventDefault();
    // Gérer l'événement de clic sur l'icône de zoom ici
    console.log('File zoom show', params.sourceEvent, params.previewId, params.modal);

    // Récupérer les informations de la vidéo

    var videoUrl = $('#'+params.previewId+' .kv-file-content video source').attr('src');
    console.log('Video URL '+ videoUrl);
    // Afficher la vidéo dans le modal
    // Ouvrir la vidéo dans un popup avec Magnific Popup


  });


</script>
{{-- <script type="text/javascript">
    $(document).ready(function(){
        $('#clickload').click(function(){

            
            var lien_video = $("#lien-video").val();

            var recipe_id = $("#recipe_id").val();
            var user_id  = $("#user_id").val();
            var category_id = $("#category_id").val();

           // alert(lien_video);
   

            if (lien_video != "") {
                $.ajax({
                    type: 'POST',
                    url: "{{ route('update-recipe') }}",
                    dataType: "json",
                    data: {
                        lien_video: lien_video,
                        user_id: user_id,
                        category_id: category_id,
                        recipe_id: recipe_id,
                        _token: '{{ csrf_token() }}'
                    },
                    beforeSend: function() {
                        $("#overlay").fadeIn(300);
                    },
                    success: function(response) {
                        $("#overlay").fadeOut(300);
                        if(response.success) {
                            window.location.reload();
                        } else {
                            $('#message').html('<span style="color:red">Échec de l\'ajout de la vidéo. Veuillez réessayer.</span>');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log(xhr.status);
                        $('#message').html('<span style="color:red">Échec de l\'ajout de la vidéo. Veuillez réessayer.</span>');
                    },
                    complete: function() {
                        $("#overlay").fadeOut(300);
                    }
                });
            } else {
                $('#message').html('<span style="color:red">Ajoutez un lien svp !</span>');
            }
        });
    });
</script> --}}

@stop