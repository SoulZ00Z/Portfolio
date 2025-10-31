/* Signup Servlet */
package com.portfolio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private String URL;

    @Override
    public void init() throws ServletException {
        super.init();
        URL = "jdbc:ucanaccess://C:/Users/joshu/Desktop/PortfolioNB/Portfolio.accdb";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String guestId = request.getParameter("GuestID");
        String password = request.getParameter("PW");
        String phoneNumber = request.getParameter("PhoneNumber");
        
        if (guestId == null || guestId.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Guest ID & PW required.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        try {
            try (Connection conn = DriverManager.getConnection(URL)) {
                String checkSql = "SELECT 1 FROM GuestInfo WHERE GuestID = ?";
                try (PreparedStatement check = conn.prepareStatement(checkSql)) {
                    check.setString(1, guestId.trim());
                    try (ResultSet rs = check.executeQuery()) {
                        if (rs.next()) {
                            request.setAttribute("errorMessage", "Guest ID exists!");
                            request.getRequestDispatcher("signup.jsp").forward(request, response);
                            return;
                        }
                    }
                }
                String insertSql = "INSERT INTO GuestInfo (GuestID, PW, PhoneNumber) VALUES (?, ?, ?)";
                try (PreparedStatement ins = conn.prepareStatement(insertSql)) {
                    ins.setString(1, guestId.trim());
                    ins.setString(2, password);
                    if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
                        ins.setString(3, null);
                    } else {
                        ins.setString(3, phoneNumber.trim());
                    }
                    ins.executeUpdate();
                }
            }
            request.setAttribute("successMessage", "Success! Time to login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Signup error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error trying to sign up: " + e.getMessage());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
    
    // Redirect to signup page.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("signup.jsp");
    }
}
