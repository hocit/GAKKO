( function( $, w ) {

    $( function() {
        $( '.close' ).click( function() {
            w.parent.Modal_mi.hide();
        } );

        $( '.choose' ).click( function() {
            if(! window.parent.Modal_mi.check_size(1)){
                window.alert( window.parent.Modal_mi.check_size_error() );
                return;
            }

            var json = {
                error: 0,
                index: 0,
                image_id: $(this).data( 'id' ),
                image_url: $(this).data( 'url' )
            };
            w.parent.Modal_mi.add_template(0);
            w.parent.Modal_mi.set_image(json);
        } );
    } );

    $(function() {
        // アップロードボタン
        var $up_btn = $('#file_upload_input');

        // ボタンでファイル追加
        function insert_up_btn() {
            insert_upload_files( this.files );
        }

        $(document).on( 'click', '.file_upload', function() {
            $up_btn
                .prop( 'multiple', true )
                .unbind( 'change.design_check' )
                .bind( 'change.design_check', insert_up_btn )
                .trigger( 'click' );
            return false;
        } );

        // アップロード処理
        function insert_upload_files( files ) {
            // アップロードするファイルある？
            var is_upload = false;

            if(! window.parent.Modal_mi.check_size(files.length)){
                window.alert( window.parent.Modal_mi.check_size_error() );
                return;
            }

            // オブジェクトにファイルを追加
            for( var i=0, l=files.length; i<l; i++ ) {
                if(! files[i].type.match( /^image\// ) ) {
                    continue;
                }

                // FormDataオブジェクトを生成
                var fd = new FormData();
                fd.append( 'image', files[i] );
                // 追加するDOM要素
                window.parent.Modal_mi.add_template(i);
                is_upload = true;

                upload_handler( fd, i );
            }

            // アップロードするファイルある？
            if(! is_upload ) {
                window.alert( 'アップロード可能なファイルが選択されていません' );
                return;
            }
        }

        // アップロード
        function upload_handler( fd, index ) {
            window.parent.Modal_mi.hide();

            $.ajax( {
                'url':         '/cms/multi/update/'+index,
                'type':        'post',
                'data':        fd,
                'dataType':    'json',
                'processData': false,
                'contentType': false,
                'success':     function( json ) {
                    window.parent.Modal_mi.set_image(json);
                }
            } );
        }
    });

    $(w).on('load', function() {
        setTimeout(function() {
            var height = $('body').height();
            w.parent.Modal_mi.fit(height);
        }, 100);
    });

} )( jQuery, window );