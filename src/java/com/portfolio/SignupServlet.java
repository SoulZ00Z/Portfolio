/* Signup Servlet */
package com.portfolio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private GuestDAO guestDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // DAOs will be initialized lazily.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String guestId = request.getParameter("GuestID");
        String password = request.getParameter("PW");
        String confirmPassword = request.getParameter("confirmPW");
        String phoneNumber = request.getParameter("PhoneNumber");
        
        // Check fields.
        if (guestId == null || guestId.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Guest ID & PW required.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        // PW confirm.
        if (confirmPassword == null || !password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "PWs different!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        try {
            // Initialize GuestDAO only when needed.
            if (guestDAO == null) {
                guestDAO = new GuestDAO();
            }
            
            // Check if guest exists.
            if (guestDAO.guestIDExists(guestId.trim())) {
                request.setAttribute("errorMessage", "Guest ID exists!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }
            
            // Insert guest (parameters match database columns: GuestID, PW, PhoneNumber)
            String phoneNum = (phoneNumber != null && !phoneNumber.trim().isEmpty()) ? phoneNumber.trim() : null;
            guestDAO.insertGuest(guestId.trim(), password, phoneNum);
            
            // Set success message in session for redirect
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Success! Time to login.");
            response.sendRedirect("login.jsp");
            return;
            
        } catch (Exception e) {
            System.err.println("Signup error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error trying to sign up: " + e.getMessage());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
    
    // Redirect to Signup page.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("signup.jsp");
    }
}
