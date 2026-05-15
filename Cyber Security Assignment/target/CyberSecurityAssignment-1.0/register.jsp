<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 15/05/26
  Time: 00:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body class="admin-body">

<div class="admin-login-wrapper">

    <div class="admin-login-card">

        <div class="admin-login-title">
            <i class="fa-solid fa-user-plus"></i>
            Register
        </div>

        <form action="register" method="post">

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-input" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-input" required>
            </div>

            <button type="submit" class="btn btn-primary btn-full">
                Register
            </button>

        </form>

        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");

            if (error != null) {
        %>
        <p class="login-error-text"><%= error %></p>
        <%
            }

            if (success != null) {
        %>
        <p class="login-success-text"><%= success %></p>
        <%
            }
        %>

        <p style="text-align:center; margin-top:16px; font-size:0.9rem;">
            Already have an account?
            <a href="login.jsp">Login</a>
        </p>

    </div>

</div>

</body>
</html>