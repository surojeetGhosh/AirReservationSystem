<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList, java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
	  <title>AirEz</title>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anony mous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <!-- personal stylesheet -->
      <link rel="stylesheet" href="css/homes.css">
      <link rel="icon" href="images/favicon.ico">

      <!-- fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;900&family=Ubuntu&display=swap" rel="stylesheet">
      
      <!-- Font awesome -->
  	  <script src="https://kit.fontawesome.com/8100311596.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate" );
		session = request.getSession();
		if(session.getAttribute("email") == null){
			response.sendRedirect("index.jsp");
		}
	%>
	<!-- Navigation Bar -->
	<section class="navigation">


		<div class="container-fluid">


			<nav class="navbar navbar-expand-sm navbar-light px-4">
			  <a class="navbar-brand text-white" href="#">	<img src="images/favicon.ico" height = "30px" width="30px">AirEz</a>
			  <a href="home.jsp" class="previous rounded-3 ms-auto">&laquo; Go To Home Page</a>
			</nav>
			


			<div class="row">
				 <h1><i class="fa-solid fa-file-invoice"></i>
				 <%
				 	out.println((String)session.getAttribute("email"));
				 %></h1>
		    </div>
		    <div class="row bg-light rounded shadow-lg font-weight-normal flights-info">
		    	<%
		    		session.setAttribute("number", request.getParameter("number"));
		    		@SuppressWarnings("unchecked") LinkedList<LinkedList<String>> rs = (LinkedList<LinkedList<String>>)session.getAttribute("account");
		    		if(rs == null){
		    			out.println("<h1 class='text-dark py-5'><i class='fa-solid fa-square-poll-vertical px-3'></i>No Purchase History</h1>");
		    		}
		    		else{
		    			
		    			for(LinkedList<String> lt : rs) {
		    				
			    			String flightno = lt.get(0);
			    			String cost = lt.get(1);
			    			String number = lt.get(2);
			    			String source =lt.get(3);
			    			String dest = lt.get(4);
			    			String sourceTime = lt.get(5);
			    			String destTime = lt.get(6);
			    			String date = lt.get(7);
			    			out.println("<div class='rounded pt-3 text-dark ticket'>");
			    				
			    				
			    				
		    				String Para = "<i class='fa-solid fa-ticket'></i><p class='py-2'><span class='px-2'>Flight Number :  " +flightno +"</span><span class='px-3'>" + source + "</span><i class='fa-solid fa-arrows-left-right ico'></i><span class='px-3'>" + dest +  "</span><span class='px-3'>Journey date: " + date +  "</span></p>";
		    				Para += "<p class='py-2'><span class='px-2'>" + sourceTime + "</span><i class='fa-solid fa-arrows-left-right ico'></i><span class='px-2'>" + destTime + "</span><span class='px-5'>Paid: <i class='fa-solid fa-indian-rupee-sign px-2 ico'></i>" + cost +  "</span></p>";
		    				Para += "<p class='py-2'><span class='px-2'>Number of Passengers: " + number + "</span></p>";
		    				out.println(Para);
		    				out.println("</div>");
			    		}
		    		}
		    		
		    	%>
		    </div>
		    
		 </div>
	</section>


	<!-- Footer -->
	<footer class="page-footer font-small bg-dark text-white">

	  <div class="footer-copyright text-center py-3">© 2022 Copyright:
	    <span> AirEz</span>
	  </div>
	</footer>





</body>
</html>
