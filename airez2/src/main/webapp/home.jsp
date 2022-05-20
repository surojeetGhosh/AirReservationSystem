<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			          <a class="dropdown-item" href="#">Account Details</a>
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
		        
		        <div class="col-lg-6 shadow-lg rounded" id="form">
		         <form action="register.jsp" class="p-5">
			         <div class="choose row">
		                <input class="col-lg-2 form-check-input" type="radio" name="trip" value="1">
		                <label class="col-lg-4 form-check-label" for="one-way">One-Way</label>
		                <input class="col-lg-2 form-check-input" type="radio" name="trip" value="2">
		                <label class="col-lg-4 form-check-label" for="one-way">Two-Way</label>
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
