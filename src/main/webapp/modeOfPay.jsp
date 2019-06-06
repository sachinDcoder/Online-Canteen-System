<%@page import="java.util.ArrayList"%>
<%@page import="com.tcs.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script>
		function func()
		{
			if(confirm("Press okay to place order otherwise press cancel?"))
				return true;
			else
				return false;
		}
	
	</script>
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
    <title>Select Payment Mode:</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


</head>
<body >
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //Http 1.1
		
		response.setHeader("Pragma","no-cache");  // Http 1.0
		
		response.setHeader("Expires","0");  //Proxies
		
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
	<div style="background-color: forestgreen" class="col-lg-6 col-sm-6 col-md-6 col-md-xs-6">
		<div style="text-align: right" class="container" class="inline">
		<!-- <button type="button" name="back" class="btn btn-link" onclick="history.back()">back</button> -->
			<form action="foodDetails.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="back">
			</form> 
			<form action="Logout" style = "display:inline">
				<input type="submit" class="btn btn-link" value="logout">
			</form>
		</div>
		<div class="boxDiv" style="text-align: center">
		<h3>Select Payment Mode:</h3><br/>
			<form action="PlaceOrder">
				<%
					if(session.getAttribute("username")==null)
					{
						response.sendRedirect("login.jsp");
					}
					else
					{
						int quantity = Integer.parseInt(request.getParameter("quantity"));
						Double price = Double.parseDouble(session.getAttribute("selectedPrice").toString());
						String priceString = String.format("%.2f", quantity*price);
						session.setAttribute("pricePaid", priceString);
						out.println("<h5>Total Amount to be paid: <em>&#8377 " + priceString +"</em> </h5>");
						LoginDao ld = new LoginDao();
						ArrayList<String> al = ld.getModeOfPayment();
						int c=0;
						out.println("<table align=\"center\">");
						for(String s: al)
						{	
							if(c==0)
								out.println("<tr><td><input type=\"radio\" name=\"pay\" value=\""+s+"\" checked> </td><td Style=\"text-align: left\">"+s+"</td></tr>");
							else
								out.println("<tr><td><input type=\"radio\" name=\"pay\" value=\""+s+"\"> </td><td Style=\"text-align: left\">"+s+" </td></tr>");
							c+=1;
						}
						out.println("</table><br/><input type=\"submit\" onclick=\"return func()\" style=\"background: blue; color: white\" value=\"pay &#8377 "+ priceString +" and confirm order\" width=\"120\" height=\"30\"/>");
					}
				%>
				
			</form>
		</div>
	</div>
	<div class="col-lg-3 col-sm-3 col-md-3 col-md-xs-3">
		<div class="boxDiv">
			<span style="text-align: left; color: black">User ID: ${username}</span>
		</div>
	</div>
	</div>
</body>
</html>