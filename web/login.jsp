<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- Guest Login -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/login.css">
    <title>Login - Portfolio</title>
</head>
<body>
    <nav>
        <ul style="list-style: none; margin: 0; padding: 0; display: flex; justify-content: center; background-color: #333;">
            <li style="margin: 0 15px;">
                <a href="index.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">HOME</a>
            </li>
            <li style="margin: 0 15px;">
                <a href="project.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">PROJECTS</a>
            </li>
            <li style="margin: 0 15px;">
                <a href="info.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">INFO</a>
            </li>
            <% 
                Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
                com.portfolio.GuestBO guest = (com.portfolio.GuestBO) session.getAttribute("guest");
                boolean showGuest = (isLoggedIn != null && isLoggedIn && guest != null);
                if (showGuest) { 
            %>
            <li style="margin: 0 15px;">
                <a href="guest.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">GUEST</a>
            </li>
            <li style="margin: 0 15px;">
                <a href="LogoutServlet" style="text-decoration: none; color: white; font-size: 1.2em;">LOGOUT</a>
            </li>
            <% } else { %>
            <li style="margin: 0 15px;">
                <a href="login.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">LOGIN</a>
            </li>
            <% } %>
        </ul>
    </nav>

    <main>
        <form action="LoginServlet" method="post">
            <div class="login-header">
                <h2>Login</h2>
                <p>or <a href="signup.jsp" class="auth-link">Sign Up</a></p>
            </div>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <% 
                String successMessage = (String) session.getAttribute("successMessage");
                if (successMessage != null) {
                    session.removeAttribute("successMessage");
            %>
                <div class="success-message">
                    <%= successMessage %>
                </div>
            <% } %>
            
            <section class="textfield-container">
                <label for="GuestID" class="textfield-labels">Guest ID:</label>
                <input type="text" id="GuestID" name="GuestID" class="textfields" placeholder=" " required>
            </section>
            
            <section class="textfield-container">
                <label for="PW" class="textfield-labels">PW:</label>
                <input type="password" id="PW" name="PW" class="textfields" placeholder=" " required>
            </section>
            
            <section class="submit">
                <input type="submit" value="Login" id="login">
            </section>
            
            <div class="bottom-link">
                <a href="" class="auth-link">Forgot PW?</a>
            </div>
        </form>
    </main>
    
    <footer>
        <section>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </section>
        <section>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </section>
    </footer>
</body>
</html>
