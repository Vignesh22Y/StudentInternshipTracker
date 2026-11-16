package com.studenttracker.dao;

import com.studenttracker.model.Internship;
import com.studenttracker.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InternshipDAO {

    public boolean addInternship(Internship internship) {

        String sql = "INSERT INTO internship "
                   + "(company, title, required_skills, duration, description) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, internship.getCompany());
            ps.setString(2, internship.getTitle());
            ps.setString(3, internship.getRequiredSkills());
            ps.setString(4, internship.getDuration());
            ps.setString(5, internship.getDescription());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error adding internship: " + e.getMessage()
            );

            return false;
        }
    }

    public List<Internship> getAllInternships() {

        List<Internship> internships = new ArrayList<>();

        String sql = "SELECT * FROM internship "
                   + "ORDER BY internship_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Internship internship = new Internship();

                internship.setInternshipId(
                        rs.getInt("internship_id")
                );

                internship.setCompany(
                        rs.getString("company")
                );

                internship.setTitle(
                        rs.getString("title")
                );

                internship.setRequiredSkills(
                        rs.getString("required_skills")
                );

                internship.setDuration(
                        rs.getString("duration")
                );

                internship.setDescription(
                        rs.getString("description")
                );

                internships.add(internship);
            }

        } catch (Exception e) {

            System.out.println(
                    "Error getting internships: "
                    + e.getMessage()
            );
        }

        return internships;
    }

    public Internship getInternshipById(int internshipId) {

        String sql = "SELECT * FROM internship "
                   + "WHERE internship_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, internshipId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Internship internship = new Internship();

                internship.setInternshipId(
                        rs.getInt("internship_id")
                );

                internship.setCompany(
                        rs.getString("company")
                );

                internship.setTitle(
                        rs.getString("title")
                );

                internship.setRequiredSkills(
                        rs.getString("required_skills")
                );

                internship.setDuration(
                        rs.getString("duration")
                );

                internship.setDescription(
                        rs.getString("description")
                );

                return internship;
            }

        } catch (Exception e) {

            System.out.println(
                    "Error getting internship: "
                    + e.getMessage()
            );
        }

        return null;
    }

    public boolean updateInternship(Internship internship) {

        String sql = "UPDATE internship SET "
                   + "company = ?, "
                   + "title = ?, "
                   + "required_skills = ?, "
                   + "duration = ?, "
                   + "description = ? "
                   + "WHERE internship_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, internship.getCompany());
            ps.setString(2, internship.getTitle());
            ps.setString(3, internship.getRequiredSkills());
            ps.setString(4, internship.getDuration());
            ps.setString(5, internship.getDescription());
            ps.setInt(6, internship.getInternshipId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error updating internship: "
                    + e.getMessage()
            );

            return false;
        }
    }

    public boolean deleteInternship(int internshipId) {

        String sql = "DELETE FROM internship "
                   + "WHERE internship_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, internshipId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error deleting internship: "
                    + e.getMessage()
            );

            return false;
        }
    }
}