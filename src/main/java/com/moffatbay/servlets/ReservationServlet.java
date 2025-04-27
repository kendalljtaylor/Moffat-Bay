package com.moffatbay.servlets;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.moffatbay.util.DatabaseUtil;

// BRAVO TEAM
// MOFFAT BAY LODGE
// CSD440: CAPSTONE Project
// - Jessica Hall
// - Outhayvanh Somchaleun
// - Taylor Kendall
// - Victor Gregory

public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to show the reservation form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            request.setAttribute("message", "You need to log in or create an account before booking a reservation.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("reservation.jsp").forward(request, response);
    }

    // Handle POST request to submit reservation
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            request.setAttribute("message", "You need to log in or create an account before booking a reservation.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String userEmail = session.getAttribute("userEmail").toString();
        int userId = getUserIdByEmail(userEmail);
        if (userId == -1) {
            request.setAttribute("message", "Unable to find your account information.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Get form values
        String checkInDate = request.getParameter("checkIn");
        String checkOutDate = request.getParameter("checkOut");
        String roomType = request.getParameter("roomType");
        String guestsStr = request.getParameter("guests");

        // Basic validation checks
        if (checkInDate == null || checkOutDate == null || checkInDate.isEmpty() || checkOutDate.isEmpty()) {
            request.setAttribute("message", "Check-in and Check-out dates are required.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        if (roomType == null || roomType.isEmpty()) {
            request.setAttribute("message", "Please select a room type.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        int numberOfGuests = 0;
        try {
            numberOfGuests = Integer.parseInt(guestsStr);
            if (numberOfGuests <= 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Please enter a valid number of guests.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        // Simple date comparison
        if (checkInDate.compareTo(checkOutDate) >= 0) {
            request.setAttribute("message", "Check-in date must be before check-out date.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        double roomPrice = getRoomPrice(roomType);
        if (roomPrice == -1) {
            request.setAttribute("message", "Invalid room type selected.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        // Calculate the number of nights
        long nights = calculateNights(checkInDate, checkOutDate);

        // Calculate total amount based on the number of nights and room rate
        double totalAmount = roomPrice * nights;

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            String roomId = getRoomId(roomType);

            String sql = "INSERT INTO reservation (user_id, room_id, checkin_date, checkout_date, number_of_guests, total_amount, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, userId);
            stmt.setString(2, roomId);
            stmt.setString(3, checkInDate);
            stmt.setString(4, checkOutDate);
            stmt.setInt(5, numberOfGuests);
            stmt.setDouble(6, totalAmount);
            stmt.setString(7, "Pending"); // Set status to "Pending"
            stmt.executeUpdate();

            // Retrieve the auto-generated reservation_id
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int reservationId = generatedKeys.getInt(1); // reservation_id is the auto-generated key
                request.setAttribute("reservationId", reservationId); // Forward reservationId to summary.jsp
            }

            request.setAttribute("checkIn", checkInDate);
            request.setAttribute("checkOut", checkOutDate);
            request.setAttribute("roomType", roomType);
            request.setAttribute("guests", numberOfGuests);
            request.setAttribute("totalAmount", totalAmount);

            request.getRequestDispatcher("summary.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing the reservation.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Helper method to get numeric user_id from userEmail
    private int getUserIdByEmail(String email) {
        int userId = -1;
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT user_id FROM user WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }

    private double getRoomPrice(String roomType) {
        double roomPrice = -1;
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT room_price FROM room WHERE room_size = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomType);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                roomPrice = rs.getDouble("room_price");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roomPrice;
    }

    private String getRoomId(String roomType) {
        String roomId = null;
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT room_id FROM room WHERE room_size = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomType);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                roomId = rs.getString("room_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roomId;
    }

    // Helper method to calculate the number of nights between check-in and check-out dates
    private long calculateNights(String checkInDate, String checkOutDate) {
        LocalDate checkIn = LocalDate.parse(checkInDate);
        LocalDate checkOut = LocalDate.parse(checkOutDate);
        return ChronoUnit.DAYS.between(checkIn, checkOut);
    }
}
