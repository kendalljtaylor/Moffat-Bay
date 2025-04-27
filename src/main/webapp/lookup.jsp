<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.moffatbay.util.DatabaseUtil" %>


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
  <title>Moffat Bay Lodge - Reservation</title>
</head>
<body>
  <jsp:include page="header.jsp"/>
  
  <div class="banner">
    <img src="https://moffat-bay.org/media/site/landing_header.jpg" alt="landing header">
    <div class="banner-overlay">
      <h1>Moffat Bay Lodge</h1>
    </div>
  </div>

  <div class="form-container">
    <h2>Reservation Lookup</h2><br>
    <form action="LookupServlet" method="post">
      <label>Email Address</label>
      <input type="email" name="email"><br><br>
      <p>Or</p><br><br>
      <label>Reservation ID</label>
      <input type="text" name="reservationNumber"><br><br>
      <button class="button" type="submit">Search</button>
    </form>
    
    <br>
    
    <%-- Display reservation details if available --%>
    <c:if test="${not empty reservation}">
        <h3>Reservation Details:</h3>
        <p><strong>Reservation ID:</strong> ${reservation.reservationId}</p>
        <p><strong>Check-in Date:</strong> ${reservation.checkInDate}</p>
        <p><strong>Check-out Date:</strong> ${reservation.checkOutDate}</p>
        <p><strong>Room Size:</strong> ${reservation.roomSize}</p>
        <p><strong>Guests:</strong> ${reservation.numberOfGuests}</p>
    </c:if>
    
    <%-- Show error message if no reservation found --%>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
  </div>

  <jsp:include page="footer.jsp"/>
</body>
</html>
