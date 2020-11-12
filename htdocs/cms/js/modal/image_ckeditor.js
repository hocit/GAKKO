/**
 * LH Fegg Image Gallery with CKEditor
 *
 * @updated 2017/01
 */
( function( $, w ) {

    $( function() {
        // Close Buttons
        $( '.close' ).click( function() {
            w.close();
            return false;
        } );

        // Only Detail Page
        if($('#detail-wysiwyg').length) {
            var $ratio  = $('#ratio');
            var $width  = $('#width');
            var $height = $('#height');

            // Check Value of Resize/Trim way
            $('#trim').on('change', function() {
                if($(this).val() === 't') {
                    // If setting value is "Trimming"
                    $('.trim-view').show();
                } else {
                    // If setting value is others
                    $('.trim-view').hide();
                }
            });

            // Calculate width -> height with same ratio
            $width.on('keyup', function() {
                if(! $ratio.prop('checked')) {
                    return;
                }

                var ratio = $(this).val()/$(this).attr('data-original');
                if(isNaN(ratio)) {
                    return;
                }
                $height.val(~~($height.attr('data-original')*ratio));
            });

            // Calculate height -> width with same ratio
            $height.on('keyup', function() {
                if(! $ratio.prop('checked')) {
                    return;
                }

                var ratio = $(this).val()/$(this).attr('data-original');
                if(isNaN(ratio)) {
                    return;
                }
                $width.val(~~($width.attr('data-original')*ratio));
            });

            // Click Choose button
            $( '.choose' ).click( function() {
                var url = $(this).data('updir');
                url = url.replace('%d', $(this).data('id'));

                // Make width/height strings
                var width  = ~~$('#width').val();
                var height = ~~$('#height').val();
                var size   = '';
                if(
                    width  !== ~~$('#width').attr('data-original') ||
                    height !== ~~$('#height').attr('data-original')
                ) {
                    size = '-' + width + '_' + height;
                }

                // Get Resize/Trim way string
                var trim = $('#trim').val();
                if(trim === 't') {
                    trim = $('input:checked[name="pos"]').val();
                }

                // Make Image URL
                url = url.replace('%s', trim + size);

                // Send URL Text to CKEditor
                w.opener.CKEDITOR.tools.callFunction( $(this).data('ckeditor-funcnum'), url );

                // Close window
                w.close();
                return false;
            } );
        }

    } );

} )( jQuery, window );