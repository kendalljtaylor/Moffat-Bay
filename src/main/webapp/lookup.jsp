<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.moffatbay.util.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <link rel="stylesheet" type="text/css" href="lookup-style.css" />
  <title>Moffat Bay Lodge - Reservation Lookup</title>
</head>
<body class="lookup-page">
  <jsp:include page="header.jsp"/>
  
  <div class="banner">
    <img src="https://moffat-bay.org/media/site/landing_header.jpg" alt="Moffat Bay Lodge">
    <div class="banner-overlay">
      <div class="banner-content">
        <h1>Reservation Lookup</h1>
        <div class="form-container">
          <form action="LookupServlet" method="post">
            <div class="form-group">
              <label for="email">Email Address</label>
              <input type="email" id="email" name="email" placeholder="Enter your email address" />
            </div>
            <div class="form-divider">
              <span>or</span>
            </div>
            <div class="form-group">
              <label for="reservationNumber">Reservation ID</label>
              <input type="text" id="reservationNumber" name="reservationNumber" placeholder="Enter reservation number" />
            </div>
            <button type="submit" class="search-button">Search Reservation</button>
            
            <!-- Reservation Details Section - Moved below search button -->
            <div class="reservation-results">
              <c:if test="${not empty reservation}">
                <div class="reservation-details">
                  <h2>Reservation Details</h2>
                  <div class="detail-row">
                    <span class="detail-label">Reservation ID:</span>
                    <span class="detail-value">${reservation.reservationId}</span>
                  </div>
                  <div class="detail-row">
                    <span class="detail-label">Check-in Date:</span>
                    <span class="detail-value">${reservation.checkInDate}</span>
                  </div>
                  <div class="detail-row">
                    <span class="detail-label">Check-out Date:</span>
                    <span class="detail-value">${reservation.checkOutDate}</span>
                  </div>
                  <div class="detail-row">
                    <span class="detail-label">Room Type:</span>
                    <span class="detail-value">${reservation.roomSize}</span>
                  </div>
                  <div class="detail-row">
                    <span class="detail-label">Number of Guests:</span>
                    <span class="detail-value">${reservation.numberOfGuests}</span>
                  </div>
                </div>
              </c:if>
              
              <c:if test="${not empty message}">
                <div class="reservation-message">
                  <p>${message}</p>
                </div>
              </c:if>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"/>
</body>
</html>
