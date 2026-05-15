package com.example.cybersecurity.cybersecurityassignment.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI();

        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null &&
                session.getAttribute("username") != null);

        boolean loginRequest =
                path.endsWith("login.jsp") ||
                        path.endsWith("login") ||
                        path.endsWith("register.jsp") ||
                        path.endsWith("register");

        if (!loggedIn && !loginRequest) {
            res.sendRedirect("login.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}