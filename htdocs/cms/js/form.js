( function( $ ) {
    /**
     * Date Time Picker
     */
    $( function() {
        if($.datetimepicker) {
            $.datetimepicker.setLocale('ja');
            $('.datepick').datetimepicker( { 'lang': 'ja', 'step': 15 } );
        }
    } );

    /**
     * Temporary Save
     */
    $(function() {
    });
} )( jQuery );