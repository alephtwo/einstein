$(document).ready(function() {
    $('#reports').dataTable( {
		"order": [[ 2, "desc" ]], 
        "autoWidth": false,
        responsive: true
    } );
} );

$(document).ready(function() {
    $('#behaviors').dataTable( {
		"order": [[ 2, "desc" ]],
		"paging": false, 
		"info": false,
        "autoWidth": false,
        responsive: true
    } );
} );

$(document).ready(function() {
    $('#clients').dataTable( {
        "autoWidth": false,
        responsive: true
    } );
} );