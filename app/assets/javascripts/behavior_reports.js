$("#submit-report").click(function(){
	$(this).addClass("disabled");
	$(this).prop("disabled", true);
	$(this).toggleClass("secondary");
	$(this).val("Please wait...");
});
