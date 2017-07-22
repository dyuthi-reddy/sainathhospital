<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>

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

    <title>Signin</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
    
  </head>

  <body >

    <div class="container" ng-app>

       <form:form class="form-signin" name ="userLoginForm" action ="${pageContext.request.contextPath}/register" method ="POST" modelAttribute="Employee">
        <h2 class="form-signin-heading">Please sign in</h2>
        <c:if test="${not empty errorMessageLoginJsp}">
             <div class="alert alert-danger" align="center">
            <strong>${errorMessageLoginJsp}</strong>.
        </div>
       </c:if>
        <label for="username" class="sr-only">User Name</label>
        <form:input type="text" path="userName" name="username" ng-model = "username" class="form-control" placeholder = "Username" />
        <!-- <span style="color:red;font-size:18px" ng-show="userLoginForm.username.$touched && userLoginForm.username.$error.required">
        Username is required.
        </span> -->
        
        <label for="Password" class="sr-only">Password</label>
        <form:input type = "password" path="password" name = "password" ng-model = "password" placeholder = "password" class="form-control"/>
        <!-- <span style="color:red;font-size:18px" ng-show="userLoginForm.password.$touched && userLoginForm.password.$error.required">Password is required</span> -->
        <div class="checkbox">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
        </div>
        <div class="col-md-12 text-center">
        <button class="Submit btn btn-primary" type="submit">Sign in</button>
        </div>
        </form:form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
    