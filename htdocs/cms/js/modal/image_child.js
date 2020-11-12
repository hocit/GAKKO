( function( $, w ) {

    $( function() {
        $( '.close' ).click( function() {
            w.parent.Modal_i.hide();
        } );

        $( '.choose' ).click( function() {
            w.parent.Modal_i.set_image( $(this).data( 'id' ), $(this).data( 'url' ) );
        } );
    } );

    $(w).on('load', function() {
        setTimeout(function() {
            var height = $('body').height();
            w.parent.Modal_i.fit(height);
        }, 100);
    });

} )( jQuery, window );