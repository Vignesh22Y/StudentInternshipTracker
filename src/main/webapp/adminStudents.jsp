<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studenttracker.model.Student" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Student> students =
            (List<Student>) request.getAttribute("students");
%>

<!DOCTYPE html>
<html>

<head>
    <title>Registered Students</title>
</head>

<body style="margin:0;
             font-family:Arial, sans-serif;
             background:#f4f7f2;">

    <!-- NAVBAR -->

    <div style="background:#ffffff;
                padding:16px 40px;
                display:flex;
                justify-content:space-between;
                align-items:center;
                box-shadow:0 2px 8px rgba(0,0,0,0.08);">

        <div style="font-size:24px;
                    font-weight:bold;
                    color:#14532d;">

            Skill<span style="color:#16a34a;">Track</span>

        </div>

        <a href="adminDashboard.jsp"
           style="text-decoration:none;
                  color:#166534;
                  font-weight:bold;">

            Admin Dashboard

        </a>

    </div>


    <!-- MAIN CONTENT -->

    <div style="width:92%;
                max-width:1100px;
                margin:45px auto;">

        <h1 style="text-align:center;
                   color:#14532d;
                   margin-bottom:8px;">

            Registered Students

        </h1>

        <p style="text-align:center;
                  color:#6b7280;
                  margin-bottom:30px;">

            View students registered in the system

        </p>


        <div style="background:#ffffff;
                    padding:25px;
                    border-radius:12px;
                    box-shadow:0 6px 18px rgba(0,0,0,0.08);">


            <%
                if (students == null || students.isEmpty()) {
            %>

                <p style="text-align:center;
                          color:#6b7280;
                          padding:25px;">

                    No students registered yet.

                </p>

            <%
                } else {
            %>


                <table style="width:100%;
                              border-collapse:collapse;">

                    <thead>

                        <tr style="background:#dcfce7;">

                            <th style="padding:12px;
                                       text-align:left;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Name
                            </th>

                            <th style="padding:12px;
                                       text-align:left;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Roll No
                            </th>

                            <th style="padding:12px;
                                       text-align:left;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Email
                            </th>

                            <th style="padding:12px;
                                       text-align:left;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Course
                            </th>

                            <th style="padding:12px;
                                       text-align:center;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Semester
                            </th>

                        </tr>

                    </thead>


                    <tbody>

                    <%
                        for (Student student : students) {
                    %>

                        <tr>

                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       color:#374151;">

                                <%= student.getName() %>

                            </td>


                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       color:#374151;">

                                <%= student.getRollNo() %>

                            </td>


                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       color:#374151;">

                                <%= student.getEmail() %>

                            </td>


                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       color:#374151;">

                                <%= student.getCourse() %>

                            </td>


                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       text-align:center;
                                       color:#374151;">

                                <%= student.getSemester() %>

                            </td>

                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>


            <%
                }
            %>

        </div>


        <a href="adminDashboard.jsp"
           style="display:block;
                  width:220px;
                  margin:25px auto 0;
                  text-align:center;
                  background:#16a34a;
                  color:white;
                  padding:11px;
                  text-decoration:none;
                  border-radius:6px;
                  font-weight:bold;">

            Back to Dashboard

        </a>

    </div>

</body>

</html>