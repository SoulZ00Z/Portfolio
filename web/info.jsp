<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    com.portfolio.GuestBO guest = (com.portfolio.GuestBO) session.getAttribute("guest");
    boolean showGuestTab = (isLoggedIn != null && isLoggedIn && guest != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="CSS/info.css">
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
            <% if (showGuestTab) { %>
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
        
        

    
    
   </main>
	
	<footer>
	</footer>
    <script src="JS/script.js"></script>
</body>
</html>