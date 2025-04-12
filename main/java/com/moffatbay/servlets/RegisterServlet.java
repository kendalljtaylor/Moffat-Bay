package com.moffatbay.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.*;
import com.moffatbay.util.DatabaseUtil; // Import utility class for DB connection
import org.mindrot.jbcrypt.*;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm_password");
		
        // Check if the password and confirm password match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Validate the strength of the password
        if (!isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters long and contain 1 number, 1 uppercase, and 1 lowercase letter.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
		
		String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection connection = DatabaseUtil.getConnection()) {
				PreparedStatement userCheck = connection.prepareStatement("SELECT * FROM user WHERE email = ?");
				userCheck.setString(1, email);
				ResultSet rs = userCheck.executeQuery();
				
				if (rs.next()) {
					request.setAttribute("errorMessage", "This email has already been registered.");
					request.getRequestDispatcher("register.jsp").forward(request, response);
					return;
				}
				
				String query = "INSERT INTO user (email, first_name, last_name, phone, password) VALUES (?, ?, ?, ?, ?)";
				PreparedStatement stmt = connection.prepareStatement(query);
				stmt.setString(1, email);
				stmt.setString(2,  firstName);
				stmt.setString(3, lastName);
				stmt.setString(4, phone);
				stmt.setString(5, hashPassword);
				
				int rowsInserted = stmt.executeUpdate();
				if(rowsInserted > 0) {
					request.setAttribute("successMessage", "You have successfully registered. Please log in.");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} else {
					request.setAttribute("errorMessage", "Registration failed. Please try again.");
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", "Database connection error: " + e.getMessage());
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
			
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
			
		}
    private boolean isValidPassword(String password) {
        return password.length() >= 8 &&
               password.matches(".*[A-Z].*") &&
               password.matches(".*[a-z].*") &&
               password.matches(".*\\d.*");
    }

	}