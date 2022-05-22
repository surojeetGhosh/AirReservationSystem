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
		else if(session.getAttribute("isAccess") == null){
			response.sendRedirect("index.jsp");
		}
	%>
	<!-- Navigation Bar -->
	<section class="navigation">


		<div class="container-fluid">


			<nav class="navbar navbar-expand-sm navbar-light px-4">
			  <a class="navbar-brand text-white" href="#">	<img src="images/favicon.ico" height = "30px" width="30px">AirEz</a>
			  <div class="collapse navbar-collapse text-white">
			    <ul class="navbar-nav ms-auto text-white">
			      <li class="nav-item dropdown text-white">
			        <a class="nav-link dropdown-toggle ms-auto text-white " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          <%
			          	String name = (String)session.getAttribute("email");
			          	out.println(name);
			          %>
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="#">Account Details</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="index.jsp">Logout</a>
			        </div>
			      </li>
			    </ul>
			  </div>
			  <a href="home.jsp" class="previous rounded-3">&laquo; Previous</a>
			</nav>
			


			<div class="row">
				 <h1><i class="fa-solid fa-plane"></i>Flight Results</h1>
		    </div>
		    <div class="row bg-light rounded flights-info shadow-lg">
		    	<%
		    		int count =1;
		    		if((LinkedList<LinkedList<String>>)session.getAttribute("data") == null){
		    			out.println("<h1 class='text-dark py-5'><i class='fa-solid fa-square-poll-vertical px-3'></i>Oopsie No Flights Available</h1>");
		    		}
		    		else{
		    			session.setAttribute("number", request.getParameter("number"));
		    			session.setAttribute("date", request.getParameter("Travel"));
		    			@SuppressWarnings("unchecked") LinkedList<LinkedList<String>> rs = (LinkedList<LinkedList<String>>)session.getAttribute("data");
		    			
		    			for(LinkedList<String> lt : rs) {
		    				
		    				String fname = lt.get(0);
		    				String flightno = lt.get(1);
		    				String source = lt.get(2);
		    				String dest =lt.get(3);
		    				String sourceTime = lt.get(4);
		    				String destTime = lt.get(5);
		    				Integer cost = Integer.parseInt(lt.get(6));
		    				out.println("<div class='border-bottom border-dark rounded pt-3 info text-dark'><p class='logo'>");
		    				
		    				if(fname.toLowerCase().equals("indigo")){
		    					out.println("<img src='images/indigo.png' class='p-2' width='80' height='80'><span class='px-2'>" + flightno + "</span>");
		    				}
		    				else if(fname.toLowerCase().equals("vistara")){
		    					out.println("<img src='images/vistara.png' class='p-2' width='80' height='80'><span class='px-2'>" + flightno + "</span>");
		    				}
		    				else if(fname.toLowerCase().equals("spicejet")){
		    					out.println("<img src='images/spicejet.png' class='p-2' width='80' height='80'><span class='px-2'>" + flightno + "</span>");
		    				}
		    				
		    				
		    				String Para = "</p><p class='text-dark py-2'><span class='px-2'>" + source + "</span><i class='fa-solid fa-arrows-left-right px-2 ico'></i><span class='px-2'>" + dest +  "</span></p>";
		    				cost *= Integer.parseInt(request.getParameter("number"));
		    				Para += "<p class='text-dark py-2'><span class='px-2'>" + sourceTime + "</span><i class='fa-solid fa-arrows-left-right ico'></i><span class='px-2'>" + destTime + "</span><span class='px-2'><i class='fa-solid fa-indian-rupee-sign px-2 ico'></i>" + cost +  "</span></p>";
		    				Para += "<form action='checkIn.jsp' method='post' class='pb-3 Buy'>";
		    				Para += "<button name='index' type='submit' class='btn btn-outline-danger' value='" + count +"' class='btn btn-outline-danger'>Buy</button></form>";
		    				out.println(Para);
		    				
		    				out.println("</div>");
		    				count++;
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
