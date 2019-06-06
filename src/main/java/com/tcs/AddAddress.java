package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.allclasses.CustomerAddress;
import com.tcs.dao.LoginDao;

public class AddAddress extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int block = Integer.parseInt(request.getParameter("block"));
		String Street = request.getParameter("street");
		String City = request.getParameter("city");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		HttpSession session = request.getSession();
		String user = session.getAttribute("username").toString();
		LoginDao ld = new LoginDao();
		
		CustomerAddress ca = new CustomerAddress(block,Street,City,pincode);
		if(ld.insertAddress(ca, user)==false)
		{
			request.setAttribute("addressinserted?", false);
			request.getRequestDispatcher("addAddress.jsp").forward(request, response);		
		}
		else
		{
			request.setAttribute("addressinserted?", true);
			request.getRequestDispatcher("addAddress.jsp").forward(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

}
