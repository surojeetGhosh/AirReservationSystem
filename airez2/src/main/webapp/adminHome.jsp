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
		if(session.getAttribute("name") == null){
			response.sendRedirect("admin.jsp");
			System.out.println("out");
		}
	%>
	<!-- Navigation Bar -->
	<section class="navigation">


		<div class="container-fluid">


			<nav class="navbar navbar-expand-sm navbar-light px-4">
			  <a class="navbar-brand text-white" href="#">	<img src="images/favicon.ico" height = "30px" width="30px">AirEz</a>
			  <a href="home.jsp" class="previous rounded-3 ms-auto">&laquo; Logout</a>
			</nav>
			


			<div class="row">
				 <h1><i class="fa-solid fa-file-invoice"></i>
				 <%
				 	out.println("Flight Results");
				 %></h1>
		    </div>
		    <div class="row bg-light rounded shadow-lg font-weight-normal flights-info ">
		    	<table class="table table-dark table-striped">
		    		<thead>
		    			<th>
		    				Flight
		    			</th>
		    			<th>
		    				Flight number
		    			</th>
		    			<th>
		    				Source
		    			</th>
		    			<th>
		    				Destination
		    			</th>
		    			<th>
		    				Source Time
		    			</th>
		    			<th>
		    				Destination Time
		    			</th>
		    			<th>
		    				Cost
		    			</th>
		    		
		    		</thead>
					<%
			    		@SuppressWarnings("unchecked") LinkedList<LinkedList<String>> rs = (LinkedList<LinkedList<String>>)session.getAttribute("account");
			    		if(rs == null){
			    			out.println("<h1 class='text-dark py-5'><i class='fa-solid fa-square-poll-vertical px-3'></i>No Flights Yet</h1>");
			    		}
			    		else{
			    			
			    			for(LinkedList<String> lt : rs) {
			    				
				    			String fname = lt.get(0);
				    			String flightno = lt.get(1);
				    			String source = lt.get(2);
				    			String dest =lt.get(3);
				    			String sourceTime = lt.get(4);
				    			String destTime = lt.get(5);
				    			String cost = lt.get(6);
				    			String Para = "<tr><td>" + fname + "</td><td>" + flightno + "</td><td>" + source + "</td><td>" ;
				    			Para += dest + "</td><td>" + sourceTime + "</td><td>" + destTime + "</td><td>" + cost + "</td></tr>";
				    			out.println(Para);
				    			
				    		}
			    		}
					%>
				</table>
				<a href="adminadd.jsp" class="btn btn-dark btn-lg">Add Flight</a>
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
