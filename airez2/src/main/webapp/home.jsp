<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.LinkedList, java.util.Iterator, java.time.LocalDate" %>

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
			  <div class="collapse navbar-collapse text-white">
			    <ul class="navbar-nav ms-auto text-white">
			      <li class="nav-item dropdown text-white">
			        <a class="nav-link dropdown-toggle ms-auto text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          <%
			          	String name = (String)session.getAttribute("email");
			          	out.println(name);
			          %>
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="account">Purchase History</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="index.jsp">Logout</a>
			        </div>
			      </li>
			    </ul>
			  </div>
			</nav>


			<div class="row">

		        <div class="col-lg-6">
		          <h1>Book Your Travel Companion</h1>
		          <img src="images/screen-6.png" alt="iphone-mockup" class="image">
		        </div>

		        <div class="col-lg-6 shadow-lg rounded-3 bg-dark" id="form">
		        
		        
		        <!-- Form -->
		         
		         <form action="FlightSearch" class="p-3" method="post">
		         		<div class="border-bottom border-danger px-1 py-5 row rounded-3">
		         			<div class="col-lg-5">
		         			  <label for="origin">*Origin</label>
                    		  <input type="text" name="origin" class="form-control" id="origin" required>
                    		</div>
							<div class="col-lg-2"><i class="fa-solid fa-plane-arrival pt-4"></i></div>
							<div class="col-lg-5">
		         			  <label for="dest">*Destination</label>
                    		  <input type="text" name="dest" class="form-control" id="dest" required>
                    		</div>

		         		</div>
		         		<div class="border-bottom border-danger px-1 py-4 row rounded-3">
		         			<div class="col-12">
		         			  <label for="origin" class="pb-3"><i class="fa-solid fa-suitcase px-3"></i> *Travel Date </label>
		         			  <%
		    					LocalDate currentdate = LocalDate.now();
		         				int day = currentdate.getDayOfMonth();
		    					int Month = currentdate.getMonthValue();
		    					int Year = currentdate.getYear();
		    					String date = "" + Year;
		    					if(("" + Month).length() == 1) date += ("-0" + Month);
		    					else date += ("-" + Month);
		    					
		    					if(("" + day).length() == 1) date += ("-0" + day);
		    					else date += ("-" + day);
		    					String validity= "<input type='date' name='Travel' class='form-control' id='origin' required min = '" + date + "'>";
		    					out.println(validity);
		    					System.out.println(date);
		    				  %>
                    		</div>
		         		</div>
		         		
		         		<div class="border-bottom border-danger px-1 py-4 row rounded-3">
		         			<div class="col-12">
		         			  <label for="travel" class="pb-3"><i class="fa-solid fa-people-group px-3"></i> *Travellers </label><br>
                    		  <input type="number" class="d-block col-12" id="travel" name="number" min="1" max="10" required>
                    		</div>
		         		</div>
		         		
		         		<div class="px-1 py-5 rounded-3">
		         			<div>
		         			  <%
		         			  	if(session.getAttribute("isDestEqual") != null){
		         			  		String isDestEqual = (String)session.getAttribute("isDestEqual");
		         			  		out.println("<label class='error p-2'>*Destination is same</label>");
		         			  	}
		         			  	
		         			  	session.removeAttribute("isDestEqual");
		         			 
		         			  %>
                    		  <input type="submit" class="btn btn-outline-danger btn-light col-12" name="" value="Flight Search">
                    		</div>

		         		</div>

		         </form>
		        </div>

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
