package com.studenttracker.controller;

import com.studenttracker.dao.StudentDAO;
import com.studenttracker.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String rollNo = request.getParameter("rollNo");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String course = request.getParameter("course");
        int semester = Integer.parseInt(request.getParameter("semester"));

        Student student = new Student(
                name, rollNo, email, password, course, semester
        );

        StudentDAO dao = new StudentDAO();

        if (dao.addStudent(student)) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }
}