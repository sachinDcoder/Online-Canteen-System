package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.dao.LoginDao;

public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String uname = request.getParameter("uname");
			String pass = request.getParameter("pass");
			String fname = request.getParameter("fname");
			String mname = request.getParameter("mname");
			String lname = request.getParameter("lname");
			String Modile = request.getParameter("mob");
			int block = Integer.parseInt(request.getParameter("block"));
			String Street = request.getParameter("street");
			String City = request.getParameter("city");
			int pincode = Integer.parseInt(request.getParameter("pincode"));
			LoginDao ld = new LoginDao();
			int flag=ld.insert(uname, pass, fname, mname, lname, Modile, block, Street, City, pincode);
			if(flag==0)
			{
				request.setAttribute("Error", "Error");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			else if(flag==1)
			{
				request.setAttribute("Invalid", "Invalid");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				response.sendRedirect("mealtime.jsp");
			}
		}
		catch(Exception e)
		{
			request.setAttribute("Invalid", "Invalid");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
	}

}
