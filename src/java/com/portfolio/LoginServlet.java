/* Login Servlet */
package com.portfolio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private String URL;

    @Override
    public void init() throws ServletException {
        super.init();
        URL = "jdbc:ucanaccess://C:/Users/joshu/Desktop/PortfolioNB/Portfolio.accdb";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String GuestId = request.getParameter("GuestID");
        String PW = request.getParameter("PW");
        
        if (GuestId == null || GuestId.trim().isEmpty() || 
            PW == null || PW.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please fill in every field.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        try {
            HttpSession session = request.getSession();

            try (Connection conn = DriverManager.getConnection(URL)) {
                String sql = "SELECT GuestID FROM GuestInfo WHERE GuestID = ? AND PW = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, GuestId.trim());
                    ps.setString(2, PW);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            session.setAttribute("user", GuestId.trim());
                            session.setAttribute("PW", PW);
                            response.sendRedirect("user.jsp");
                        } else {
                            request.setAttribute("errorMessage", "Invalid GuestID or PW, please try again.");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("Login error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error logging in! " + e.getMessage() + " Check your input.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
