<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 15/05/26
  Time: 01:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String token = (String) session.getAttribute("token");
    String username = (String) session.getAttribute("username");

    if (token == null || username == null) {
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
    <title>Token View - CyberNova</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body class="admin-body">

<!-- TOP BAR -->
<div class="admin-topbar">
    <h1>Authentication Token</h1>

    <div class="admin-topbar-right">
        <span class="admin-user">User: <%= username %></span>
        <span class="admin-user-icon">
            <i class="fa-solid fa-key"></i>
        </span>
    </div>
</div>

<!-- CONTENT -->
<div class="admin-content">

    <div class="dashboard-stats">

        <div class="dash-stat-card">
            <span class="dash-stat-label">User</span>
            <span class="dash-stat-number" style="font-size:1.2rem;">
                <%= username %>
            </span>
        </div>

        <div class="dash-stat-card">
            <span class="dash-stat-label">Token Status</span>
            <span class="dash-stat-number" style="font-size:1.2rem; color:#10B981;">
                VALID
            </span>
        </div>

        <div class="dash-stat-card">
            <span class="dash-stat-label">Type</span>
            <span class="dash-stat-number" style="font-size:1.2rem;">
                JWT
            </span>
        </div>

        <div class="dash-stat-card">
            <span class="dash-stat-label">Security</span>
            <span class="dash-stat-number dash-stat-growth">
                SIGNED
            </span>
        </div>

    </div>

    <!-- TOKEN CARD -->
    <div class="chart-card">

        <h3>Generated JWT Token</h3>

        <p style="color:#6B7280; margin-bottom:15px;">
            This token is used for authentication and session validation.
        </p>

        <textarea
                style="
                width:100%;
                height:220px;
                padding:12px;
                border:2px solid #D1D5DB;
                border-radius:8px;
                font-family:monospace;
                font-size:0.85rem;
                resize:none;
                background:#F9FAFB;
            "
                readonly
        ><%= token %></textarea>

        <p style="margin-top:15px; font-size:0.85rem; color:#6B7280; line-height:1.6;">
            ⚠ This token should be treated as sensitive.
            It contains encoded authentication claims and is digitally signed to prevent tampering.
        </p>

        <div style="margin-top:20px; display:flex; gap:10px; flex-wrap:wrap;">

            <a href="dashboard.jsp" class="btn btn-primary">
                Back to Dashboard
            </a>

            <a href="logout.jsp" class="btn btn-danger">
                Logout
            </a>

        </div>

    </div>

</div>

</body>
</html>