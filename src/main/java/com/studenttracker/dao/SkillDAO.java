package com.studenttracker.dao;

import com.studenttracker.model.Skill;
import com.studenttracker.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SkillDAO {

    public boolean addSkill(Skill skill) {

        String sql = "INSERT INTO skills "
                   + "(student_id, skill_name, skill_level) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, skill.getStudentId());
            ps.setString(2, skill.getSkillName());
            ps.setString(3, skill.getSkillLevel());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error adding skill: " + e.getMessage());
            return false;
        }
    }

    public List<Skill> getSkillsByStudentId(int studentId) {

        List<Skill> skills = new ArrayList<>();

        String sql = "SELECT * FROM skills WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Skill skill = new Skill();

                skill.setSkillId(rs.getInt("skill_id"));
                skill.setStudentId(rs.getInt("student_id"));
                skill.setSkillName(rs.getString("skill_name"));
                skill.setSkillLevel(rs.getString("skill_level"));

                skills.add(skill);
            }

        } catch (SQLException e) {
            System.out.println("Error getting skills: " + e.getMessage());
        }

        return skills;
    }

    public Skill getSkillById(int skillId) {

        String sql = "SELECT * FROM skills WHERE skill_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, skillId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Skill skill = new Skill();

                skill.setSkillId(rs.getInt("skill_id"));
                skill.setStudentId(rs.getInt("student_id"));
                skill.setSkillName(rs.getString("skill_name"));
                skill.setSkillLevel(rs.getString("skill_level"));

                return skill;
            }

        } catch (SQLException e) {
            System.out.println("Error getting skill: " + e.getMessage());
        }

        return null;
    }

    public boolean updateSkill(Skill skill) {

        String sql = "UPDATE skills SET skill_name = ?, "
                   + "skill_level = ? WHERE skill_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, skill.getSkillName());
            ps.setString(2, skill.getSkillLevel());
            ps.setInt(3, skill.getSkillId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error updating skill: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteSkill(int skillId) {

        String sql = "DELETE FROM skills WHERE skill_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, skillId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error deleting skill: " + e.getMessage());
            return false;
        }
    }
}