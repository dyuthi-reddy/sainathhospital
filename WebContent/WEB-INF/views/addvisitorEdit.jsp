<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="Navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Out Patient Registration</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/editPatient.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/onlynumeric.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
<style>
.editToRight{
float: right;
margin-top: -50px;
margin-right: 193px;
}


</style>
<body >
<div>
<h1 align = "center"><em>Out Patient Registration</em></h1>

<button class="btn btn-md btn-primary editToRight" type="button" id="edit">Edit</button>
</div>


<div class="container">

<div class="alert alert-danger Erroroneditvisit" align="center">
  
</div>
<form:form method = "POST"  modelAttribute="patient">
<c:forEach items="${patientVisitorEdit}" var="patientvisit">
<div class="form-group row">
      <form:label for="patientid" class="col-sm-2 col-form-label lead" path="id"><strong>Visit Id:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="patientid" path="id" value="${patientvisit.id}"/> 
      </div>
</div>

<div class="form-group row">
      <form:label for="serialNumber" class="col-sm-2 col-form-label lead" path="serialNumber"><strong>serialNumber:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="serialNumber" path="serialNumber" value="${patientvisit.serialNumber}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="first Name" class="col-sm-2 col-form-label lead" path="firstName"><strong>First Name:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="firstName" path="firstName" placeholder="First Name" value="${patientvisit.firstName}"/>
        <input type="hidden" class="form-control" id="firstNamehidden" value="${patientvisit.firstName}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="Last Name" class="col-sm-2 col-form-label lead" path="lastName"><strong>Last Name:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="lastName" path="lastName" placeholder="Last Name" value="${patientvisit.lastName}"/>
        <input type="hidden" class="form-control" id="lastNamehidden" value="${patientvisit.lastName}"/>
      </div>
</div>

<div class="form-group row">
<form:label for="gender" class="col-sm-2 col-form-label lead" path="gender"><strong>Gender:</strong></form:label>
<div class="col-sm-10">
<input type="hidden" class="form-control" id="genderhidden" value="${patientvisit.gender}"/>
</div>
<div class="col-sm-10">
      <form:label class="form-check-label" path="gender">
    <form:radiobutton class="form-check-input" name="gender" path="gender" id="genderfemale" value="Female" /> Female
  </form:label>
  
  <form:label class="form-check-label" path="gender">
    <form:radiobutton class="form-check-input" name="gender" path="gender" id="gendermale" value="Male"/> Male
  </form:label>
  </div>
</div>

<div class="form-group row">
      <form:label for="phone" class="col-sm-2 col-form-label lead" path="phone"><strong>Phone:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control numericOnly" id="phone" path="phone" placeholder="9999999999" value="${patientvisit.phone}"/>
        <input type="hidden" class="form-control numericOnly" id="phonehidden" value="${patientvisit.phone}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="adhaarNumber" class="col-sm-2 col-form-label lead" path="adhaarNumber"><strong>Adhaar Number:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control numericOnly" id="adhaarNumber" path="adhaarNumber" placeholder="111111111111" value="${patientvisit.adhaarNumber}"/>
      <input type="hidden" class="form-control numericOnly" id="adhaarNumberhidden" value="${patientvisit.adhaarNumber}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="doctor" class="col-sm-2 col-form-label lead" path="doctor"><strong>Consulting Doctor:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="doctor" path="doctor" placeholder="Doctor's Name"/>
         <input type="hidden" class="form-control" id="doctorhidden" value="${patientvisit.doctor}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="address" class="col-sm-2 col-form-label lead" path="address"><strong>Address:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="address" path="address" placeholder="Address" value="${patientvisit.address}"/>
        <input type="hidden" class="form-control" id="addresshidden" value="${patientvisit.address}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="city" class="col-sm-2 col-form-label lead" path="city"><strong>city:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="city" path="city" placeholder="City" value="${patientvisit.city}"/>
        <input type="hidden" class="form-control" id="cityhidden" value="${patientvisit.city}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="zipCode" class="col-sm-2 col-form-label lead" path="zipCode"><strong>Pin Code:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control numericOnly" id="zipCode" path="zipCode" placeholder="515591" value="${patientvisit.zipCode}"/>
         <input type="hidden" class="form-control numericOnly" id="zipCodehidden" value="${patientvisit.zipCode}"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="diagnosis" class="col-sm-2 col-form-label lead" path="diagnosis"><strong>Diagnosis:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="diagnosis" path="diagnosis" placeholder="Diagnosis"/>
        <form:input type="hidden" id="diagnosishidden" path="diagnosis" value="${patientvisit.diagnosis}"/>
      </div>
</div>
</c:forEach>

<div class="form-group" align="center">

<button class="btn btn-lg btn-primary" type="button" id="addvisit">Add a Visit</button>
<span>
<button class="btn btn-lg btn-primary" type="button" id="save">Save</button>
</span>
</div>
</form:form>
</div>
</body>

</html>