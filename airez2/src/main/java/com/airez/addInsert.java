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
 * Servlet implementation class addInsert
 */
public class addInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Checkdao verify = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		verify = new Checkdao();
		HttpSession session = request.getSession();
		String fname = request.getParameter("fname");
		String flightno = request.getParameter("flightno");
		String source = request.getParameter("source");
		String dest = request.getParameter("dest");
		String sourceTime = request.getParameter("sourceTime");
		String destTime = request.getParameter("destTime");
		String cost = request.getParameter("cost");
		LinkedList<String> data = new LinkedList<String>();
		data.add(fname);
		data.add(flightno);
		data.add(source);
		data.add(dest);
		data.add(sourceTime);
		data.add(destTime);
		data.add(cost);
		System.out.println("hello");
		try {
			verify.insertFlight(data);
			LinkedList<LinkedList<String>> lt = verify.flightsAll();
			session.setAttribute("account", lt);
			response.sendRedirect("adminHome.jsp");
			verify.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
