<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
	var check = function()
	{
		  if (document.getElementById('pass').value ==
		    document.getElementById('cpass').value) {
		    document.getElementById('message').style.color = 'black';
		    document.getElementById('message').innerHTML = '&#9745';
		  } else {
		    document.getElementById('message').style.color = '#FF2A00';
		    document.getElementById('message').innerHTML = '&#9747';
		  }
	}
	function validateEmail()
	{
		var x = document.forms["myForm"]["uname"].value;
	    var atpos = x.indexOf("@");
	    var dotpos = x.lastIndexOf(".");
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	    {
	        alert("Not a valid e-mail address");
	        return false;
	    }
	    var p = document.forms["myForm"]["pass"].value,
        errors = [];
	    if (p.length < 8) {
	        errors.push("Your password must be at least 8 characters"); 
	    }
	    if (p.search(/[a-z]/i) < 0) {
	        errors.push("Your password must contain at least one letter.");
	    }
	    if (p.search(/[0-9]/) < 0) {
	        errors.push("Your password must contain at least one digit."); 
	    }
	    if (errors.length > 0) {
	        alert(errors.join("\n"));
	        return false;
	    }
	    
	}	
	</script> 
	<style>
		.boxDiv
		{
			min-height: 800px;
			padding-left: 20px;
			color: white;
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
    <title>Sign Up</title>
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
	<form action="login.jsp" style = "display:inline">
			<p style="text-align: right"><input type="submit" class="btn btn-link" value="back"></p>
	</form>
		<div class="boxDiv" style="text-align: center">
			<form name="myForm" action="SignUp" method="post"  onsubmit="return validateEmail();">
				<fieldset style="align: center">
				<legend>Sign Up</legend>
				<label style="text-align: left">Email<span style="color:red">*</span>:<br />
				<input type="text" name="uname" maxlength="50" size="50" required placeholder="Enter Email ID" />
				<%
					if(request.getAttribute("Error")!=null)
					{
						out.println("<p style=\"color: red\">Already exists</p>");
						//request.setAttribute("Error",null);
					}
				%>
				</label><br /> 
				<label style="text-align: left">Password<span style="color:red">*</span>:<br />
				<input type="password" id="pass" name="pass" maxlength="50" size="50" required placeholder="Enter Password" onkeyup="check();"/></label><br />
				<label style="text-align: left"><span id="message"></span>Confirm Password<span style="color:red">*</span>:<br />
				<input type="password" id="cpass" name="cpass" maxlength="50" size="50" required placeholder="Enter the same password" onkeyup="check();"/></label><br />
				<label style="text-align: left">First Name<span style="color:red">*</span>:<br />
				<input type="text" name="fname" maxlength="50" size="50" required placeholder="Enter First Name"/></label><br />
				<label style="text-align: left">Middle Name:<br />
				<input type="text" name="mname" maxlength="50" size="50" placeholder="Enter Middle Name"/></label><br />
				<label style="text-align: left">Last Name:<br />
				<input type="text" name="lname" maxlength="50" size="50" placeholder="Enter Last Name"/></label><br />
				<label style="text-align: left">Mobile No.<span style="color:red">*</span>:<br />
				<input type="text" name="mob" maxlength="50" size="50" required placeholder="Enter contact number"/></label><br />
				<label style="text-align: left">Home/Office No.<span style="color:red">*</span>:<br />
				<input type="text" name="block" maxlength="50" size="50" required placeholder="Enter your place no"/></label><br />
				<label style="text-align: left">Street<span style="color:red">*</span>:<br />
				<input type="text" name="street" maxlength="50" size="50" required placeholder="Enter your street"/></label><br />
				<label style="text-align: left">City<span style="color:red">*</span>:<br />
				<input type="text" name="city" maxlength="50" size="50" required placeholder="Enter your city"/></label><br />
				<label style="text-align: left">Pincode<span style="color:red">*</span>:<br />
				<input type="text" name="pincode" maxlength="50" size="50" required placeholder="Enter your pincode"/></label><br />
				<label style="text-align: left"><br />
				<input type="image" src="image/register.jpg" alt="submit"  width="150" height="40"/></label>
				</fieldset>
			</form>
			<%
				if(request.getAttribute("Invalid")!=null)
				{
					out.println("<p style=\"color: red\"> >>Please enter in correct format</p>");	
				}
			%>
			<a href="login.jsp">Existing User, Login in?</a>
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