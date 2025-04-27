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
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Moffat-Bay Lodge</title>
</head>

<body>
<jsp:include page="header.jsp"/>
<!-- HIKING -->
<div class="row">
  <div class="text-box dark">
    <h2>HIKING</h2>
    <hr>
    <br />
    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar
      vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>
    <br/>
    <br/>
    <p>Learn more about our <a href="/" class="btn tertiary"> Attractions</a></p>
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
    <hr>
    <br />
    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar
      vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>
    <br/>
    <br/>
    <p>Learn more about our <a href="/" class="btn tertiary"> Attractions</a></p>
    </a>
  </div>
  <!-- KAYAKING -->
  <div class="text-box dark">
    <h2>KAYAKING</h2>
    <hr>
    <br />
    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar
      vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>
    <br/>
    <br/>
    <p>Learn more about our <a href="/" class="btn tertiary"> Attractions</a></p>
    </a>
  </div>
  <div class="image-box"
       style="background-image: url('https://travelsouthernoregoncoast.com/wp-content/uploads/2024/04/2024TSOC_April_Kayak_sea.jpg');"></div>
  <div class="image-box dark-overlay"
       style="background-image: url('https://sustainabletravel.org/wp-content/uploads/Blog-Header-Diver-School-of-Fish.jpg');""></div>
<div class=" text-box light">
  <!--Scuba Diving-->
  <h2>Scuba Diving</h2>
  <hr>
  <br />
  <br />
  <p>Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar
    vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.</p>
  <br/>
  <br/>
  <p>Learn more about our <a href="/" class="btn tertiary"> Attractions</a></p>
  </a>
  </p>
</div>
</div>
<jsp:include page="footer.jsp"/>
<!--Javascript-->
<script>
  function toggleMenu(el) {
    document.querySelector('.menu').classList.toggle('show');
    el.classList.toggle('open');
  }
</script>

</body>

</html>