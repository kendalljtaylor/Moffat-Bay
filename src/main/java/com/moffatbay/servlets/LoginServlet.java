package com.moffatbay.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.moffatbay.util.DatabaseUtil; // Import utility class for DB connection
import org.mindrot.jbcrypt.*;
// BRAVO TEAM
// MOFFAT BAY LODGE
// CSD440: CAPSTONE Project
// - Jessica Hall
// - Outhayvanh Somchaleun
// - Taylor Kendall
// - Victor Gregory -->
public class LoginServlet extends HttpServlet {

    // Handles POST requests for logging in
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form parameters from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if the credentials are valid by querying the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DatabaseUtil.getConnection();

            // SQL query to check if the email and password match a user in the database
            PreparedStatement checkEmail = connection.prepareStatement("SELECT user_id, password, first_name FROM user WHERE email = ?");
            checkEmail.setString(1, email);
            ResultSet rsCheckUser = checkEmail.executeQuery();

            if (rsCheckUser.next()) {
                // If user exists, successful login
                String enteredPass = rsCheckUser.getString("password");

                if (BCrypt.checkpw(password, enteredPass)) {
                    HttpSession session = request.getSession();
                    // Store user data in the session
                    session.setAttribute("userEmail", email); // Store email for session tracking
                    session.setAttribute("firstName", rsCheckUser.getString("first_name")); // Store user's first name
                    session.setAttribute("userId", rsCheckUser.getInt("user_id")); // Store user ID for session tracking

                    // Send success message and redirect to landing page
                    request.setAttribute("successMessage", "Successfully logged in! Welcome to Moffat Bay Lodge, " + rsCheckUser.getString("first_name") + ".");
                    request.getRequestDispatcher("landing.jsp").forward(request, response);
                } else {
                    // If login is invalid, show an error message
                    request.setAttribute("errorMessage", "Invalid email or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                // If user doesn't exist, show an error message
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            // Handle SQL errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException for MySQL driver
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database connection error. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
