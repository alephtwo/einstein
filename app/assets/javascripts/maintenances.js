$(document).ready(function() {
    $('#maintenances').dataTable( {
        "autoWidth": false,
        responsive: true,
		"order": [[ 5, "desc" ]]
    } );
} );

$(document).ready(function() {
    $('#userdeletes').dataTable( {
		"order": [[ 2, "desc" ]],
        "autoWidth": false,
        responsive: true
    } );
} );