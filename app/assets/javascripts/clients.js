$(document).ready(function() {
    $('#reports').dataTable( {
		"order": [[ 2, "desc" ]]
    } );
} );

$(document).ready(function() {
    $('#behaviors').dataTable( {
		"order": [[ 2, "desc" ]],
		"paging": false, 
		"info": false
    } );
} );

$(document).ready(function() {
    $('#clients').dataTable( {
		"paging": false 
    } );
} );