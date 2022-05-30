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
 * Servlet implementation class payment
 */
public class payment extends HttpServlet {

	Checkdao verify = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		LinkedList<String> lt = new LinkedList<String>();
		@SuppressWarnings("unchecked")
		LinkedList<String> sl = (LinkedList<String>) session.getAttribute("ticket");
		String email = (String)session.getAttribute("user");
		String cost = (String)session.getAttribute("cost");
		String number = (String)session.getAttribute("number");
		String date = (String)session.getAttribute("date");
		lt.add(email);
		lt.add(sl.get(1));
		lt.add(cost);
		lt.add(number);
		lt.add(sl.get(2));
		lt.add(sl.get(3));
		lt.add(sl.get(4));
		lt.add(sl.get(5));
		lt.add(date);
		
		//1,2,3,4,5
		try {
			verify = new Checkdao();
			verify.insert(lt);
			request.setAttribute("Ok", "1");
			RequestDispatcher rd = request.getRequestDispatcher("checkIn.jsp");
			verify.close();
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
