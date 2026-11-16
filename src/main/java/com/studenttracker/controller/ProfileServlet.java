package com.studenttracker.controller;

import com.studenttracker.dao.StudentDAO;
import com.studenttracker.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("studentId");

        StudentDAO dao = new StudentDAO();
        Student student = dao.getStudentById(studentId);

        if (student != null) {
            request.setAttribute("student", student);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("dashboard.jsp");
        }
    }
}