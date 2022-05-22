package com.airez;

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
 * Servlet implementation class account
 */
public class account extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Checkdao verify = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		verify = new Checkdao();
		
		try {
			LinkedList<LinkedList<String>> lt = verify.checkin((String)session.getAttribute("user"));
			session.setAttribute("account", lt);
			response.sendRedirect("accountDetail.jsp");
			verify.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
