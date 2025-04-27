<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--- BRAVO TEAM
      MOFFAT BAY LODGE
      CSD440: CAPSTONE Project
      - Jessica Hall
      - Outhayvanh Somchaleun
      - Taylor Kendall
      - Victor Gregory -->

<%
    // Invalidate the session to log the user out
    session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Logged Out</title>
</head>
<body>
  <div class="background-image">
    <jsp:include page="header.jsp"/>
    
    <div class="login-form">
      <h2>You Have Successfully Logged Out</h2>
      
      <!-- Success Message -->
      <div class="success-message">
        <p>Thank you for visiting Moffat Bay Lodge.</p>
      </div>

    </div>

    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>