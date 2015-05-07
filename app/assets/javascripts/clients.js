$(document).ready(function() {
    $('#reports').dataTable( {
		"order": [[ 2, "desc" ]], 
        "autoWidth": false,
        responsive: true,
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 3, 4 ] } ]
    } );
} );

$(document).ready(function() {
    $('#behaviors').dataTable( {
		"order": [[ 2, "desc" ]],
		"paging": false, 
		"info": false,
        "autoWidth": false,
        responsive: true,
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 3, 4 ] } ]
    } );
} );

$(document).ready(function() {
    $('#clients').dataTable( {
        "autoWidth": false,
        responsive: true,
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 3, 4 ] } ]
    } );
} );
