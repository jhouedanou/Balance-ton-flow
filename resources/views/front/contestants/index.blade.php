@extends('front.layouts.app-master')

@section('page_title','Ajouter une recette')

<style>
    .imgPreview img{
        width: 100px;
    }
    .main-section{
            margin:0 auto;
            padding: 20px;
            background-color: #fff;
           /*  box-shadow: 0px 0px 20px #c1c1c1; */
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

@if(session()->has('error'))
    <div class="alert alert-danger">
        {{ session()->get('error') }}
    </div>
@endif

@if(isset($categorycontest))
        <h3 class="text-center mb-5">Ajouter une vidéo</h3>
            
            
                @csrf
            
                        
                <div class="custom-file">
                    <div class="container">
                       
                    {{--  <div>
                            <blockquote class="tiktok-embed" 
                                cite="https://www.tiktok.com/@mariameetkhalil/video/7344434846384606469" 
                                data-video-id="7344434846384606469" 
                                style="max-width: 340px;min-width: 325px;" > 
                                <section>
                                
                                </section> 
                            </blockquote> 
                            <script async src="https://www.tiktok.com/embed.js"></script>
                            </div>
                        </div> --}}

                    
                            <div class="col-lg-8 col-sm-12 col-11 main-section ">
                                
                                    <div class="form-group">
                                         <div class="file-loading">
                                    <input id="file-1" type="file" name="imageFile[]" multiple="true" class="file" required="required" autofocus data-overwrite-initial="false" data-min-file-count="1">
                                </div>
                                <div>
                                    <input type="hidden" name="user_id" value='{{ $user->id }}'>
                                    <input type="hidden" name="category_id" value='{{ $categorycontest->id }}'>
                            
                                </div>
                                        
                                     </div>
                    
                             </div>
                     </div>

         
            <div id="recipe-data"></div>
        @else
        
                <div class="no-recipe text-center">
                    <p>Ajout indisponible</p>
                </div>

        @endif
    
    </div>
    <div class="clearfix"></div>
</div>

@endsection


@section('javascript')

{{-- 
<script type="text/javascript">
    $(document).ready(function(){
        $('#clickload').click(function(){

            
            var lien_video = $("#lien-video").val();
            var user_id  = $("#user_id").val();
            var category_id = $("#category_id").val();
           // alert(category_id);
   

            if (lien_video != "") {
                $.ajax({
                    type: 'POST',
                    url: "{{ route('add-recipe.store') }}",
                    dataType: "json",
                    data: {
                        lien_video: lien_video,
                        user_id: user_id,
                        category_id: category_id,
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
<script type="text/javascript">

   
$("#file-1").fileinput({
           theme: "fa",
            maxFileCount: 1,
            language: "fr",
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
           // dropZoneTitle: '<div class="upload-area"><i class="far fa-images"></i><p>Browse or Drag and Drop .jpg, .png, .gif</p> <div> <button>Browse File</button> </div></div>',
            initialPreviewAsData: true,
            initialPreviewFileType: 'image', // image is the default and can be overridden in config below
            allowedFileTypes: [],    // allow only images
            type: 'POST',
            cache: false,
            uploadUrl: "{{route('add-recipe.store')}}",
            enctype: 'multipart/form-data',
            overwriteInitial: true,
            msgSizeTooLarge: "File {name} ({size} KB) exceeds maximum upload size of {maxSize} KB. Please Try again",
            msgFilesTooMany: "Number of Files selected for upload ({n}) exceeds maximum allowed limit of {m}",
            msgInvalidFileType: 'Invalid type for file "{name}". Only {types} files are supported.',
            msgInvalidFileExtension: 'Invalid extension for file {name}. Only "{extensions} files are supported.',
            uploadExtraData: function() {
            return { 
                    uploadToken: $("input[name='_token']").val(), // for access control / security 
                    _token: $("input[name='_token']").val(),
                    user_id: $("input[name='user_id']").val(),
                    category_id: $("input[name='category_id']").val(),
                    lien_video: $("input[name='lien_video']").val(),
                };
            },
            enableResumableUpload: true,
            resumableUploadOptions: {
            // uncomment below if you wish to test the file for previous partial uploaded chunks
            // to the server and resume uploads from that point afterwards
            // testUrl: "http://localhost/test-upload.php"
            },
            maxFileSize:10240,
            maxFilesNum: 5,
            allowedFileExtensions: ['mp4','mov','jpg', 'png', 'gif', 'jpeg', 'webp', 'xlsx','xls', 'doc','docx','ppt','pptx','pdf'],

   /*  preferIconicPreview: true, // this will force thumbnails to display icons for following file extensions
    previewFileIconSettings: { // configure your icon file extensions
        'doc': '<i class="fa fa-file-word text-primary"></i>',
        'xls': '<i class="fa fa-file-excel text-success"></i>',
        'ppt': '<i class="fa fa-file-powerpoint text-danger"></i>',
        'pdf': '<i class="fa fa-file-pdf text-danger"></i>',
        'zip': '<i class="fa fa-file-archive text-muted"></i>',
        'htm': '<i class="fa fa-file-code text-info"></i>',
        'txt': '<i class="fa fa-file-alt text-info"></i>',
        'mov': '<i class="fa fa-file-video text-warning"></i>',
        'mp3': '<i class="fa fa-file-audio text-warning"></i>',
        // note for these file types below no extension determination logic 
        // has been configured (the keys itself will be used as extensions)
        'jpg': '<i class="fa fa-file-image text-danger"></i>', 
        'gif': '<i class="fa fa-file-image text-muted"></i>', 
        'png': '<i class="fa fa-file-image text-primary"></i>'    
    },
    previewFileExtSettings: { // configure the logic for determining icon file extensions
        'doc': function(ext) {
            return ext.match(/(doc|docx)$/i);
        },
        'xls': function(ext) {
            return ext.match(/(xls|xlsx)$/i);
        },
        'ppt': function(ext) {
            return ext.match(/(ppt|pptx)$/i);
        },
        'zip': function(ext) {
            return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
        },
        'htm': function(ext) {
            return ext.match(/(htm|html)$/i);
        },
        'txt': function(ext) {
            return ext.match(/(txt|ini|csv|java|php|js|css)$/i);
        },
        'mov': function(ext) {
            return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
        },
        'mp3': function(ext) {
            return ext.match(/(mp3|wav)$/i);
        }
    }, */
            slugCallback: function (filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
            }).on('fileuploaded', function(event, previewId, index, fileId) {
                console.log('File Uploaded', 'ID: ' + fileId + ', Thumb ID: ' + previewId);
            }).on('fileuploaderror', function(event, data, msg) {
                console.log('File Upload Error', 'ID: ' + data.fileId + ', Thumb ID: ' + data.previewId);
            }).on('filebatchuploadcomplete', function(event, preview, config, tags, extraData) {
                console.log('File Batch Uploaded', preview, config, tags, extraData);
            });

   


    </script>

    @stop