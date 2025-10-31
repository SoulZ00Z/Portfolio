/* Login Servlet */
package com.portfolio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private GuestDAO guestDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // DAOs will be initialized lazily when needed to avoid database connection issues.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters.
        String GuestID = request.getParameter("GuestID");
        String Password = request.getParameter("PW");
        
        // See if input field is empty.
        if (GuestID == null || GuestID.trim().isEmpty() || 
            Password == null || Password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please fill in every field.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        try {
            HttpSession session = request.getSession();
            
            // Initialize GuestDAO only when needed.
            if (guestDAO == null) {
                guestDAO = new GuestDAO();
            }
            
            // Verify guest info.
            GuestBO guest = guestDAO.verifyGuest(GuestID.trim(), Password.trim());
            
            if (guest != null) {
                // Guest login success!
                session.setAttribute("guest", guest);
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("userType", "guest");
                response.sendRedirect("guest.jsp");
            } else {
                // Guest login failed!
                request.setAttribute("errorMessage", "Invalid Guest ID or Password, please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            System.err.println("Login error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error trying to login: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    // Redirect to login page.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
