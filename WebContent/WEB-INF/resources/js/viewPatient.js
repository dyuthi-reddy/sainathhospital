
$(document).ready(function(){
	
	$("#PatientTableList").dataTable({			
	       "bServerSide": false,			        
	       "bJQueryUI": false,
	       "bFilter": true,
	       "bPaginate": true,
	       "bLengthChange": false,
	      "iDisplayLength": 12,
	       "table-layout": "fixed",
	      /* "aoColumns": [{"sWidth": "10%"},{"sWidth": "25%"},{"sWidth": "25%"},{"sWidth": "25%"},{"sWidth": "25%"},{"sWidth": "25%"}],
	    */   "aaSorting": [ [0,'asc']]
		   
	});
	
	$("#PatientTableSearchList").dataTable({			
	       "bServerSide": false,			        
	       "bJQueryUI": false,
	       "bFilter": true,
	       "bPaginate": true,
	       "bLengthChange": false,
	      "iDisplayLength": 12,
	       "table-layout": "fixed",
	       /* "aoColumns": [{"sWidth": "10%"},{"sWidth": "25%"},{"sWidth": "25%"},{"sWidth": "25%"},{"sWidth": "25%"},{"sWidth": "25%"}],
	         */
	       "aaSorting": [ [0,'asc']]
	    
		   
	});

	
	
$( "#PatientTableList").on( "click","a.edit_patient_app",showEditApplicationDialog);

function showEditApplicationDialog() {
     
      event.preventDefault();
                 
      var tr_patientdetail = $(this).closest("tr.patientDetails");
     
      var serialNumber = tr_patientdetail.find("td.serialNumber").attr("id");
     
   var firstName = tr_patientdetail.find("td.firstName").html();
   var lastName = tr_patientdetail.find("td.lastName").html();
   var adhaar = tr_patientdetail.find("td.adhaarNumber").html();
   var address = tr_patientdetail.find("td.address").html();
   var phone = tr_patientdetail.find("td.phone").html();
   
    
   edit_details_dialog.find("td.edit_SerialNumber").html("<label>"+SerialNumber+"</label>");
   edit_details_dialog.find("input.edit_serialNumber").val(serialNumber);
   edit_details_dialog.find("input.edit_firstName").val(firstName);
   edit_details_dialog.find("input.edit_lastName").val(lastName);
  edit_details_dialog.find("input.edit_adhaarNumber").val(adhaar); 
   edit_details_dialog.find("input.edit_address").val(address);
   edit_details_dialog.find("input.edit_phone").val(phone);
    
                 
      edit_details_dialog.dialog("open");
}

}); 
