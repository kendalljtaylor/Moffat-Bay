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
  <title>Reservation Confirmation</title>
</head>
<body>
  <jsp:include page="header.jsp"/>

  <div class="banner">
    <img src="https://moffat-bay.org/media/site/landing_header.jpg" alt="landing header">
    <div class="banner-overlay">
      <h1>Moffat Bay Lodge</h1>
    </div>
  </div>

  <div class="summary-container">
    <h2>Reservation Confirmed</h2><br>
    
    <strong>Check in: <%= request.getAttribute("checkIn") %></strong><br><br>
    <strong>Check out: <%= request.getAttribute("checkOut") %></strong><br><br>
    <strong>Room: <%= request.getAttribute("roomType") %></strong><br><br>
    <strong>Number of Guests: <%= request.getAttribute("guests") %></strong><br><br>
    <strong>Total: $<%= String.format("%.2f", request.getAttribute("totalAmount")) %></strong><br><br>
    
    <!-- Reservation ID confirmation -->
    <strong>Reservation ID: <%= request.getAttribute("reservationId") %></strong><br><br>

    <div class="back-home">
      <a href="landing.jsp">Return to Home</a>
    </div>
  </div>

  <jsp:include page="footer.jsp"/>
</body>
</html>
