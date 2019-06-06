package com.tcs;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.allclasses.CustomerAddress;
import com.tcs.allclasses.Food;
import com.tcs.allclasses.Order;
import com.tcs.dao.LoginDao;

public class PlaceOrder extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String order_id = "CO" + System.currentTimeMillis();
		String customer_id = session.getAttribute("username").toString();
		String food_id = ((Food)session.getAttribute("reqfood")).getFood_id();
		String pay = request.getParameter("pay");
		
		System.out.println(pay);
		CustomerAddress delivery_add = (CustomerAddress)(session.getAttribute("delivery_add"));
		Date date = new Date();
		
		double total_amount = Double.parseDouble(session.getAttribute("pricePaid").toString());
		Order od = new Order(order_id, customer_id, food_id, date, delivery_add, total_amount);
		
		//System.out.println("placeOrder");
		session.setAttribute("order", od);
		
		LoginDao ld = new LoginDao();
		ld.insertOrder(od);
		
		ld.insertPayment(order_id,pay);
		
		request.setAttribute("pay", pay);
		request.getRequestDispatcher("confirmedOrder.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doGet(request, response);
	}

}
