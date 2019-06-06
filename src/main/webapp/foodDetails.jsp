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
			min-height: 800px;
			padding-left: 20px;
			padding-top: 20px;
			color: white;
		}
		table td 
		{
	    	width: 180px;
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
    <title>Selected Food</title>
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
			<a href="available_foods.jsp" >back</a>
			<!-- <button type="button" name="back" class="btn btn-link" onclick="history.back()">back</button> -->
			<!-- <form action="mealtima.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="back">
			</form> --> 
			<form action="Logout" style = "display:inline">
				<input type="submit" class="btn btn-link" value="logout">
			</form>
		</div>
		<div class="boxDiv" style="text-align: left">
		<h4>Selected Food:</h4>
			<%
			if(session.getAttribute("username")==null)
			{
				response.sendRedirect("login.jsp");
			}
			else
			{
				try
				{
					String food_id = request.getParameter("food_id");
					//System.out.println(food_id);
					ArrayList<Food> foods = (ArrayList<Food>)session.getAttribute("food"); 
					Food reqFood=(Food)session.getAttribute("reqfood");
					//System.out.println(foods.size());
					if(session.getAttribute("reqfood")==null)
						for(Food fx : foods)
						{
							if(fx.getFood_id().equals(food_id)==true)
							{
								reqFood=fx;
								break;
							}
						}
					String detail = reqFood.getDetails();
					if(reqFood.getDetails()==null)
						detail="Delicious Mouth Watering " + reqFood.getFood_name();
					
					out.println("<div class=\"col-lg-6 col-sm-6 col-md-6 col-md-xs-6\"><table><tr><td><figure><img src=\""+reqFood.getPath_photo()+
							"\" width=\"650\" height=\"300\"/><figcaption>"+detail+"</figcaption></figure></td></tr></table></div>");
					out.println("<table><tr><td>Food Name : </td><td>"+reqFood.getFood_name()+"</td></tr><tr><td>Food Type : </td><td>"+reqFood.getFood_type()+"</td></tr>");
					out.println("<tr><td>Price per plate : </td><td>&#8377 "+reqFood.getPrice()+"</td></tr>");
					
					session.setAttribute("reqfood",reqFood);
					session.setAttribute("selectedPrice",reqFood.getPrice());
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
					request.getRequestDispatcher("available_foods.jsp").forward(request, response);
				}
			}
			%>
			<tr><form action="modeOfPay.jsp" class="form-inline">
			<td>Quantity :</td> 
			<td><select name="quantity">
				<%
					for(int i=1;i<=10;i++)
						out.println("<option value=\""+i+"\"\">"+i+"</option>");
				%>
			</select></td></tr>
			<tr><td colspan="1"></td><td><input type="image" src="image/next.jpg" alt="submit"  width="120" height="30"/></td></tr>
			</form>
			</tr></table>
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