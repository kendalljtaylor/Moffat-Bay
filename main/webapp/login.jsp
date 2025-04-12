<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--- BRAVO TEAM
      MOFFAT BAY LODGE
      CSD440: CAPSTONE Project
      - Jessica Hall
      - Outhayvanh Somchaleun
      - Taylor Kendall
      - Victor Gregory -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Login</title>
</head>
<body>
  <div class="background-image">
    <jsp:include page="header.jsp"/>
    
    <div class="login-form">
      <h2>Sign In To Your Account</h2>

      <!-- Display Error Message if Login Fails -->
      <%
        // Check if the errorMessage attribute is set in the request
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
      %>
        <!-- Display the error message -->
        <div class="error-message">
          <p><%= errorMessage %></p>  <!-- Display the error message here -->
        </div>
      <%
        }
      %>
      
  <%
    String successMessage = (String) request.getAttribute("successMessage");
    if (successMessage != null) {
  %>
    <div class="success-message">
      <p><%= successMessage %></p>
    </div>
  <%
    }
  %>

      <div class="login-input">
        <form action="LoginServlet" method="post">
          <label for="email"><b>Email Address</b></label>
          <input type="email" placeholder="Enter Email" name="email" required><br>
          
          <label for="password"><b>Password</b></label>
          <input type="password" placeholder="Enter Password" name="password" required><br>
          
          <button class="login-button" type="submit">Log In</button>
          <p>Don't have an account? <a href="register.jsp">Register here.</a></p>
        </form>
      </div>
    </div>

    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>
