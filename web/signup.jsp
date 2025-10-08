<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sign Up - Portfolio</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="signup.css">
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
        <div class="signup-header">
            <h1>Sign Up</h1>
            <p>Create a new account to get started.</p>
        </div>
        
        <!-- Error/Success messages. -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="success-message"><%= request.getAttribute("successMessage") %></div>
        <% } %>
        
        <form id="signupForm" action="SignupServlet" method="post">
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
            
            <section>
                <label class="textfield-labels" for="PhoneNumber">Phone Number:</label>
                <div class="textfield-container">
                    <input type="text" id="PhoneNumber" name="PhoneNumber" class="textfields">
                </div>
            </section>
            
            <div class="submit">
                <input type="submit" value="Sign Up">
            </div>
        </form>
        
        <div class="bottom-link">
            <p>Not new? <a href="login.jsp">Login here!</a></p>
        </div>
    </main>
</body>
</html>
