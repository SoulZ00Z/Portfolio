<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Sportshub</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="login.css">
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
            <li style="margin: 0 15px;">
                <a href="login.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">LOGIN</a>
            </li>
        </ul>
    </nav>

    <main>
        <div class="login-header">
            <h1>Login</h1>
            <p>Welcome! Login to view info.</p>
        </div>
        
        <!-- Error/success messages. -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="success-message"><%= request.getAttribute("successMessage") %></div>
        <% } %>
        
        <form id="loginForm" action="LoginServlet" method="post">
            <section>
                <label class="textfield-labels" for="GuestID">Guest ID:</label>
                <div class="textfield-container">
                    <input type="text" id="GuestID" name="GuestID" class="textfields" required>
                </div>
            </section>
            
            <section>
                <label class="textfield-labels" for="PW">PW:</label>
                <div class="textfield-container">
                    <input type="password" id="PW" name="PW" class="textfields" required>
                </div>
            </section>
            
            <div class="submit">
                <input type="submit" value="Login">
            </div>
        </form>
        
        <div class="bottom-link">
            <p>New here? Sign Up! <a href="signup.jsp">Signup</a></p>
        </div>
    </main>
</body>
</html>
