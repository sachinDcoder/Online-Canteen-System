<%@page import="com.tcs.allclasses.Food"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tcs.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.boxDiv
		{
			min-height: 700px;
			padding-left: 20px;
			padding-top: 20px;
			color: white;
		}
		table td 
		{
	    	width: 150px;
		}
		td 
		{ 
    		padding: 10px;
		}
		table 
		{ 
		    border-spacing: 100px;
		    border-collapse: separate;
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
    <title>Avaliable Foods</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


</head>
<body >
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Http 1.1
		
		response.setHeader("Pragma","no-cache");  // Http 1.0
		
		response.setHeader("Expires","0");  //Proxies
		
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("login.jsp");
		}
		
	%>
	<div class="row">
	<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
		<p align="center"><img  src="image/OurOnlineCanteen.jpg" width="1380" height="200"/></p>
	</div>
	<div class="col-lg-3 col-sm-3 col-md-3 col-md-xs-3">
		<div class="boxDiv">
			First Div
		</div>
	</div>
	<div style="background-color: forestgreen" class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
		<div style="text-align: right" class="container" class="inline">
			<form action="mealtime.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="back">
			</form>  
			<form action="Logout" style = "display:inline">
				<input type="submit" class="btn btn-link" value="logout">
			</form>
		</div>
		<div class="boxDiv" style="text-align: left">
		<h4>Add Address:</h4>
		<form action="AddAddress">
		<table style="text-align: center">
			<tr><td>Home/Office No.</td><td><input required type="text" name="block" maxlength="50" size="50" placeholder="Enter your place no"/></td></tr>
			<tr><td>Street</td><td><input required type="text" name="street" maxlength="50" size="50" placeholder="Enter your street"/></td></tr>
			<tr><td>City</td><td><input required type="text" name="city" maxlength="50" size="50" placeholder="Enter your city"/></td></tr>
			<tr><td>Pincode</td><td><input required type="text" name="pincode" maxlength="50" size="50" placeholder="Enter your pincode"/></td></tr>
			<tr><td></td><td><input type="submit" required style="background: blue; color: white" value="Add Address" width=\"120\" height=\"30\"/></td></tr>
		</table>
		</form>
		<br>
		<%
			if((Boolean)request.getAttribute("addressinserted?")!=null)
				if((Boolean)request.getAttribute("addressinserted?")==true)
					out.println("<p style=\"color: black; text-align:enter\">Address added successfully</p>");
				else
					out.println("<p style=\"color: red; text-align:enter\">Address entered can't be added</p>");
			
		
		%>
		</div>
	</div>
	<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3">
		<div class="boxDiv">
			<span style="text-align: left; color: black">User ID: ${username}</span>
		</div>
	</div>
	</div>
</body>
</html>