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

  <!-- Include the header -->
  <jsp:include page="header.jsp"/>

  <!-- Check for a success message (e.g., login or logout) and display it -->
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

  <!-- Landing page banner -->
  <div class="banner">
    <img src="https://moffat-bay.org/media/site/landing_header.jpg" alt="landing header">
  <div class="banner-overlay">
    <h1>Welcome to Moffat Bay Lodge</h1>

    <div class="banner-logo-row">
    <p class="welcome-text" style="display:inline;">
      <img src="https://i.postimg.cc/Gt9fp9hZ/salmon-logo.png" class="salmon-logo" alt="Salmon Left" style="width:75px;height:60px;display:inline-block;" />
        Discover thrilling attractions and serene relaxation at our waterfront paradise.
      <img src="https://i.postimg.cc/Gt9fp9hZ/salmon-logo.png" class="salmon-logo flipped" alt="Salmon Right" style="width:75px;height:60px;display:inline-block;" />
      </p>
    </div>
    <br>
    <br>

    <div class="banner-buttons">
      <a href="/make-reservations/" class="btn primary">Book Now</a>
      <a href="/attractions/" class="btn secondary">Explore Attractions</a>
    </div>
    </div>
  </div>


  <jsp:include page="footer.jsp"/>

</body>
</html>



