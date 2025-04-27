<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
  <title>Moffat-Bay Lodge - Create Account</title>
</head>
<body>
<div class="background-image">

<jsp:include page="header.jsp"/>


<div class="form-container">
  <h2>Create Your Account</h2>
  
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
      
  <form action="RegisterServlet" method="post">
    <label>Email Address</label>
    <input type="email" name="email" required>

    <label>First Name</label>
    <input type="text" name="first_name" required>

    <label>Last Name</label>
    <input type="text" name="last_name" required>

    <label>Phone Number</label>
    <input type="text" name="phone" required>

    <label>Password</label>
    <input type="password" name="password" required>

    <small>Must be 8 characters with 1 number, 1 uppercase, and 1 lowercase letter</small>

    <label>Confirm Password</label>
    <input type="password" name="confirm_password" required>

    <button class="button" type="submit">Register</button>
  </form>
  <p>Already have an account? <a href="login.jsp">Sign in</a></p>
</div>

<jsp:include page="footer.jsp"/>
</div>
</body>
</html>