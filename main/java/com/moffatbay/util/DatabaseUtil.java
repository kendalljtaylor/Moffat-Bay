package com.moffatbay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Utility class for managing database connections.

public class DatabaseUtil {

    // Enter your local Database credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/moffat_bay";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "password123";

    // Static method to get a DB connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }
}
