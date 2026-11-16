package com.studenttracker.controller;

import com.studenttracker.dao.InternshipDAO;
import com.studenttracker.model.Internship;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/InternshipServlet")
public class InternshipServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        InternshipDAO dao = new InternshipDAO();
        List<Internship> internships = dao.getAllInternships();

        request.setAttribute("internships", internships);

        request.getRequestDispatcher("internships.jsp").forward(request, response);
    }
}