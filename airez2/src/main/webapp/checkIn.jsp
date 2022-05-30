<%@page import="java.util.Iterator" errorPage="error.jsp"%>
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
		else if(session.getAttribute("isAccess") == null){
			response.sendRedirect("home.jsp");
		}
	%>
	<!-- Navigation Bar -->
	<section class="navigation">


		<div class="container-fluid">


			<nav class="navbar navbar-expand-sm navbar-light px-4">
			  <a class="navbar-brand text-white" href="#">	<img src="images/favicon.ico" height = "30px" width="30px">AirEz</a>
			  <a href="home.jsp" class="previous rounded-3 ms-auto">&laquo; 
			  <%
			  	if(request.getAttribute("Ok") != null){
	    			out.println("Go To Home Page");
	    		}
			  	else{
			  		out.println("Cancel");
			  	}
			  %>
			  </a>
			</nav>
			
				

			<div class="row">
				 <h1><i class="fa-solid fa-plane"></i>Billing</h1>
		    </div>
		    <div class="row bg-light rounded flights-info shadow-lg">
		    	<%
		    		if(request.getAttribute("Ok") != null){
		    			out.println("<h1 class='text-success py-5'><i class='fa-solid fa-thumbs-up'></i>Your Booking is done</h1>");
		    		}
		    		else{
		    			int index = Integer.parseInt((String)request.getParameter("index"));
			    		@SuppressWarnings("unchecked") LinkedList<LinkedList<String>> rs = (LinkedList<LinkedList<String>>)session.getAttribute("data");
			    		LinkedList<String> lt = rs.get(index - 1);
			    		session.setAttribute("ticket",lt);
			    		int num = Integer.parseInt((String)session.getAttribute("number"));
		    			String fname = lt.get(0);
	    				String flightno = lt.get(1);
	    				String source = lt.get(2);
	    				String dest =lt.get(3);
	    				String sourceTime = lt.get(4);
	    				String destTime = lt.get(5);
	    				Integer cost = Integer.parseInt(lt.get(6));
	    				out.println("<div class='pt-3 info text-dark col-lg-6'>");	
	    				if(fname.toLowerCase().equals("indigo")){
	    					out.println("<img src='images/indigo.png' class='p-2' width='80' height='80'><span class='px-2'>" + flightno + "</span>");
	    				}
	    				else if(fname.toLowerCase().equals("vistara")){
	    					out.println("<img src='images/vistara.png' class='p-2' width='80' height='80'><span class='px-2'>" + flightno + "</span>");
	    				}
	    				else if(fname.toLowerCase().equals("spicejet")){
	    					out.println("<img src='images/spicejet.png' class='p-2' width='80' height='80'><span class='px-2'>" + flightno + "</span>");
	    				}
	    				String Para = "<p class='py-2'><span class='px-2'>Flight number -> " + flightno + "</span><br><br><span class='px-2'>" + source + "</span><i class='fa-solid fa-arrows-left-right px-2 ico'></i><span class='px-2'>" + dest +  "</span></p>";
	    				cost *= num;
	    				Para += "<p class='py-2'><span class='px-2'>" + sourceTime + "</span><i class='fa-solid fa-arrows-left-right ico'></i><span class='px-2'>" + destTime + "</span><span class='px-2'>Cost-> <i class='fa-solid fa-indian-rupee-sign px-2 ico'></i>" + cost +  "</span></p>";
	    				out.println(Para);
	    				
	    				out.println("</div>");
		    		
		    		
		    	%>
		    	
		    	<div class="col-lg-6 payment text-dark rounded-3 p-3 shadow-lg">
		    		<h4 class="fw-bold">Payment Details</h4>
		    		<p>Complete your purchase by providing your payment details</p>
		    		<form action="payment" method="post">
		    			<label class="fw-bold">Card details<i class="fa-brands fa-cc-visa px-2 fs-4"></i> :</label><br>
		    			<div class="row pt-2">
		    				<label class="col-4 pr-2">Card Number :</label>
		    				<input type="text" class="col-6" pattern="[0-9]+" required minlength=16 maxlength=16>
		    			
		    			</div>
		    			<div class="row pt-2">
		    				<label class="col-4 pr-2">Card Validity :</label>
		    				<%
		    					LocalDate currentdate = LocalDate.now();
		    					int Month = currentdate.getMonthValue();
		    					int Year = currentdate.getYear();
		    					String date = "" + Year;
		    					if(("" + Month).length() == 1) date += ("-0" + Month);
		    					else date += ("-" + Month);
		    					String validity= "<input type='month' class='col-4' pattern='[0-9]+' required " +  "min='" + date + "'>";
		    					out.println(validity);
		    				%>
		    				
		    			
		    			</div>
		    			<div class="row pt-2">
		    				<label class="col-4 pr-2">CVV :</label>
		    				<input type="password" class="col-1" pattern="[0-9]{3}" required minlength=3 maxlength=3>
		    			
		    			</div>
		    			
		    			<div class="row pt-2">
		    				<label class="col-4 pr-2">Cardholder name :</label>
		    				<input type="text" class="col-6" pattern="[A-Za-z\s]+" required minlength=1 maxlength=40>
		    			
		    			</div>
		    			
		    			<label class="fw-bold py-2">Billing Address <i class="fa-solid fa-house px-2 fs-4"></i> :</label><br>
		    			<select class="form-select">
                                <option selected hidden>Select Country</option>
                                <option value="1">India</option>
                        <div class="row">
                        
                        
                        </div>
                        <input class="form-control" type="text" pattern = "[0-9]{5,}" placeholder="ZIP" required minlength=5 maxlength=6>
                        <input class="form-control" type="text" pattern = "[A-Za-z]+" placeholder="State" required minlength=1 maxlength=40>
		    			
		    			
		    			<div class='row pt-3 text-center'>
		    				<label class="col-lg-6 fw-bold">Subtotal</label>
		    				<%
		    					
		    					out.println("<label class='col-lg-6'>" + cost + "</label>");
		    				%>
		    				<label class="col-lg-6 fw-bold">Convenience Fee</label>
		    				<%
		    					
		    					out.println("<label class='col-lg-6'>" + cost*0.1 + "</label>");
		    				%>
		    				<hr>
		    				<label class="col-lg-6 fw-bold">Total</label>
		    				<%
		    					String cost1 = "" + (cost + cost*0.1);
		    					session.setAttribute("cost", cost1);
		    					out.println("<label class='col-lg-6'>" + (cost + cost*0.1) + "</label>");
		    				%>
		    			</div>
		    			<div class="pay pt-3">
		    				<%
		    					
		    					out.println("<input type='submit' name='payment' class='btn btn-outline-dark' value = 'Pay Rs. "+ (cost + cost*0.1) + "'>");
		    				  }
		    				%>
		    			
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
