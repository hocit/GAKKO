        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/js/datetimepicker/jquery.datetimepicker.css" />

        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/js/jquery-ui/smoothness/jquery-ui.custom.css" />
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/jquery-ui.js"></script>

        <script type="text/javascript" src="{{ $site.cms_dir }}/js/datetimepicker/jquery.datetimepicker.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/form.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/modal.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/modal/image.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/modal/image_multi.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
        $( function() {
            $( ".modal_image_multi_cont" ).sortable();

            $(document).on('click', '#gallery-wrap .list-remove', function() {
                $(this).closest('.photo_thumb').remove();
            });

            var config = {
                'toolbar': [
                    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat' ] },
                    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                    { name: 'styles', items: [ 'FontSize' ] },
                    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
                    { name: 'source', items: [ 'Source' ] },
                    { name: 'others', items: [ '-' ] },
                    { name: 'about', items: [ 'About' ] }
                ]
            };
            CKEDITOR.replace( $( 'textarea[name="content"]' ).get(0), config );
        } );
        </script>
