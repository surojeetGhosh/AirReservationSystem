package com.airez;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 * Servlet implementation class adminSupport
 */
public class adminSupport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Checkdao verify = null;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		verify = new Checkdao();
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		
		
		if(pass.equals("admin") && name.equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			try {
				LinkedList<LinkedList<String>> lt = verify.flightsAll();
				session.setAttribute("account", lt);
				response.sendRedirect("adminHome.jsp");
				verify.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else {
			request.setAttribute("isCorrect", "1");
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
			System.out.print("out");
		}
	}

}
