package com.studenttracker.dao;

import com.studenttracker.model.Admin;
import com.studenttracker.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    public Admin login(Admin admin) {

        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Admin result = new Admin();

                result.setAdminId(rs.getInt("admin_id"));
                result.setUsername(rs.getString("username"));
                result.setPassword(rs.getString("password"));

                return result;
            }

        } catch (SQLException e) {
            System.out.println("Admin login error: " + e.getMessage());
        }

        return null;
    }
}