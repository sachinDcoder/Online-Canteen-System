package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.dao.LoginDao;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		LoginDao ld = new LoginDao();
		
		//System.out.println(uname);
		HttpSession session = request.getSession();
		if(ld.check(uname, pass))
		{	
			//System.out.println("if");
			session.setAttribute("username", uname);
			response.sendRedirect("mealtime.jsp");
		}
		else
		{
			//System.out.println("else");
			session.setAttribute("username", "Invalid");
			response.sendRedirect("login.jsp");
		}
	}

}
