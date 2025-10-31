/* Guest DAO */
package com.portfolio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GuestDAO {
    
    private Connection conn;
    
    public GuestDAO() {
        try {
            this.conn = dbConnection.getConnection();
            if (conn == null) {
                throw new SQLException("Connection failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Connection to DB failed.", e);
        }
    }
    
    public GuestBO verifyGuest(String guestID, String password) {
        GuestBO guest = null;
        String sql = "SELECT GuestID, PhoneNumber FROM GuestInfo WHERE GuestID = ? AND PW = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID.trim());
            statement.setString(2, password);
            
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    guest = new GuestBO();
                    guest.setGuestID(rs.getString("GuestID"));
                    guest.setPhoneNumber(rs.getString("PhoneNumber"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return guest;
    }
    
    // Select guest.
    public GuestBO selectGuest(String guestID) {
        GuestBO guest = null;
        String sql = "SELECT * FROM GuestInfo WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID);
            
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    guest = new GuestBO();
                    guest.setGuestID(rs.getString("GuestID"));
                    guest.setPhoneNumber(rs.getString("PhoneNumber"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return guest;
    }
    
    // Insert guest.
    public void insertGuest(GuestBO guest, String password) {
        String sql = "INSERT INTO GuestInfo (GuestID, PW, PhoneNumber) VALUES(?,?,?)";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guest.getGuestID());
            statement.setString(2, password);
            statement.setString(3, guest.getPhoneNumber());
            
            statement.executeUpdate();
            System.out.println("Insert success!");
        } catch (SQLException e) {
            System.out.println("Insert fail!");
            e.printStackTrace();
        }
    }
    
    // Edit guest.
    public boolean editGuest(GuestBO guest, String password) {
        boolean successEdited = false;
        String sql = "UPDATE GuestInfo SET PW = ?, PhoneNumber = ? WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, password);
            statement.setString(2, guest.getPhoneNumber());
            statement.setString(3, guest.getGuestID());
            
            int affectedRows = statement.executeUpdate();
            successEdited = affectedRows > 0;
            
            if (successEdited) {
                System.out.println("Edit success!");
            } else {
                System.out.println("Edit fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return successEdited;
    }
    
    // Delete guest.
    public boolean deleteGuest(String guestID) {
        boolean successDelete = false;
        String sql = "DELETE FROM GuestInfo WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID);
            
            int affectedRows = statement.executeUpdate();
            successDelete = affectedRows > 0;
            
            if (successDelete) {
                System.out.println("Delete success!");
            } else {
                System.out.println("Delete fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return successDelete;
    }
}
