<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studenttracker.model.Internship" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Internship> internships =
            (List<Internship>) request.getAttribute("internships");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Internships</title>
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

        <a href="dashboard.jsp"
           style="text-decoration:none;
                  color:#166534;
                  font-weight:bold;">
            Dashboard
        </a>

    </div>


    <!-- MAIN CONTENT -->
    <div style="width:90%;
                max-width:1100px;
                margin:45px auto;">

        <h1 style="text-align:center;
                   color:#14532d;
                   margin-bottom:8px;">
            Available Internships
        </h1>

        <p style="text-align:center;
                  color:#6b7280;
                  margin-bottom:35px;">
            Explore internship opportunities and apply for the ones that match your skills
        </p>


        <%
            if (internships == null || internships.isEmpty()) {
        %>

            <div style="background:#ffffff;
                        padding:35px;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <p style="color:#6b7280;">
                    No internships are available at the moment.
                </p>

            </div>

        <%
            } else {
        %>

            <div style="display:flex;
                        gap:20px;
                        flex-wrap:wrap;
                        justify-content:center;">

                <%
                    for (Internship internship : internships) {
                %>

                    <div style="width:320px;
                                background:#ffffff;
                                padding:25px;
                                box-sizing:border-box;
                                border-radius:12px;
                                box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                        <h3 style="color:#14532d;
                                   margin-top:0;
                                   margin-bottom:8px;">
                            <%= internship.getTitle() %>
                        </h3>

                        <p style="color:#166534;
                                  font-weight:bold;
                                  margin-bottom:18px;">
                            <%= internship.getCompany() %>
                        </p>

                        <p style="color:#4b5563;
                                  font-size:14px;
                                  line-height:1.5;">
                            <b>Required Skills:</b>
                            <%= internship.getRequiredSkills() %>
                        </p>

                        <p style="color:#4b5563;
                                  font-size:14px;">
                            <b>Duration:</b>
                            <%= internship.getDuration() %>
                        </p>

                        <p style="color:#6b7280;
                                  font-size:14px;
                                  line-height:1.5;">
                            <%= internship.getDescription() %>
                        </p>

                        <a href="ApplyServlet?id=<%= internship.getInternshipId() %>"
                           style="display:block;
                                  text-align:center;
                                  margin-top:20px;
                                  background:#16a34a;
                                  color:#ffffff;
                                  padding:11px;
                                  text-decoration:none;
                                  border-radius:6px;
                                  font-weight:bold;">
                            Apply Now
                        </a>

                    </div>

                <%
                    }
                %>

            </div>

        <%
            }
        %>

    </div>

</body>
</html>