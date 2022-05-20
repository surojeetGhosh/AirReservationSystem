package com.airez;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Register
 */
@SuppressWarnings("serial")
public class Register extends HttpServlet {
	
	
	Checkdao verify = null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String fname = (String)request.getParameter("fname");
		String lname = (String)request.getParameter("lname");
		String email = (String)request.getParameter("email");
		String pass = (String)request.getParameter("pass");
		verify = new Checkdao();
		try {
			boolean insert = verify.insert(fname, lname, email, pass);
			if(insert == false) {
				request.setAttribute("isCorrect", "1");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("isCorrect", "0");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			verify.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.print(e);
		}
	}	
}


