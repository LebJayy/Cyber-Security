package com.example.cybersecurity.cybersecurityassignment.model;


public class User {
    private String username;
    private String password;

    public User() {}

    public User(String u, String p) {
        this.username = u;
        this.password = p;
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }

    public void setUsername(String u) { this.username = u; }
    public void setPassword(String p) { this.password = p; }
}