<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 15/05/26
  Time: 00:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String username = (String) session.getAttribute("username");
    String token = (String) session.getAttribute("token");

    if (username == null || token == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - CyberNova</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body class="admin-body">

<!-- TOP BAR -->
<div class="admin-topbar">
    <h1>Secure Dashboard</h1>

    <div class="admin-topbar-right">
        <span class="admin-user">Welcome, <%= username %></span>
        <span class="admin-user-icon">
            <i class="fa-solid fa-circle-user"></i>
        </span>
    </div>
</div>

<!-- CONTENT -->
<div class="admin-content">

    <!-- STATUS CARDS -->
    <div class="dashboard-stats">

        <div class="dash-stat-card">
            <span class="dash-stat-label">Login Status</span>
            <span class="dash-stat-number" style="font-size:1.2rem; color:#10B981;">
                SUCCESS
            </span>
        </div>

        <div class="dash-stat-card">
            <span class="dash-stat-label">User</span>
            <span class="dash-stat-number" style="font-size:1.2rem;">
                <%= username %>
            </span>
        </div>

        <div class="dash-stat-card">
            <span class="dash-stat-label">Session</span>
            <span class="dash-stat-number" style="font-size:1.2rem;">
                ACTIVE
            </span>
        </div>

        <div class="dash-stat-card">
            <span class="dash-stat-label">Security Level</span>
            <span class="dash-stat-number dash-stat-growth">
                HIGH
            </span>
        </div>

    </div>

    <!-- ACTION CARDS -->
    <div class="dashboard-charts">

        <!-- TOKEN + LOGOUT -->
        <div class="chart-card">
            <h3>Authentication</h3>

            <p style="color:#6B7280; margin-bottom:15px;">
                Manage your session securely
            </p>

            <a href="tokenView.jsp" class="btn btn-primary btn-full">
                View Token
            </a>

            <br><br>

            <a href="logout.jsp" class="btn btn-danger btn-full">
                Logout
            </a>
        </div>

        <!-- SECURITY INFO -->
        <div class="chart-card">
            <h3>Security Summary</h3>

            <p style="font-size:0.9rem; color:#374151; line-height:1.6;">
                ✔ Passwords hashed using secure algorithm<br>
                ✔ JWT token generated on login<br>
                ✔ Session protected via HttpSession<br>
                ✔ Unauthorized access blocked
            </p>
        </div>

        <!-- NAVIGATION -->
        <div class="chart-card">
            <h3>Navigation</h3>

            <a href="register.jsp" class="btn btn-outline btn-full">
                Go to Register
            </a>

            <br><br>

            <a href="login.jsp" class="btn btn-outline btn-full">
                Go to Login
            </a>
        </div>

    </div>

    <!-- FOOTER NOTE -->
    <div class="dashboard-footer-note">
        Secure session active for <strong><%= username %></strong>
    </div>

</div>

</body>
</html>