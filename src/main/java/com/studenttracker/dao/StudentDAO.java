package com.studenttracker.dao;

import com.studenttracker.model.Student;
import com.studenttracker.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public boolean addStudent(Student student) {

        String sql = "INSERT INTO student "
                   + "(name, roll_no, email, password, course, semester) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, student.getName());
            ps.setString(2, student.getRollNo());
            ps.setString(3, student.getEmail());
            ps.setString(4, student.getPassword());
            ps.setString(5, student.getCourse());
            ps.setInt(6, student.getSemester());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println(
                    "Error adding student: " + e.getMessage()
            );

            return false;
        }
    }

    public Student getStudentById(int studentId) {

        String sql = "SELECT * FROM student "
                   + "WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Student student = new Student();

                student.setStudentId(
                        rs.getInt("student_id")
                );

                student.setName(
                        rs.getString("name")
                );

                student.setRollNo(
                        rs.getString("roll_no")
                );

                student.setEmail(
                        rs.getString("email")
                );

                student.setPassword(
                        rs.getString("password")
                );

                student.setCourse(
                        rs.getString("course")
                );

                student.setSemester(
                        rs.getInt("semester")
                );

                return student;
            }

        } catch (SQLException e) {

            System.out.println(
                    "Error getting student: " + e.getMessage()
            );
        }

        return null;
    }

    public List<Student> getAllStudents() {

        List<Student> students = new ArrayList<>();

        String sql = "SELECT student_id, name, roll_no, "
                   + "email, course, semester "
                   + "FROM student "
                   + "ORDER BY student_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Student student = new Student();

                student.setStudentId(
                        rs.getInt("student_id")
                );

                student.setName(
                        rs.getString("name")
                );

                student.setRollNo(
                        rs.getString("roll_no")
                );

                student.setEmail(
                        rs.getString("email")
                );

                student.setCourse(
                        rs.getString("course")
                );

                student.setSemester(
                        rs.getInt("semester")
                );

                students.add(student);
            }

        } catch (SQLException e) {

            System.out.println(
                    "Error getting all students: "
                    + e.getMessage()
            );
        }

        return students;
    }
}