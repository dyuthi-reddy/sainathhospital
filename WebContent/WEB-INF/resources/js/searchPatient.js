var globalurlparam = null;

$( document ).ready(function() {
	$(document).on('click', '#PatientTableSearchList tr', function() { 
		
		var currentrow = $(this).closest("tr");
		var currenttd = currentrow.find("td");
	 $.each(currenttd, function() {                // Visits every single <td> element
		    var id = $(this).text();
		    var tdIndex = $(this).index()+1;
		   
		    var thverify = $('#PatientTableSearchList tr').find('th:nth-child(' + tdIndex + ')');
		    if(thverify.text() == "id"){
		    	globalurlparam = id;
		    	window.location = 'backfromsearch?someAttr='+globalurlparam;
		    }
		});
	
	});
});


function sendSearchtoController(){
	
	if($('#serialNumber').val() == 0 && $('#firstName').val() == "" && $('#lastName').val() == "" && $('#phone').val() == 0 && $('#adhaar').val() == 0){
		alert("Atleast one of the search criterias should be provided");
	}
	else{
		var table = $('#PatientTableSearchList').DataTable();
		 table.clear().draw();
	$.ajax({
        url: "getSearchResults",
        type: 'GET',
        data:{
        	sernum:$('#serialNumber').val(),firstname:$('#firstName').val(),
        	lastname:$('#lastName').val(),phone:$('#phone').val(),adhaar:$('#adhaar').val()},
        dataType: 'json', // added data type
        success: function(mydata) {
            $.each(mydata, function (index, value) {
            	
            	var TableRow = "<tr>";
                $.each(value, function (key, val) {
                	if(key == "serialNumber" || key == "firstName" || key == "lastName" || key == "adhaarNumber" || key == "address"|| key == "phone" || key == "id")
                    TableRow += "<td>" + val + "</td>";
                });

                TableRow += "</tr>";
                table.row.add($(TableRow)).draw(false);
            });
        }
	});
	}	
	}