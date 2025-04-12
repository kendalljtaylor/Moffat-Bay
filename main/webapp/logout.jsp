<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Invalidate the session to log the user out
    session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  <title>Logged Out</title>
</head>
<body>
  <div class="main-content">
    <!-- Confirmation message after logout -->
    <h1>You have successfully logged out.</h1>
    <!-- Provide a link to log in again -->
    <p><a href="login.jsp">Click here</a> to log in again.</p>
  </div>
</body>
</html>
