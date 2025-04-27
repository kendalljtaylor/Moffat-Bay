package com.moffatbay.servlets;

import java.io.IOException;
import java.sql.*;
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

public class LookupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to show the lookup form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("lookup.jsp").forward(request, response);
    }

    // Handle POST request to perform the reservation lookup
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String reservationNumber = request.getParameter("reservationNumber");
        Reservation reservation = null;

        if (email != null && !email.isEmpty()) {
            reservation = getReservationByEmail(email);
        } else if (reservationNumber != null && !reservationNumber.isEmpty()) {
            reservation = getReservationByNumber(reservationNumber);
        }

        if (reservation != null) {
            request.setAttribute("reservation", reservation);
            request.getRequestDispatcher("lookup.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "No reservation found with the provided details.");
            request.getRequestDispatcher("lookup.jsp").forward(request, response);
        }
    }

    // Helper method to retrieve reservation by email
    private Reservation getReservationByEmail(String email) {
        Reservation reservation = null;
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT r.reservation_id, r.checkin_date, r.checkout_date, r.room_id, r.number_of_guests, rm.room_size " +
                         "FROM reservation r " +
                         "JOIN user u ON r.user_id = u.user_id " +
                         "JOIN room rm ON r.room_id = rm.room_id " +
                         "WHERE u.email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                reservation = new Reservation(
                        rs.getInt("reservation_id"),
                        rs.getString("checkin_date"),
                        rs.getString("checkout_date"),
                        rs.getString("room_size"),
                        rs.getInt("number_of_guests")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservation;
    }

    // Helper method to retrieve reservation by reservation number
    private Reservation getReservationByNumber(String reservationNumber) {
        Reservation reservation = null;
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT r.reservation_id, r.checkin_date, r.checkout_date, r.room_id, r.number_of_guests, rm.room_size " +
                         "FROM reservation r " +
                         "JOIN room rm ON r.room_id = rm.room_id " +
                         "WHERE r.reservation_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, reservationNumber);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                reservation = new Reservation(
                        rs.getInt("reservation_id"),
                        rs.getString("checkin_date"),
                        rs.getString("checkout_date"),
                        rs.getString("room_size"),
                        rs.getInt("number_of_guests")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservation;
    }

    // Inner class to represent a Reservation
    public static class Reservation {
        private int reservationId;
        private String checkInDate;
        private String checkOutDate;
        private String roomSize;
        private int numberOfGuests;

        public Reservation(int reservationId, String checkInDate, String checkOutDate, String roomSize, int numberOfGuests) {
            this.reservationId = reservationId;
            this.checkInDate = checkInDate;
            this.checkOutDate = checkOutDate;
            this.roomSize = roomSize;
            this.numberOfGuests = numberOfGuests;
        }

        // Getters
        public int getReservationId() {
            return reservationId;
        }

        public String getCheckInDate() {
            return checkInDate;
        }

        public String getCheckOutDate() {
            return checkOutDate;
        }

        public String getRoomSize() {
            return roomSize;
        }

        public int getNumberOfGuests() {
            return numberOfGuests;
        }
    }
}
