<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studenttracker.model.Internship" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Internship> internships =
            (List<Internship>) request.getAttribute("internships");

    Internship editInternship =
            (Internship) request.getAttribute("editInternship");
%>

<!DOCTYPE html>
<html>

<head>
    <title>Manage Internships</title>
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


    <!-- MAIN -->

    <div style="width:92%;
                max-width:1150px;
                margin:45px auto;">

        <h1 style="text-align:center;
                   color:#14532d;
                   margin-bottom:8px;">

            Manage Internships

        </h1>

        <p style="text-align:center;
                  color:#6b7280;
                  margin-bottom:35px;">

            View and manage available internship opportunities

        </p>


        <!-- EDIT FORM -->

        <%
            if (editInternship != null) {
        %>

        <div style="background:#ffffff;
                    padding:25px;
                    border-radius:12px;
                    box-shadow:0 6px 18px rgba(0,0,0,0.08);
                    margin-bottom:30px;">

            <h3 style="color:#14532d;
                       margin-top:0;">

                Edit Internship

            </h3>

            <form action="AdminInternshipServlet"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="update">

                <input type="hidden"
                       name="internshipId"
                       value="<%= editInternship.getInternshipId() %>">


                <input type="text"
                       name="company"
                       value="<%= editInternship.getCompany() %>"
                       placeholder="Company"
                       required
                       style="padding:10px;
                              margin:5px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <input type="text"
                       name="title"
                       value="<%= editInternship.getTitle() %>"
                       placeholder="Title"
                       required
                       style="padding:10px;
                              margin:5px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <input type="text"
                       name="requiredSkills"
                       value="<%= editInternship.getRequiredSkills() %>"
                       placeholder="Required Skills"
                       required
                       style="padding:10px;
                              margin:5px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <input type="text"
                       name="duration"
                       value="<%= editInternship.getDuration() %>"
                       placeholder="Duration"
                       required
                       style="padding:10px;
                              margin:5px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <input type="text"
                       name="description"
                       value="<%= editInternship.getDescription() %>"
                       placeholder="Description"
                       required
                       style="padding:10px;
                              margin:5px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <input type="submit"
                       value="Update Internship"
                       style="background:#16a34a;
                              color:white;
                              border:none;
                              padding:10px 18px;
                              margin:5px;
                              border-radius:6px;
                              font-weight:bold;">

            </form>

        </div>

        <%
            }
        %>


        <!-- INTERNSHIP TABLE -->

        <div style="background:#ffffff;
                    padding:25px;
                    border-radius:12px;
                    box-shadow:0 6px 18px rgba(0,0,0,0.08);">

            <table style="width:100%;
                          border-collapse:collapse;">

                <thead>

                    <tr style="background:#dcfce7;">

                        <th style="padding:12px;
                                   text-align:left;
                                   color:#166534;">
                            Company
                        </th>

                        <th style="padding:12px;
                                   text-align:left;
                                   color:#166534;">
                            Title
                        </th>

                        <th style="padding:12px;
                                   text-align:left;
                                   color:#166534;">
                            Required Skills
                        </th>

                        <th style="padding:12px;
                                   text-align:left;
                                   color:#166534;">
                            Duration
                        </th>

                        <th style="padding:12px;
                                   text-align:left;
                                   color:#166534;">
                            Description
                        </th>

                        <th style="padding:12px;
                                   text-align:center;
                                   color:#166534;">
                            Action
                        </th>

                    </tr>

                </thead>


                <tbody>

                <%
                    if (internships != null) {

                        for (Internship internship :
                                internships) {
                %>

                    <tr>

                        <td style="padding:12px;
                                   border-bottom:1px solid #e5e7eb;">

                            <%= internship.getCompany() %>

                        </td>

                        <td style="padding:12px;
                                   border-bottom:1px solid #e5e7eb;">

                            <%= internship.getTitle() %>

                        </td>

                        <td style="padding:12px;
                                   border-bottom:1px solid #e5e7eb;">

                            <%= internship.getRequiredSkills() %>

                        </td>

                        <td style="padding:12px;
                                   border-bottom:1px solid #e5e7eb;">

                            <%= internship.getDuration() %>

                        </td>

                        <td style="padding:12px;
                                   border-bottom:1px solid #e5e7eb;">

                            <%= internship.getDescription() %>

                        </td>

                        <td style="padding:12px;
                                   border-bottom:1px solid #e5e7eb;
                                   text-align:center;">

                            <a href="AdminInternshipServlet?action=edit&id=<%= internship.getInternshipId() %>"
                               style="background:#dcfce7;
                                      color:#166534;
                                      padding:6px 10px;
                                      text-decoration:none;
                                      border-radius:5px;
                                      margin-right:5px;">

                                Edit

                            </a>

                            <a href="AdminInternshipServlet?action=delete&id=<%= internship.getInternshipId() %>"
                               onclick="return confirm('Delete this internship?');"
                               style="background:#fee2e2;
                                      color:#b91c1c;
                                      padding:6px 10px;
                                      text-decoration:none;
                                      border-radius:5px;">

                                Delete

                            </a>

                        </td>

                    </tr>

                <%
                        }
                    }
                %>

                </tbody>

            </table>

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