<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.boxDiv
		{
			min-height: 400px;
			padding-left: 20px;
			padding-top: 20px;
			color: white;
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
    <title>Login</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


</head>
<body >
	<div class="row">
	<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
		<p align="center"><img  src="image/OurOnlineCanteen.jpg" width="1380" height="200"/></p>
	</div>
	<div class="col-lg-3 col-sm-3 col-md-3 col-md-xs-3">
		<div class="boxDiv">
			First Div
		</div>
	</div>
	<div style="background-color: forestgreen" class="col-lg-6 col-sm-6 col-md-6 col-md-xs-6">
		<div class="boxDiv" style="text-align: center">
			<form action="Login" method="post">
				<fieldset style="align: center">
				<legend>Login</legend>
				<label style="text-align: left">Email/Username:<br />
				<input type="text" name="uname" maxlength="50" size="50" required placeholder="Enter Email ID"/></label><br />
				<label style="text-align: left">Password:<br />
				<input type="password" name="pass" maxlength="50" size="50" required placeholder="Enter Password"/></label><br />
				<label style="text-align: left"><br />
				<input type="image" src="image/login.jpg" alt="submit"  width="150" height="40"/></label>
				</fieldset>
			</form>
			<%
				if(session.getAttribute("username")!=null && session.getAttribute("username").toString().equals("Invalid"))
				{
					out.println("<p style=\"color: red\"> >>Invalid User, please sign up below..</p>");
				}
			%>
			<a href="signup.jsp">New User Sign up?</a>
		</div>
	</div>
	<div class="col-lg-3 col-sm-3 col-md-3 col-md-xs-3">
		<div class="boxDiv">
			Third Div
		</div>
	</div>
	</div>
</body>
</html>