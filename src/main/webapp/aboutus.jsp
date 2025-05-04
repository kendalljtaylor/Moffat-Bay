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
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Moffat-Bay: About Us</title>
</head>
<body>
<jsp:include page="header.jsp"/>

         <!-- About us! -->
  <div class="row">
    <div class="text-box dark">
      <h2>About Us!</h2>
      <hr>
      <br />
      <p>Tucked away between whispering pines and misty bay waters, Moffat-Bay Lodge is a quiet haven for travelers seeking rest, adventure, or a bit of both. Whether you’re here to enjoy the natural beauty, sit by the fire with a warm drink, or explore the rugged trails nearby, our doors are always open.</p>
      <br />
      <p>Moffat-Bay Lodge was lovingly brought to life by a small team of developers with a shared vision: to capture the spirit of a wilderness retreat through thoughtful design and storytelling. Built as part of our final capstone project, this digital lodge reflects not just our technical skill—but our belief in crafting places, even virtual ones, where people feel right at home.</p>
    </div>
    <div class="image-box" style="background-image: url('https://www.telluride.com/site/assets/files/34622/6-bedroom_cabin_-_living_area_with_view_of_mountains.2000x1125.webp');"></div>
  </div>
  <!-- Brief Histoy -->
  <div class="row">
    <div class="image-box dark-overlay" style="background-image: url('https://cf.bstatic.com/xdata/images/hotel/max1024x768/342977823.jpg?k=6aa280ded50c0a1b559c63d8de057a8dd759eb69add1c96c614830781b2fc411&o=&hp=1');"></div>
    <div class="text-box light">
      <h2>A Brief History</h2>
      <hr>
      <br />
      <p>Long before the lodge stood nestled on the banks of Moffat Bay, this land was a resting place for weary explorers and fishermen seeking shelter from the stormy northern waters. In 1926, a retired sea captain by the name of Elias Moffat laid the first beams of what would become the heart of the lodge. Built from hand-hewn cedar and stone gathered from the nearby cliffs, the original structure served as a waypoint for traders, hunters, and storytellers passing through the region.</p>
      <br />
    </div>
  </div>
  <!-- Contact Information -->
<div class="row contact-section">
  <div class="text-box dark">
    <h2>Get in Touch</h2>
    <hr>
    <br />
    <p>Have questions or want to plan your stay? We’d love to hear from you!</p>
    <br />
    <div class="contact-info">
          <p><strong>Email:</strong> <a href="mailto:info@moffatbaylodge.com">info@moffatbaylodge.com</a></p>
          <p><strong>Phone:</strong> <a href="tel:+13605551234">(360) 555-1234</a></p>
          <p><strong>Address:</strong> 47 Seafarer's Way, Moffat Island, WA 98261</p>
    </div>
  </div>
   <div class="image-box" style="background-image: url('https://www.thewhitefacelodge.com/wp-content/uploads/2019/07/front_desk.jpg');"></div>
  </div>
</div>
</div>

        <script src="script.js"></script>
    
    <script type="text/javascript" src="js/script.js"></script>
  <jsp:include page="footer.jsp"/>
</body>
</html>