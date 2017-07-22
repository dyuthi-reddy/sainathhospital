<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="Navbar.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Patients</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/viewPatient.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--  <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"> -->
<link
	href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
<link
	href="<c:url value="/resources/css/datatable/jquery.dataTables.css" />"
	rel="stylesheet" type="text/css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<link
	href="${pageContext.request.contextPath}/resources/css/jquery.snippet.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/jquery-ui-blue.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.tabletojson.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.js"></script>

<style>
.dataTableTitle {
	color: #FFFFF;
	font-family: Arial;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 0px;
	width: 97%;
	height: auto;
	margin-left: 16px;
	display: inline-block;
}

.datatableWrapper {
	padding-left: 20px;
	padding-right: 20px;
	padding-top: -35px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #184b92;
	padding-bottom: 16px;
	background-color: white !important;
}

.tableHead { #
	background-color: #3071a9 !important;
	background-color: #3071a9 !important;
	border: 3px solid #1e2366;
	border-radius: 0.6em;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	box-shadow: 0px 0px 30px 0px rgba(0, 0, 0, 0.2);
	-webkit-box-shadow: 0px 0px 30px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 0px 30px 0px rgba(0, 0, 0, 0.2);
	font: 14px serif, Calibri, 'Times New Roman';
}
</style>

</head>
<body>



		<h2 class="dataTableTitle">Registered Patients</h2>
		<div style="padding: 10px"></div>
		<div id="modulePanel">
			<div class="datatableWrapper">
				<table id="PatientTableList" class="display" cellspacing="0"
					width="100%">
					<thead class="tableHead">
						<tr>
							<th>Serial Number</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Adhaar Number</th>
							<th>Address</th>
							<th>Phone</th>
							<!-- <th>Edit</th> -->

						</tr>
					</thead>
					<tbody>
					
					 <c:forEach items="${displayPatient}" var="patients" varStatus="patientStatus">
						<tr id="${patientStatus.count}" class="patientDetails">
							<td class="serialNumber" id=${patients.serialNumber}>${patients.serialNumber}</td>
							<td class="firstName">${patients.firstName}</td>
							<td class="lastName">${patients.lastName}</td>
							<td class="adhaarNumber">${patients.adhaarNumber}</td>
							<td class="address">${patients.address}</td>
							<td class="phone">${patients.phone}</td>
							<!-- <td><span style="padding-right: 10px"><a href="#"
									class="edit_patient_app glyphicon glyphicon-pencil"
									title="EDIT"></a> </span></td> -->
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
<%-- 
	<div id="update_success_dialog"
		style="display: none">
		<div class="dialog-content-wrapper">
			<h4 class="successMessage"></h4>
		</div>
	</div>

	<div id="edit_details_dialog" title="Edit patient">

		<form:form method="POST"
			action="${pageContext.request.contextPath}/update"
			modelAttribute="patient">

			<table>
				<tbody>
					<tr>
					<tr>
						<td><label>Serial Number:</label></td>
						<td class="edit_SerialNumber"></td>
						<td><form:input type="hidden" path="Id" class="edit_Id"
								value="" /></td>
						<td><form:input type="hidden" path="serialNumber"
								class="edit_serialNumber" value="" /></td>
					<tr>
						<td><label>First Name:</label></td>
						<td><form:input class="form-text edit_firstName"
								path="firstName" id="firstName" /></td>
					</tr>

					<tr>
						<td><label>Last Name:</label></td>
						<td><form:input class="form-text edit_lastName"
								path="lastName" id="lastName" /></td>
					</tr>

					<tr>
						<td><label>Adhaar Number:</label></td>
						<td><form:input class="form-text edit_adhaarNumber"
								path="adhaarNumber" id="adhaarNumber" /></td>
					</tr>

					<tr>
						<td><label>Address:</label></td>
						<td><form:input class="form-text edit_address" path="address"
								id="address" /></td>
					</tr>

					<tr>
						<td><label>Phone:</label></td>
						<td><form:input class="form-text edit_phone" path="phone"
								id="phone" /></td>
					</tr>
				</tbody>
			</table>

		</form:form>
 --%>
	</div>
</body>


</html>