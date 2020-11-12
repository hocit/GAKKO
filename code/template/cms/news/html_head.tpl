        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/js/datetimepicker/jquery.datetimepicker.css" />

        <script type="text/javascript" src="{{ $site.cms_dir }}/js/datetimepicker/jquery.datetimepicker.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/form.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/modal.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/modal/image.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/modal/file.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
        $( function() {
            CKEDITOR.replace($( 'textarea[name="content"]' ).get(0));
        } );
        </script>
