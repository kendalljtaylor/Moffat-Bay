<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!--- BRAVO TEAM
MOFFAT BAY LODGE
CSD440: CAPSTONE Project
- Jessica Hall
- Outhayvanh Somchaleun
- Taylor Kendall
- Victor Gregory -->

<head>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Moffat-Bay Lodge</title>
</head>

<body>
  <jsp:include page="header.jsp" />

  <!-- HIKING -->
  <div class="row">
    <div class="text-box dark">
      <h2>HIKING</h2>
      <hr><br />
      <p>Explore new heights as you journey through the breathtaking landscapes of Joviedsa Island. With trails designed for both beginners and experienced hikers, there is a path for everyone to enjoy. Walk through quiet forests, climb gentle slopes, and take in sweeping views from scenic lookouts. Along the way, you may spot native wildlife, hear the rustle of leaves in the breeze, and feel a deep connection with nature. Each trail invites you to slow down, breathe deeply, and enjoy the journey.</p>
      <br />
    </div>
    <div class="image-box"
      style="background-image: url('https://images.unsplash.com/photo-1551632811-561732d1e306?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGlraW5nfGVufDB8fDB8fHww');">
    </div>
  </div>

  <!-- WHALE WATCHING -->
  <div class="row">
    <div class="image-box dark-overlay"
      style="background-image: url('https://www.embarcaderoresort.com/wp-content/uploads/2021/02/Whale-Watching-Newport-Oregon.jpg');">
    </div>
    <div class="text-box light">
      <h2>WHALE WATCHING</h2>
      <hr><br />
      <p>Joviedsa Island is known for its incredible views and unforgettable whale watching experiences. Step aboard one of our guided tours and enjoy a peaceful ride through open waters where whales often make their appearance. With the help of onboard binoculars and knowledgeable guides, you will be able to spot orcas, humpbacks, and other marine life in action. This relaxing outing is perfect for couples, families, and anyone who appreciates the beauty of nature. Every tour offers a chance to witness something truly special.</p>
      <br />
    </div>
  </div>

  <!-- KAYAKING -->
  <div class="row">
    <div class="text-box dark">
      <h2>KAYAKING</h2>
      <hr><br />
      <p>There is nothing quite like the feeling of being out on the water surrounded by the quiet beauty of the outdoors. Our kayak tours are a fun and peaceful way to explore the coastline of Joviedsa Island. Paddle along clear waters, pass rocky shores, and glide through calm inlets with friends or family. Whether it is your first time or you have years of experience, you will find this activity both refreshing and exciting. Enjoy the freedom of the open water and take in views you can only experience from a kayak.</p>
      <br />
    </div>
    <div class="image-box"
      style="background-image: url('https://travelsouthernoregoncoast.com/wp-content/uploads/2024/04/2024TSOC_April_Kayak_sea.jpg');">
    </div>
  </div>

  <!-- SCUBA DIVING -->
  <div class="row">
    <div class="image-box dark-overlay"
      style="background-image: url('https://sustainabletravel.org/wp-content/uploads/Blog-Header-Diver-School-of-Fish.jpg');">
    </div>
    <div class="text-box light">
      <h2>SCUBA DIVING</h2>
      <hr><br />
      <p>Join us for an unforgettable adventure beneath the waves. Scuba diving at Moffat Bay reveals a hidden world filled with color and life. Explore coral reefs, swim alongside schools of fish, and get a close look at sea creatures in their natural environment. Our diving packages include all equipment and guidance needed to ensure a fun and safe experience. Whether you are exploring a reef for the first time or returning for another dive, you will leave the water with new memories and a deeper appreciation for the ocean.</p>
      <br />
    </div>
  </div>

  <script src="script.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
  <jsp:include page="footer.jsp" />
</body>

</html>

