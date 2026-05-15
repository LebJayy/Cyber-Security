package com.example.cybersecurity.cybersecurityassignment.servlet;

import com.example.cybersecurity.cybersecurityassignment.dao.UserDAO;
import com.example.cybersecurity.cybersecurityassignment.util.SecurityUtil;
import com.example.cybersecurity.cybersecurityassignment.util.TokenUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        String storedHash = dao.getPassword(username);

        if (storedHash != null &&
                SecurityUtil.verifyPassword(password, storedHash)) {

            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) oldSession.invalidate();

            HttpSession session = req.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("token", TokenUtil.generateToken(username));

            req.setAttribute("success", "Login successful.");

            req.getRequestDispatcher("dashboard.jsp")
                    .forward(req, res);

        } else {

            req.setAttribute("error", "Login failed: invalid username or password.");

            try {
                req.getRequestDispatcher("login.jsp")
                        .forward(req, res);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}