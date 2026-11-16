package com.studenttracker.controller;

import com.studenttracker.dao.SkillDAO;
import com.studenttracker.model.Skill;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/SkillServlet")
public class SkillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("studentId");

        SkillDAO dao = new SkillDAO();

        String action = request.getParameter("action");

        if ("delete".equals(action)) {

            int skillId = Integer.parseInt(request.getParameter("id"));

            dao.deleteSkill(skillId);

            response.sendRedirect("SkillServlet");
            return;
        }

        if ("edit".equals(action)) {

            int skillId = Integer.parseInt(request.getParameter("id"));

            Skill skill = dao.getSkillById(skillId);

            request.setAttribute("editSkill", skill);
        }

        List<Skill> skills = dao.getSkillsByStudentId(studentId);

        request.setAttribute("skills", skills);

        request.getRequestDispatcher("skills.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("studentId");

        String action = request.getParameter("action");

        SkillDAO dao = new SkillDAO();

        if ("update".equals(action)) {

            int skillId = Integer.parseInt(request.getParameter("skillId"));
            String skillName = request.getParameter("skillName");
            String skillLevel = request.getParameter("skillLevel");

            Skill skill = new Skill();
            skill.setSkillId(skillId);
            skill.setStudentId(studentId);
            skill.setSkillName(skillName);
            skill.setSkillLevel(skillLevel);

            dao.updateSkill(skill);

        } else {

            String skillName = request.getParameter("skillName");
            String skillLevel = request.getParameter("skillLevel");

            Skill skill = new Skill(studentId, skillName, skillLevel);

            dao.addSkill(skill);
        }

        response.sendRedirect("SkillServlet");
    }
}