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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/onlynumeric.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/validRegister.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
 <style>
 .error-msg{
   background-color: #FF0000;
}</style>
    
  </head>

<body >
<div>
<h1 align = "center"><em>Out Patient Registration</em></h1>
</div>
<div class="container">
<form:form method = "POST" action = "/SainathHospitals/viewop" modelAttribute="patient">

<c:if test="${not empty errorMessageJsp}">
  <div class="alert alert-danger" align="center">
  <strong>${errorMessageJsp}</strong>.
</div>
</c:if>

<div class="form-group row">
      <form:label for="first Name" class="col-sm-2 col-form-label lead" path="firstName"><strong>First Name:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="firstName" path="firstName" placeholder="First Name"/>
        <div class="firstNameErr"><label></label></div>
      </div>
      
</div>

<div class="form-group row">
      <form:label for="Last Name" class="col-sm-2 col-form-label lead" path="lastName"><strong>Last Name:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="lastName" path="lastName" placeholder="Last Name"/>
      </div>
</div>

<div class="form-group row">
<form:label for="gender" class="col-sm-2 col-form-label lead" path="gender"><strong>Gender:</strong></form:label>
<div class="col-sm-10">
      <form:label class="form-check-label" path="gender">
    <form:radiobutton class="form-check-input" name="gender" path="gender" id="gender" value="Female"/> Female
  </form:label>
  
  <form:label class="form-check-label" path="gender">
    <form:radiobutton class="form-check-input" name="gender" path="gender" id="gender" value="Male"/> Male
  </form:label>
  </div>
</div>

<div class="form-group row">
      <form:label for="phone" class="col-sm-2 col-form-label lead" path="phone"><strong>Phone:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control numericOnly" id="phone" path="phone" placeholder="9999999999"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="adhaarNumber" class="col-sm-2 col-form-label lead" path="adhaarNumber"><strong>Adhaar Number:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control numericOnly" id="adhaarNumber" path="adhaarNumber" placeholder="111111111111"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="doctor" class="col-sm-2 col-form-label lead" path="doctor"><strong>Consulting Doctor:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="doctor" path="doctor" placeholder="Doctor's Name"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="address" class="col-sm-2 col-form-label lead" path="address"><strong>Address:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="address" path="address" placeholder="Address"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="city" class="col-sm-2 col-form-label lead" path="city"><strong>city:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="city" path="city" placeholder="City"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="zipCode" class="col-sm-2 col-form-label lead" path="zipCode"><strong>Pin Code:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control numericOnly" id="zipCode" path="zipCode" placeholder="515591"/>
      </div>
</div>

<div class="form-group row">
      <form:label for="diagnosis" class="col-sm-2 col-form-label lead" path="diagnosis"><strong>Diagnosis:</strong></form:label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" id="diagnosis" path="diagnosis" placeholder="Diagnosis"/>
      </div>
</div>

<button class="btn btn-lg btn-primary btn-block" id="submitRegistration" type="submit">Submit</button>
</form:form>
</div>
</body>

</html>