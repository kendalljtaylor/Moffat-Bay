<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

  <div class="background-image">
    <div class="form-container">
      
      <!-- Show the login prompt message if it's set -->
      <% if (request.getAttribute("message") != null) { %>
        <p class="message"><strong><%= request.getAttribute("message") %></strong></p>
      <% } %>

      <!-- Reservation form -->
      <form id="reservationForm" action="ReservationServlet" method="post">
        <h2>Make Your Escape</h2>

        <h2>Arrival & Departure Dates</h2>
        <div class="date-section">
        <% 
        	Date today = new Date();
        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        	String todaysDate = formatter.format(today);
        %>
          <div class="date-field">
            <label for="checkIn">Arrival Date</label>
            <input type="date" name="checkIn" id="checkIn" required 
                   value="<%= request.getAttribute("checkIn") != null ? request.getAttribute("checkIn") : "" %>"
                   min="<%= todaysDate %>">
          </div>
          <div class="date-field">
            <label for="checkOut">Departure Date</label>
            <input type="date" name="checkOut" id="checkOut" required
                   value="<%= request.getAttribute("checkOut") != null ? request.getAttribute("checkOut") : "" %>"
                   min="<%= todaysDate %>">
          </div>
        </div>

        <div class="guests-section">
          <h2>Number of Guests</h2>
          <input type="number" name="guests" id="guests" required min="1" max="4"
                 value="<%= request.getAttribute("guests") != null ? request.getAttribute("guests") : "" %>">
        </div>

        <div class="room-section">
          <h2>Room Size:</h2>
          <select name="roomType" id="roomType" class="room-select" required>
            <option value="" disabled <%= request.getAttribute("roomType") == null ? "selected" : "" %>>Select a room type</option>
            <option value="Double Full Beds" <%= "Double Full Beds".equals(request.getAttribute("roomType")) ? "selected" : "" %>>Double Full Beds ($126.00/Night)</option>
            <option value="Queen" <%= "Queen".equals(request.getAttribute("roomType")) ? "selected" : "" %>>Queen ($141.75/Night)</option>
            <option value="Double Queen Beds" <%= "Double Queen Beds".equals(request.getAttribute("roomType")) ? "selected" : "" %>>Double Queen Beds ($157.50/Night)</option>
            <option value="King" <%= "King".equals(request.getAttribute("roomType")) ? "selected" : "" %>>King ($168.00/Night)</option>
          </select>
        </div>

        <input type="submit" value="Book" class="book-btn">
      </form>
    </div>

    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>
