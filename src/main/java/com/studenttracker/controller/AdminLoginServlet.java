package com.studenttracker.controller;

import com.studenttracker.dao.AdminDAO;
import com.studenttracker.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = new Admin(username, password);

        AdminDAO dao = new AdminDAO();

        Admin result = dao.login(admin);

        if (result != null) {

            HttpSession session = request.getSession();

            session.setAttribute("adminId", result.getAdminId());
            session.setAttribute("adminUsername", result.getUsername());

            response.sendRedirect("adminDashboard.jsp");

        } else {

            response.sendRedirect("adminLogin.jsp?error=1");
        }
    }
}