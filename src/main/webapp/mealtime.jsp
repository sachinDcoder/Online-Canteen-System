<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tcs.allclasses.CustomerAddress"%>
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
			min-height: 600px;
			color: white;
			text-align: center;
		}
		table td 
		{
	    	width: 140px;
	    	text-align: left;
		}
		
		table 
		{ 
		    border-spacing: 10px;
		    border-collapse: separate;
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
    <title>Meal Time</title>
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
			
		</div>
	</div>
	<div style="background-color: forestgreen" class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
		
		<div style="text-align: right" class="container" class="inline">
		<!-- <button type="button" name="back" class="btn btn-link" onclick="history.back()">back</button> -->
			<form action="addAddress.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="add address">
			</form>
			<form action="login.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="back">
			</form>
			<form action="orderHistory.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="Order History">
			</form> 
			<form action="Logout" style = "display:inline">
				<input type="submit" class="btn btn-link" value="logout">
			</form>
		</div>
		<div class="boxDiv">
			<form action="MealTime">
				<h4>Select Meal:</h4>
				<table align="center">
				<tr><th>Meal</th><th></th><th>Timing</th></tr>
				<tr><td style="width: 90px"><input type="radio" name="meal" value="breakfast" checked> Breakfast</td><td> : </td><td>7:00am-12:00pm</td></tr>
				<tr><td style="width: 90px"><input type="radio" name="meal" value="lunch"> Lunch</td><td> : </td><td>12:00pm-4:00pm</td></tr>
				<tr><td style="width: 90px"><input type="radio" name="meal" value="dinner"> Dinner</td><td> : </td><td>4:00pm-8:00pm</td></tr>
				</table>
				<br/>
				<h4>Select Address:</h4>
				<%
					//session = request.getSession();
					if(session.getAttribute("username")==null)
					{
						response.sendRedirect("login.jsp");
					}
					else
					{
						String uname = session.getAttribute("username").toString();
						LoginDao ld = new LoginDao();
						
						HashMap <Integer, CustomerAddress> hm = ld.getAddress(uname);
						Set< Map.Entry<Integer, CustomerAddress> > st = hm.entrySet(); 
						
						out.print("<table align=\"center\">");
						for (Map.Entry<Integer, CustomerAddress>  me: st )
						{	
							System.out.print(me.getKey()+":");
							System.out.println(me.getValue());
							int i=me.getKey();
							//CustomerAddress ca = new CustomerAddress();
							out.println("<tr><td><input type=\"radio\" name=\"address\" value=\""+me.getKey()+"\" checked> "+me.getValue()+"</tr></td>");

						}
						session.setAttribute("HashMapAddress", hm);
						out.print("</table>");
						/*
						out.print("<table>");
						for(String s: al)
						{
							CustomerAddress ca = new CustomerAddress();
							out.println("<input type=\"radio\" name=\"address\" value=\""+s+"\" checked> "+s+"");
							c+=1;
						}
						out.print("</table>");*/
						
						//ArrayList<String> al = ld.getAddress(uname);

						/*int c=1;
						out.print("<table>");
						for(String s: al)
						{
							out.println("<input type=\"radio\" name=\"address\" value=\""+s+"\" checked> "+s+"");
							c+=1;
						}
						out.print("</table>");*/
					}
				%>
				<br/>
				<h4>Select VEG/NON-VEG:</h4>
				<table align="center">
				<tr><td><input type="radio" name="isveg" value="1" checked> VEG</td>
				<tr><td><input type="radio" name="isveg" value="0"> NON-VEG</td>
				</table>
				<br/>
				<h4>Select Meal Type:</h4>
				<select name="mealtype" >
				<%
					try
					{
						LoginDao ld = new LoginDao();
						ArrayList<String> al = ld.getFoodtype();
						
						System.out.println(al.size());
						int c=1;
						for(String s: al)
						{
							out.println("<option value=\""+s+"\"\">"+s+"</option>");
							c+=1;
						}
					}
					catch(Exception e)
					{
						System.out.println("Error : "+e.getMessage());
					}
				%>
				</select>
				<br/>
				<br/>
				<input type="image" src="image/next.jpg" alt="submit"  width="120" height="30"/></label>
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