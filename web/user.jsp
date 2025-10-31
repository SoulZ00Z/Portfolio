<!DOCTYPE html>
<html lang="en">
<head>
    <title>User - Portfolio</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="CSS/user.css">
</head>
<body style="background-color: #f0f0f0;">
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
                <a href="user.jsp" style="text-decoration: none; color: white; font-size: 1.2em;">USER</a>
            </li>
            <li style="margin: 0 15px;">
                <a href="LogoutServlet" style="text-decoration: none; color: white; font-size: 1.2em;">LOGOUT</a>
            </li>
        </ul>
    </nav>

    <main>
        <div class="user-container">
            <div class="user-header">
                <h1>Welcome to Portfolio!</h1>
                <p>You are successfully logged in.</p>
            </div>
            
            <div class="user-info">
                <h3>Guest Info</h3>
                <p><strong>Guest ID:</strong> <%= session.getAttribute("user") %></p>
                <p><strong>Phone Number:</strong> <%= session.getAttribute("PhoneNumber") %></p>
                <p><strong>PW:</strong> <%= session.getAttribute("PW") %></p>
            </div>
            
            <div style="text-align: center;">
                <a href="LogoutServlet" class="logout-btn">Logout</a>
            </div>
        </div>
    </main>
</body>
</html>
