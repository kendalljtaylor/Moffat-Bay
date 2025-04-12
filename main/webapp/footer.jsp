<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Moffat-Bay Lodge</title>
</head>
<body>
  <footer class="footer">
    <div class="footer-section main-section">
      <div class="footer-left">
        <h3>USEFUL LINKS</h3>
        <div class="menu">
          <div class="menu-item"><a href="/">Home</a></div>
          <div class="menu-item"><a href="/make_reservations/">Reservations</a></div>
          <div class="menu-item"><a href="login.jsp">Login</a></div>
        </div>
      </div>

      <div class="footer-column subscribe">
        <h2>GET IN TOUCH WITH US!</h2>
        <p>Stay connected with us! Join our mailing list to receive <strong>updates</strong> and <strong>special discounts.</strong></p>
        <form class="email-form" method="POST">
          <input type="email" placeholder="Add your email..." required />
          <button type="submit" name="mailform_submit">Subscribe</button>
        </form>
      </div>

      <div class="footer-right">
        <h3>LEARN MORE</h3>
        <div class="menu">
          <div class="menu-item"><a href="/about-moffat-bay-lodge/">About Us</a></div>
          <div class="menu-item"><a href="/attractions/">Attractions</a></div>
          <div class="menu-item"><a href="/accomodations/">Accommodations</a></div>
        </div>
      </div>
    </div>

    <div class="footer-section bottom-section">
      <p>&copy; 2025 Moffat Bay Lodge</p>
      <p><strong>Disclaimer:</strong> This site is not intended to act as an actual booking site. Moffat-Bay-Lodge is a fictional place and this site is for educational purpose.</p>

      <div class="socials">
		<h4>FOLLOW US!</h4>
        <a href="/" target="_blank">
          <img src="/" alt="Facebook">
        </a>
        <a href="/" target="_blank">
          <img src="/" alt="YouTube">
        </a>
        <a href="/" target="_blank">
          <img src="/" alt="Twitter">
        </a>
      </div>
    </div>
  </footer>
  </body>
  </html>