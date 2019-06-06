<%@page import="com.tcs.allclasses.CustomerAddress"%>
<%@page import="com.tcs.allclasses.Food"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tcs.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%--  <%@ taglib prefix="sql" uri=""http://java.sun.com/jsp/jstl/sql" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <title>Order History</title>
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
		//String username = session.getAttribute("username").toString();
	%>
	<div class="row">
	<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
		<p align="center"><img  src="image/OurOnlineCanteen.jpg" width="1380" height="200"/></p>
	</div>
	<div class="col-lg-2 col-sm-2 col-md-2 col-xs-2">
		<div class="boxDiv">
			First Div
		</div>
	</div>
	<div style="background-color: forestgreen" class="col-lg-8 col-sm-8 col-md-8 col-8">
		<div style="text-align: right" class="container" class="inline">
			<form action="mealtime.jsp" style = "display:inline">
				<input type="submit" class="btn btn-link" value="back">
			</form>  
			<form action="Logout" style = "display:inline">
				<input type="submit" class="btn btn-link" value="logout">
			</form>
		</div>
		<div class="boxDiv" style="text-align: left">
		<h4>Past Orders:</h4>
			<sql:setDataSource var="db" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="System" password="9939"></sql:setDataSource>
			
			<sql:query var="rs" dataSource="${db}" >select * from food_order where cid='${username}'</sql:query>
			
			<table align="center" >
			<tr><th>OrderID</th><th>Food Name</th><th>Price Per Item</th><th>Quantity</th><th>Total Amount</th><th>Delivery Address</th></tr>
			<c:forEach items="${rs.rows}" var="order">
				<tr>
				<td><c:out value="${order.order_id}"></c:out></td>
				<sql:query var="rs1" dataSource="${db}" >select * from food where food_id='${order.food_id}'</sql:query>
					<c:forEach items="${rs1.rows}" var="food">
						<td><figure><img src="${food.path_photo}" width="90" height="90"><figurecaption><c:out value="${food.food_name}"></c:out></figurecaption></figure></td><td> &#8377 <c:out value="${food.price}"></c:out></td>
						<td><fmt:parseNumber var = "i" integerOnly = "true" type = "number" value = "${order.total_amount/food.price}" /><c:out value="${i}"></c:out></td>
					</c:forEach>
					<td>${order.total_amount}</td>
					<td>${order.block_no}, ${order.street}, ${order.city}, ${order.pincode}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-lg-2 col-sm-2 col-md-2 col-xs-2">
		<div class="boxDiv">
			<span style="text-align: left; color: black">User ID: ${username}</span>
		</div>
	</div>
	</div>
</body>
</html>