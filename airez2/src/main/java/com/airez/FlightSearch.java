package com.airez;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class FlightSearch
 */
@SuppressWarnings("serial")
public class FlightSearch extends HttpServlet {
	
    Checkdao verify = null;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String origin = ((String)request.getParameter("origin")).toLowerCase();
		String dest = ((String)request.getParameter("dest")).toLowerCase();
		String travelDate = (String)request.getParameter("Travel");
		
		int inputDate = Integer.parseInt(travelDate.split("-")[2]);
		int inputMonth = Integer.parseInt(travelDate.split("-")[1]);
		int inputYear = Integer.parseInt(travelDate.split("-")[0]);
		
		int currentDate = Integer.parseInt((LocalDate.now().toString()).split("-")[2]);
		int currentMonth = Integer.parseInt((LocalDate.now().toString()).split("-")[1]);
		int currentYear = Integer.parseInt((LocalDate.now().toString()).split("-")[0]);
		
		
		verify = new Checkdao();
		HttpSession session = request.getSession();
		session.removeAttribute("isDestEqual");
		session.removeAttribute("isDateNot");
		
		if(session.getAttribute("email") == null){
			response.sendRedirect("index.jsp");
		}
		else if(origin.equals(dest)) {
			session.setAttribute("isDestEqual", "1");
			response.sendRedirect("home.jsp");
		}
		else {
			LinkedList<LinkedList<String>> rs;
			try {
				rs = verify.flights(origin, dest);
				session.setAttribute("isAccess", "1");
				session.setAttribute("data", rs);
				session.setAttribute("date", travelDate);
				RequestDispatcher rd = request.getRequestDispatcher("searchFlights.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
			
		}
		try {
			verify.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
