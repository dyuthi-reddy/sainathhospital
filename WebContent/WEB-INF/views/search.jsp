<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="Navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/viewPatient.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--  <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"> -->
<link href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/jquery.snippet.css"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/datatable/jquery.dataTables.css" />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/searchPatient.js"></script>

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

.tableHead { 
	#background-color: #3071a9 !important;
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
<div class="container" align="center">
<form:form class="form-inline my-2 my-lg-0" method = "POST" modelAttribute="patient">
     <form:input class="form-control mr-sm-2" type="text" placeholder="Serial Number" path="serialNumber" id="serialNumber"/>
      <form:input class="form-control mr-sm-2" type="text" placeholder="First Name" path="firstName" id="firstName"/>
      <form:input class="form-control mr-sm-2" type="text" placeholder="Last Name" path="lastName" id="lastName"/>
      <form:input class="form-control mr-sm-2" type="text" placeholder="Phone" path="phone" id="phone"/>
       <form:input class="form-control mr-sm-2" type="text" placeholder="Adhaar" path="adhaarNumber" id="adhaar"/>
      <button class="btn btn-outline-success my-2 my-sm-0 bg-primary" type="button" onclick="sendSearchtoController()">Search</button>
</form:form>
</div>   

 <h2 class="dataTableTitle">Search Results</h2> 
		<div style="padding: 10px"></div>
		<div id="modulePanel">
			<div class="datatableWrapper" id="forclick">
				<table id="PatientTableSearchList" class="display" cellspacing="0"
					width="100%">
					<thead class="tableHead">
						<tr>
							<th>Serial Number</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Adhaar Number</th>
							<th>Address</th>
							<th>Phone</th>
							<th>id</th>

						</tr>
					</thead>
					<tbody></tbody>
					</table>
					</div>
					</div>
</body>
</html>