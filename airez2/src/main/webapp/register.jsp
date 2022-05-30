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
      <link rel="stylesheet" href="css/styles.css">
      <link rel="icon" href="images/favicon.ico">

      <!-- fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;900&family=Ubuntu&display=swap" rel="stylesheet">



    </head>
    <body>


          <table class="d-flex align-items-center justify-content-center vh-100">
            <tr class="interface shadow-lg p-5">
              <td>
                <h1>Welcome to AirEz!!</h1>
                <h2>Register now to get </h2>
                <ul>
                  <li>Access to our Friendly Booking System</li>
                  <li>Make checkouts simpler</li>
                  <li>Get discounts and offers</li>
                </ul>


              </td>
              <td>
                <form class="form" action="Register" method="post">
                  <table>
                    <tr>
                      <td>
                        <label>First Name: </label>
                      </td>
                      <td>
                        <input type="text" name="fname" value="" required minlength="1"  maxlength="40" pattern="[A-Za-z]+">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label>Last Name: </label>
                      </td>
                      <td>
                        <input type="text" name="lname" value="" required minlength="1" maxlength="40" pattern="[A-Za-z]+">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label>Email:</label>
                      </td>
                      <td>
                        <input type="email" name="email" value="" required maxlength="40">
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label>Create Password:</label>
                      </td>
                      <td>
                        <input type="password" name="pass" value="" required minlength="8" maxlength="40" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                      </td>
                    </tr>
                  </table>
                  
                   <p class="instruc">*must contain a digit, special, lowercase and uppercase character</p>
                    
                  <%
                  	response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate" );
                  	String isCorrect = (String)request.getAttribute("isCorrect");
                  	if(isCorrect == null) {}
                  	else if(isCorrect.equals("0")){
                  		out.println("<label class='ok'>You are registered now you can login</label>");
                  	}
                  	else if(isCorrect.equals("1")){
                  		out.println("<label class='error'>*Email is already in use</label>");
                  	}
                  %>
                  
                  <a href="index.jsp" class="btn btn-primary">Login</a><br>
                  <input type="submit" class="btn btn-primary" name="" value="Register">
                </form>
              </td>
            </tr>
          </table>


    </body>


</html>
