<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList, java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate" );
		session = request.getSession();
		if(session.getAttribute("email") != null){
			response.sendRedirect("home.jsp");
			
		}
		else{
			response.sendRedirect("index.jsp");
		}
	%>






</body>
</html>
