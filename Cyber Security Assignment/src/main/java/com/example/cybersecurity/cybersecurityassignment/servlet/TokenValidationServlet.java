package com.example.cybersecurity.cybersecurityassignment.servlet;

import com.example.cybersecurity.cybersecurityassignment.util.TokenUtil;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class TokenValidationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String token = req.getParameter("token");

        res.setContentType("text/plain");

        if (token == null || token.isEmpty()) {
            res.getWriter().println("TOKEN MISSING");
            return;
        }

        boolean valid = TokenUtil.validateToken(token);

        if (valid) {
            String user = TokenUtil.extractUser(token);

            res.getWriter().println("TOKEN VALID");
            res.getWriter().println("USER: " + user);
            res.getWriter().println("ACCESS GRANTED");
        } else {
            res.getWriter().println("INVALID OR EXPIRED TOKEN");
            res.getWriter().println("ACCESS DENIED");
        }
    }
}
