$(document).ready(function(){
	$(".numericOnly").keydown(function (e) {
	    /*if (String.fromCharCode(e.keyCode).match(/[^0-9]/g)) return false;*/
		if (e.shiftKey || e.keyCode > 57 || e.keyCode == 32 || e.keyCode == 9) {
	        e.preventDefault();
	    }
	});
	
	
});