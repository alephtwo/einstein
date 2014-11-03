$(document).ready(function() {
    $('#users-table').dataTable( {
		"order": [[ 4, "desc" ]],
		"paging": true, 
		"info": true
    } );
} );