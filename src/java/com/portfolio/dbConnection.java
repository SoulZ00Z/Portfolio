/* DB Connect */
package com.portfolio;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnection {

    private static final String URL = "jdbc:ucanaccess://C:/Users/joshu/Desktop/Portfolio NB/Portfolio.accdb";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            conn = DriverManager.getConnection(URL);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver Not Found: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Connection Error: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }
}
