{{ if $page.is_wysiwyg }}
<script type="text/javascript" src="{{ $site.cms_dir }}/js/modal/file_ckeditor.js"></script>
{{ else }}
<script type="text/javascript" src="{{ $site.cms_dir }}/js/modal/file_child.js"></script>
{{ end }}
