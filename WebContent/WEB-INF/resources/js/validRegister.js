$(document).ready(function(){
	
	$(document).on('click', '#submitRegistration', function() { 
	if($('#firstName').val() == "" || $('#firstName').val() == " "){
		
		var errName = $("#firstNameErr");
		   errName.html("First Name cannot be empty");
		   errName.addClass('error-msg'); 
	}
	
	
	});
	
	
	
	
});