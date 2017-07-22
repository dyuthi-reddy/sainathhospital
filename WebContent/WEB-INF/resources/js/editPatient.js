$(document).ready(function(){
	$("#firstName").prop('disabled', true);
	$("#lastName").prop('disabled', true);
	$("#phone").prop('disabled', true);
	$("#address").prop('disabled', true);
	$("#zipCode").prop('disabled', true);
	$("#adhaarNumber").prop('disabled', true);
	$("#city").prop('disabled', true);
	$("#patientid").prop('disabled', true);
	$("#serialNumber").prop('disabled', true);
	if($("#genderhidden").val() == "Female"){$("#genderfemale").prop("checked", true);}
	if($("#genderhidden").val() == "Male"){$("#gendermale").prop("checked", true);}
	$("#genderfemale").prop('disabled', true);
	$("#gendermale").prop('disabled', true);
	$("#doctor").prop('disabled', false);
	$("#diagnosis").prop('disabled', false);
	$("#doctor").val("");
	$("#diagnosis").val("");
	$("#firstName").val($("#firstNamehidden").val());
	$("#lastName").val($("#lastNamehidden").val());
	$("#phone").val($("#phonehidden").val());
	$("#address").val($("#addresshidden").val());
	$("#zipCode").val($("#zipCodehidden").val());
	$("#adhaarNumber").val($("#adhaarNumberhidden").val());
	$("#city").val($("#cityhidden").val());
	$("#save").prop('disabled', true);
	$("#addvisit").prop('disabled', false);
	$(".Erroroneditvisit").hide();
	$("#edit").prop('disabled', false);
	
	$(document).on('click', '#edit', function() {
		$("#firstName").prop('disabled', false);
		$("#lastName").prop('disabled', false);
		$("#phone").prop('disabled', false);
		$("#address").prop('disabled', false);
		$("#zipCode").prop('disabled', false);
		$("#adhaarNumber").prop('disabled', false);
		$("#city").prop('disabled', false);
		$("#doctor").prop('disabled', false);
		$("#diagnosis").prop('disabled', false);
		$("#genderfemale").prop('disabled', false);
		$("#gendermale").prop('disabled', false);
		$("#diagnosis").val($("#diagnosishidden").val());
		$("#doctor").val($("#doctorhidden").val());
		$("#save").prop('disabled', false);
		$("#addvisit").prop('disabled', true);
	});
	
	$(document).on('click', '#addvisit', function(){
		if($('#doctor').val().trim().length == 0 || $('#diagnosis').val().trim().length == 0){
			
			if($('#doctor').val().trim().length == 0 && $('#diagnosis').val().trim().length == 0){
				$("html, body").animate({ scrollTop: 0 }, "slow");
				$(".Erroroneditvisit").text("Consulting Doctor or Diagnosis cannot be empty.");
				$(".Erroroneditvisit").show();
			}
			else{
		if($('#doctor').val().trim().length == 0){//alert("Consulting Doctor cannot be empty.");
			$("html, body").animate({ scrollTop: 0 }, "slow");
			$(".Erroroneditvisit").text("Consulting Doctor cannot be empty");
			$(".Erroroneditvisit").show();}
		
		else if($('#diagnosis').val().trim().length == 0){//alert("Diagnosis cannot be empty.");
		    $("html, body").animate({ scrollTop: 0 }, "slow");
			$(".Erroroneditvisit").text("Diagnosis cannot be empty.");
			$(".Erroroneditvisit").show();}}
		
		}
		else{
		$.ajax({
	        url: "saveVisit",
	        type: 'GET',
	        data:{
	        	sernum:$('#serialNumber').val(),doc:$('#doctor').val(),
	        	diagnosis:$('#diagnosis').val(),patid:$('#patientid').val()},
	        dataType: 'json', // added data type
	        success: function(mydata) {
	            console.log(mydata);
	            alert("Patient visit added successfully.");
	        	$("#doctor").prop('disabled', true);
	        	$("#diagnosis").prop('disabled', true);
	        	$("#edit").prop('disabled', true);
	        	$("#addvisit").prop('disabled', true);
	        },
	        
	        error: function (textStatus, errorThrown) {
                alert("Error: Please try again!");
            }
	});}
});
	
	$(document).on('click', '#save', function(){
		if($('#firstName').val().trim().length == 0 || $('#lastName').val().trim().length == 0 || $('#phone').val().trim().length == 0 || $('#adhaarNumber').val().trim().length == 0 || $('#city').val().trim().length == 0 || 
				$('#zipCode').val().trim().length == 0 || $('#address').val().trim().length == 0 || $('#doctor').val().trim().length == 0 || $('#diagnosis').val().trim().length == 0){
			$("html, body").animate({ scrollTop: 0 }, "slow");
			$(".Erroroneditvisit").text("No fileds should be empty.");
			$(".Erroroneditvisit").show();
		}
		
		else if($('#firstName').val().trim().length < 4){
			$("html, body").animate({ scrollTop: 0 }, "slow");
			$(".Erroroneditvisit").text("First Name Should be atleast 4 characters.");
			$(".Erroroneditvisit").show();
		}
		else if($('#address').val().trim().length < 8){
			$("html, body").animate({ scrollTop: 0 }, "slow");
			$(".Erroroneditvisit").text("Address Should be atleast 8 characters.");
			$(".Erroroneditvisit").show();
		}
		else if($('#city').val().trim().length < 3){
			$("html, body").animate({ scrollTop: 0 }, "slow");
			$(".Erroroneditvisit").text("City Should be more than 3 characters.");
			$(".Erroroneditvisit").show();
		}
		
		else if($('#zipCode').val().trim().length < 6 || $('#phone').val().trim().length < 10 || $('#adhaarNumber').val().trim().length < 12)
		{$("html, body").animate({ scrollTop: 0 }, "slow");
		$(".Erroroneditvisit").text("Please make sure Phone# is 10 digits, Adhaar# is 12 digits and Pin Code is 6 digits.");
		$(".Erroroneditvisit").show();}
	
		else{
			var genderassign = null;
			if($('#genderfemale').is(':checked')){genderassign = "Female";}
			else{genderassign = "Male";}
		$.ajax({
	        url: "savePatient",
	        type: 'GET',
	        data:{
	        	sernum:$('#serialNumber').val(),patid:$('#patientid').val(),firstName:$('#firstName').val(),
	        	lastName:$('#lastName').val(),phone:$('#phone').val(),adhaarnumber:$('#adhaarNumber').val(),city:$('#city').val(),
	        	zipcode:$('#zipCode').val(),address:$('#address').val(),doctor:$('#doctor').val(),diagnosis:$('#diagnosis').val(),
	        	gender:genderassign},
	        dataType: 'json', // added data type
	        success: function(mydata) {
	            console.log(mydata);
	           alert("Update Successful");
	           window.location = 'search';
	           
	        },
	        error: function (textStatus, errorThrown) {
                alert("Error: Please try again!");
            }
	        	
	});
		}
});
});