( function( $, w ) {

    $( function() {
        $( '.close' ).click( function() {
            w.parent.Modal_f.hide();
        } );

        $( '.choose' ).click( function() {
            w.parent.Modal_f.set_file( $(this).data( 'id' ), $(this).data( 'url' ) );
        } );
    } );

    $(w).on('load', function() {
        setTimeout(function() {
            var height = $('body').height();
            w.parent.Modal_f.fit(height);
        }, 100);
    });

} )( jQuery, window );