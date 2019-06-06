package com.tcs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.allclasses.CustomerAddress;
import com.tcs.allclasses.Food;
import com.tcs.dao.LoginDao;


public class MealTime extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String meal = request.getParameter("meal");
		Integer add = new Integer(request.getParameter("address"));
		
		//StringTokenizer strTokens =  new StringTokenizer(add," ");
		/*int block_no = Integer.parseInt(strTokens.nextElement().toString());
		String street = strTokens.nextElement().toString();
		String city = strTokens.nextElement().toString();
		int pincode = Integer.parseInt(strTokens.nextElement().toString());*/
			
		//System.out.println(block_no + street + city + pincode);
		
		//CustomerAddress ca = new  CustomerAddress(block_no, street, city, pincode);
		
		HttpSession session = request.getSession();
		HashMap <Integer, CustomerAddress> hm = (HashMap <Integer, CustomerAddress>)session.getAttribute("HashMapAddress");
		CustomerAddress ca = hm.get(add);
		//System.out.println(ca+"MEALTIME.JAVA");
		
		session.setAttribute("delivery_add",ca);
		
		String mealtype = request.getParameter("mealtype");
		int isveg = Integer.parseInt(request.getParameter("isveg"));
		//System.out.println(meal);
		//System.out.println(add);
		//System.out.println(isveg);
		LoginDao al = new LoginDao();
		ArrayList<Food> foods = al.getFoodDetails(meal,isveg,mealtype);
		session.setAttribute("FoodArray", foods);
		request.setAttribute("FoodArray", foods);
		request.getRequestDispatcher("available_foods.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

}
