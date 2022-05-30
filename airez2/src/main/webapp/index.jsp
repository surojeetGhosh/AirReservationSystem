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
            <tr class = "shadow-lg interface p-5">
              <td>
                <h1>Welcome to AirEz!!</h1>
                <h2>Login to get </h2>
                <ul>
                  <li>Access to our Friendly Booking System</li>
                  <li>Make checkouts simpler</li>
                  <li>Get discounts and offers</li>
                </ul>


              </td>
              <td>
                <form class="form" action="loginVerification" method="post">
                  <table>
                    <tr>
                      <td>
                        <label>Email: </label>
                      </td>
                      <td>
                        <input type="email" name="email" value="" required >
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label>Password:</label>
                      </td>
                      <td>
                        <input type="password" name="pass" value="" required minlength="8" maxlength="20">
                      </td>
                    </tr>
                  </table>
                  <a href="admin.jsp" class="btn btn-link">Admin?</a>
                  <a href="register.jsp" class="btn btn-link">Not Registered?</a><br>
                  <%
                  	response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate" );
                  	session = request.getSession();
                  	session.removeAttribute("email");
                  	session.removeAttribute("name");
                  	String isWrong = (String)request.getAttribute("isCorrect");
                  	if(isWrong == null) {}
                  	else if(isWrong.equals("1")){
                  		out.println("<label class='error'>*Password or Username is incorrect</label>");
                  		
                  	}
                  %>
                  <input type="submit" class="btn btn-primary" name="" value="Sign in">
                </form>
              </td>
            </tr>
          </table>
    </body>


</html>
