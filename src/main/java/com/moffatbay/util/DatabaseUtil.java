package com.moffatbay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//BRAVO TEAM
//MOFFAT BAY LODGE
//CSD440: CAPSTONE Project
//- Jessica Hall
//- Outhayvanh Somchaleun
//- Taylor Kendall
//- Victor Gregory

public class DatabaseUtil {

    // Database URL, username, and password
    private static final String DB_URL = "jdbc:mysql://localhost:3306/moffat_bay";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password123"; // Replace with your actual password

    /**
     * Establishes and returns a connection to the MySQL database.
     * 
     * @return Connection object
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Explicitly load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // Log and rethrow as a runtime exception if the driver class is not found
            System.err.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        // Return the connection using the DriverManager
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}