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

@WebServlet("/AddInternshipServlet")
public class AddInternshipServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String company =
                request.getParameter("company");

        String title =
                request.getParameter("title");

        String requiredSkills =
                request.getParameter("requiredSkills");

        String duration =
                request.getParameter("duration");

        String description =
                request.getParameter("description");

        Internship internship =
                new Internship(
                        company,
                        title,
                        requiredSkills,
                        duration,
                        description
                );

        InternshipDAO dao =
                new InternshipDAO();

        if (dao.addInternship(internship)) {

            response.sendRedirect(
                    "adminInternships.jsp?success=1"
            );

        } else {

            response.sendRedirect(
                    "addInternship.jsp?error=1"
            );
        }
    }
}