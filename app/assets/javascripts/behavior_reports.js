$("#submit-report").click(function(){
	$(this).addClass("disabled");
	$(this).toggleClass("secondary");
	$(this).val("Please wait...");
});