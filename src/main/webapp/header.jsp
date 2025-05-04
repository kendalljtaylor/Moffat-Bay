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
  <title>Moffat-Bay Lodge</title>
</head>
<body>
  <header class="navheader">
    <nav>
      <!-- Logo -->
      <a href="landing.jsp" class="logo">
        <img src="images/logo.jpg" alt="logo" max-height="40px" />
      </a>

      <!-- Navigation menu -->
      <div class="menu">
        <div class="menu-item"><a href="landing.jsp">Home</a></div>
        <div class="menu-item"><a href="attractions.jsp">Attractions</a></div>
        <div class="menu-item"><a href="reservation.jsp">Reservations</a></div>
        <div class="menu-item"><a href="aboutus.jsp">About Us</a></div>
        <div class="menu-item"><a href="lookup.jsp">Find Reservation</a></div>
      </div>

      <!-- Right side: Search bar and session-aware login/logout -->
      <div class="menu-right">

        <!-- BEGIN: Show first name if user is logged in -->
        <%
          // Get the user's first name from the session
          String firstName = (String) session.getAttribute("firstName");

          if (firstName != null) {
        %>
          <!-- User is logged in -->
          <div class="menu-login">
            <span>Hello, <strong><%= firstName %></span>
            <a href="logout.jsp">Logout</a>
          </div>
        <%
          } else {
        %>
          <!-- User not logged in -->
          <div class="menu-login">
            <a href="login.jsp">Login</a>
          </div>
        <%
          }
        %>
        <!-- END -->
      </div>
    </nav>
  </header>
</body>
</html>

