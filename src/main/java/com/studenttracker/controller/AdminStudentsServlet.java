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
import java.util.List;

@WebServlet("/AdminStudentsServlet")
public class AdminStudentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        StudentDAO dao = new StudentDAO();

        List<Student> students =
                dao.getAllStudents();

        request.setAttribute(
                "students",
                students
        );

        request.getRequestDispatcher(
                "adminStudents.jsp"
        ).forward(request, response);
    }
}