package com.studenttracker.controller;

import com.studenttracker.thread.InternshipCheckThread;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ThreadDemoServlet")
public class ThreadDemoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        InternshipCheckThread thread1 =
                new InternshipCheckThread("Internship check");

        InternshipCheckThread thread2 =
                new InternshipCheckThread("Skill check");

        InternshipCheckThread thread3 =
                new InternshipCheckThread("Dashboard update");

        thread1.setName("Internship-Thread");
        thread2.setName("Skill-Thread");
        thread3.setName("Dashboard-Thread");

        thread1.start();
        thread2.start();
        thread3.start();

        try {
            thread1.join();
            thread2.join();
            thread3.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        request.setAttribute("result1", thread1.getResult());
        request.setAttribute("result2", thread2.getResult());
        request.setAttribute("result3", thread3.getResult());

        request.getRequestDispatcher("threadDemo.jsp")
               .forward(request, response);
    }
}