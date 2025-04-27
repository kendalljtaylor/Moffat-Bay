package com.moffatbay.servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.moffatbay.util.DatabaseUtil;

//BRAVO TEAM
//MOFFAT BAY LODGE
//CSD440: CAPSTONE Project
//- Jessica Hall
//- Outhayvanh Somchaleun
//- Taylor Kendall
//- Victor Gregory

public class ConfirmReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the reservation ID from the request
        String reservationId = request.getParameter("reservationId");

        // Retrieve other reservation details from the database or session
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT * FROM reservation WHERE reservation_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, reservationId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Retrieve all necessary details
                String checkInDate = rs.getString("checkin_date");
                String checkOutDate = rs.getString("checkout_date");
                String roomId = rs.getString("room_id");
                int numberOfGuests = rs.getInt("number_of_guests");
                double totalAmount = rs.getDouble("total_amount");

                // Get room type based on roomId
                String roomType = getRoomType(roomId);

                // Set all necessary attributes for confirmation page
                request.setAttribute("checkIn", checkInDate);
                request.setAttribute("checkOut", checkOutDate);
                request.setAttribute("roomType", roomType);
                request.setAttribute("guests", numberOfGuests);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("reservationId", reservationId);

                // Forward to confirmation page
                request.getRequestDispatcher("confirmation.jsp").forward(request, response);
            } else {
                // If the reservation ID is invalid
                request.setAttribute("message", "Reservation not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing reservation confirmation.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        
        Connection conn = null;
        try {
        	conn = DatabaseUtil.getConnection();
        	
        	String sql = "UPDATE reservation SET STATUS = REPLACE(STATUS, 'Pending', 'Confirmed') WHERE reservation_id = ?";
        	PreparedStatement update = conn.prepareStatement(sql);
        	update.setString(1,  reservationId);
        	update.executeUpdate();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
        	try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }

    // Helper method to get room type based on room ID
    private String getRoomType(String roomId) {
        String roomType = "";
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT room_size FROM room WHERE room_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                roomType = rs.getString("room_size");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomType;
    }
}