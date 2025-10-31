<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- Guest Sign Up -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/signup.css">
    <title>Sign Up - Portfolio</title>
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
        <form action="SignupServlet" method="post">
            <div class="signup-header">
                <h2>Welcome to the Portfolio!</h2>
                <p>Fill out the form to sign up.</p>
            </div>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <!-- Guest ID -->
            <section class="textfield-container">
                <label for="GuestID" class="textfield-labels">Guest ID:</label>
                <input type="text" id="GuestID" name="GuestID" class="textfields" placeholder=" " required>
            </section>
            
            <!-- Phone Number -->
            <section class="textfield-container">
                <label for="PhoneNumber" class="textfield-labels">Phone Number:</label>
                <input type="text" id="PhoneNumber" name="PhoneNumber" class="textfields" placeholder=" ">
            </section>
            
            <!-- PW -->
            <section class="textfield-container">
                <label for="PW" class="textfield-labels">PW:</label>
                <input type="password" id="PW" name="PW" class="textfields" placeholder="" required>
            </section>
            
            <!-- Confirm PW -->
            <section class="textfield-container">
                <label for="confirmPW" class="textfield-labels">Confirm PW:</label>
                <input type="password" id="confirm-password" name="confirmPW" class="textfields" placeholder="" required>
            </section>
           
            <section class="textfield-checkbox">
                <div>
                    <p>By continuing, you submit to my <a href="" class="auth-link">Terms</a> & <a href="" class="auth-link">Priv Policy</a></p>
                </div>
            </section>
            
            <section class="submit">
                <input type="submit" value="Sign Up" id="sign-up">
            </section>
            
            <div class="bottom-link">
                <a href="login.jsp" class="auth-link">Login Here</a>
            </div>
        </form>
        
        <script> 
        (function(){
            function verifyPW() {
                var PW = document.getElementById('PW');
                var confirmPW = document.getElementById('confirmPW');
                
                if (PW.value !== confirmPW.value) {
                    confirmPW.setCustomValidity("PWs different!");
                } else {
                    confirmPW.setCustomValidity("");
                }
            }
            
            var PW = document.getElementById('PW');
            var confirmPW = document.getElementById('confirmPW');
            
            if (PW && confirmPW) {
                PW.addEventListener('change', verifyPW);
                confirmPW.addEventListener('keyup', verifyPW);
            }
        })();
        </script>
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