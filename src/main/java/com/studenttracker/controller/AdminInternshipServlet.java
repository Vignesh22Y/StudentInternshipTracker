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

@WebServlet("/AdminInternshipServlet")
public class AdminInternshipServlet extends HttpServlet {

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

        InternshipDAO dao = new InternshipDAO();

        String action =
                request.getParameter("action");

        if ("delete".equals(action)) {

            int internshipId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            dao.deleteInternship(internshipId);

            response.sendRedirect(
                    "AdminInternshipServlet"
            );

            return;
        }

        if ("edit".equals(action)) {

            int internshipId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            Internship internship =
                    dao.getInternshipById(internshipId);

            request.setAttribute(
                    "editInternship",
                    internship
            );
        }

        List<Internship> internships =
                dao.getAllInternships();

        request.setAttribute(
                "internships",
                internships
        );

        request.getRequestDispatcher(
                "adminInternships.jsp"
        ).forward(request, response);
    }

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

        InternshipDAO dao =
                new InternshipDAO();

        String action =
                request.getParameter("action");

        if ("update".equals(action)) {

            int internshipId =
                    Integer.parseInt(
                            request.getParameter(
                                    "internshipId"
                            )
                    );

            String company =
                    request.getParameter("company");

            String title =
                    request.getParameter("title");

            String requiredSkills =
                    request.getParameter(
                            "requiredSkills"
                    );

            String duration =
                    request.getParameter("duration");

            String description =
                    request.getParameter(
                            "description"
                    );

            Internship internship =
                    new Internship(
                            company,
                            title,
                            requiredSkills,
                            duration,
                            description
                    );

            internship.setInternshipId(
                    internshipId
            );

            dao.updateInternship(
                    internship
            );
        }

        response.sendRedirect(
                "AdminInternshipServlet"
        );
    }
}