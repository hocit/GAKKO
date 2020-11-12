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

        // Click Choose button
        $( '.choose' ).click( function() {
            var url = $(this).data('url');

            // Send URL Text to CKEditor
            w.opener.CKEDITOR.tools.callFunction( $(this).data('ckeditor-funcnum'), url );

            // Close window
            w.close();
            return false;
        } );

    } );

} )( jQuery, window );