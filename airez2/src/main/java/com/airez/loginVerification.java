package com.airez;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Servlet implementation class loginVerification
 */

@SuppressWarnings("serial")
public class loginVerification extends HttpServlet {
	Checkdao verify = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String email = (String)request.getParameter("email");
		String pass = (String)request.getParameter("pass");
		
		verify = new Checkdao();
		try {
			boolean correct = verify.check(email, pass);
			if(correct == false) {
				request.setAttribute("isCorrect", "1");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}else {
				HttpSession session = request.getSession();
				String name = verify.getUname(email);
				session.setAttribute("email", name);
				response.sendRedirect("home.jsp");
			}
			verify.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.print(e);
		}
		
	}	

}
