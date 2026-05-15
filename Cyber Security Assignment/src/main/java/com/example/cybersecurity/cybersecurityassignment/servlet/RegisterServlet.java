package com.example.cybersecurity.cybersecurityassignment.servlet;

import com.example.cybersecurity.cybersecurityassignment.dao.UserDAO;
import com.example.cybersecurity.cybersecurityassignment.util.SecurityUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            req.setAttribute("error", "Username and password are required.");

            req.getRequestDispatcher("register.jsp")
                    .forward(req, res);
            return;
        }

        String hashedPassword = SecurityUtil.hashPassword(password);

        UserDAO dao = new UserDAO();
        boolean success = dao.register(username, hashedPassword);

        if (success) {

            req.setAttribute("success", "Registration successful. Please log in.");

            req.getRequestDispatcher("login.jsp")
                    .forward(req, res);

        } else {

            req.setAttribute("error", "User already exists.");

            req.getRequestDispatcher("register.jsp")
                    .forward(req, res);
        }
    }
}