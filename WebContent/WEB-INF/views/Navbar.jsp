<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script
  src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script> -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/navbar.js"></script>
    
    <style>

.tomove{margin-top:-6px;
margin-bottom:10px;}

</style>
</head>
<body>
<!-- navbar-static-top -->
<div><h1 align = "center"><Strong>Sainath Hospital</Strong></h1></div>
<div class="navbar-wrapper">
      
        <nav class="navbar navbar-inverse fixed-top navbar-light">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
              
                <li class="active" style="font-size:18px;"><a href="${pageContext.request.contextPath}/register" >Register</a></li>
                <li style="font-size:18px;"><a href="updates">View Patients</a></li>
                <li style="font-size:18px;"><a href="search">Search</a></li>
              
              </ul>
              <div class="navbar-brand navbar-nav pull-right"><button class="btn tomove" id="logout" onclick="window.location.href='${pageContext.request.contextPath}/'"><span class="glyphicon glyphicon-log-out"></span> Log out</button>
          
        </div>
            </div>
          </div>
        </nav>
      
    </div>
</body>
</html>