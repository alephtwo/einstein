$(document).ready(function() {
    $('#users-table').dataTable( {
	"paging": true, 
	"info": true,
	"autoWidth": false,
	responsive: true,
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 4 ] } ]
    } );
} );

$(document).ready(function() {
    $('#per-user-clients').dataTable( {
        "paging": true, 
        "info": true,
        "autoWidth": false,
        responsive: true,
        "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 2 ] } ]
    } );
} );
