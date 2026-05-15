package com.example.cybersecurity.cybersecurityassignment.dao;

import com.example.cybersecurity.cybersecurityassignment.util.DBConnection;

import java.sql.*;

public class UserDAO {

    public boolean register(String username, String password) {

        try {
            Connection con = DBConnection.getConnection();

            String check = "SELECT * FROM users WHERE username=?";
            PreparedStatement ps = con.prepareStatement(check);
            ps.setString(1, username);

            if (ps.executeQuery().next()) return false;

            String sql = "INSERT INTO users(username, password) VALUES (?,?)";
            PreparedStatement insert = con.prepareStatement(sql);

            insert.setString(1, username);
            insert.setString(2, password);

            insert.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public String getPassword(String username) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT password FROM users WHERE username=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) return rs.getString(1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}