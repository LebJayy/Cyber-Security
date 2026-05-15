package com.example.cybersecurity.cybersecurityassignment.util;


import java.sql.*;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {

    private static Connection conn;

    public static Connection getConnection() {

        try {
            if (conn == null || conn.isClosed()) {

                Properties props = new Properties();
                InputStream input = DBConnection.class
                        .getClassLoader()
                        .getResourceAsStream("db.properties");

                props.load(input);

                Class.forName(props.getProperty("db.driver"));

                conn = DriverManager.getConnection(
                        props.getProperty("db.url"),
                        props.getProperty("db.user"),
                        props.getProperty("db.password")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
