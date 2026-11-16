<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studenttracker.model.Skill" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Skill> skills = (List<Skill>) request.getAttribute("skills");
    Skill editSkill = (Skill) request.getAttribute("editSkill");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Skills</title>
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
                max-width:950px;
                margin:45px auto;">

        <h1 style="text-align:center;
                   color:#14532d;
                   margin-bottom:8px;">
            My Skills
        </h1>

        <p style="text-align:center;
                  color:#6b7280;
                  margin-bottom:35px;">
            Add and manage your technical and professional skills
        </p>


        <!-- ADD / EDIT SKILL CARD -->
        <div style="background:#ffffff;
                    padding:25px;
                    border-radius:12px;
                    box-shadow:0 6px 18px rgba(0,0,0,0.08);
                    margin-bottom:30px;">

            <h3 style="color:#14532d;
                       margin-top:0;">

                <%
                    if (editSkill != null) {
                %>
                    Edit Skill
                <%
                    } else {
                %>
                    Add New Skill
                <%
                    }
                %>

            </h3>


            <form action="SkillServlet" method="post">

                <%
                    if (editSkill != null) {
                %>

                    <input type="hidden"
                           name="action"
                           value="update">

                    <input type="hidden"
                           name="skillId"
                           value="<%= editSkill.getSkillId() %>">

                <%
                    }
                %>


                <div style="display:flex;
                            gap:15px;
                            flex-wrap:wrap;">

                    <input type="text"
                           name="skillName"
                           placeholder="Skill name"
                           value="<%= editSkill != null ? editSkill.getSkillName() : "" %>"
                           required
                           style="flex:1;
                                  min-width:220px;
                                  padding:11px;
                                  border:1px solid #bbf7d0;
                                  border-radius:6px;
                                  font-size:14px;">


                    <select name="skillLevel"
                            required
                            style="flex:1;
                                   min-width:220px;
                                   padding:11px;
                                   border:1px solid #bbf7d0;
                                   border-radius:6px;
                                   font-size:14px;
                                   background:white;">

                        <option value="">Select skill level</option>

                        <option value="Beginner"
                            <%= editSkill != null && "Beginner".equals(editSkill.getSkillLevel()) ? "selected" : "" %>>
                            Beginner
                        </option>

                        <option value="Intermediate"
                            <%= editSkill != null && "Intermediate".equals(editSkill.getSkillLevel()) ? "selected" : "" %>>
                            Intermediate
                        </option>

                        <option value="Advanced"
                            <%= editSkill != null && "Advanced".equals(editSkill.getSkillLevel()) ? "selected" : "" %>>
                            Advanced
                        </option>

                    </select>


                    <input type="submit"
                           value="<%= editSkill != null ? "Update Skill" : "Add Skill" %>"
                           style="background:#16a34a;
                                  color:white;
                                  border:none;
                                  padding:11px 22px;
                                  border-radius:6px;
                                  font-weight:bold;
                                  cursor:pointer;">

                </div>

            </form>

        </div>


        <!-- SKILL LIST -->
        <div style="background:#ffffff;
                    padding:25px;
                    border-radius:12px;
                    box-shadow:0 6px 18px rgba(0,0,0,0.08);">

            <h3 style="color:#14532d;
                       margin-top:0;
                       margin-bottom:20px;">
                Your Skills
            </h3>


            <%
                if (skills == null || skills.isEmpty()) {
            %>

                <p style="text-align:center;
                          color:#6b7280;
                          padding:25px;">
                    No skills added yet.
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
                                Skill
                            </th>

                            <th style="padding:12px;
                                       text-align:left;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Level
                            </th>

                            <th style="padding:12px;
                                       text-align:center;
                                       color:#166534;
                                       border-bottom:1px solid #bbf7d0;">
                                Action
                            </th>

                        </tr>

                    </thead>

                    <tbody>

                    <%
                        for (Skill skill : skills) {
                    %>

                        <tr>

                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       color:#374151;">
                                <%= skill.getSkillName() %>
                            </td>

                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       color:#374151;">
                                <%= skill.getSkillLevel() %>
                            </td>

                            <td style="padding:12px;
                                       border-bottom:1px solid #e5e7eb;
                                       text-align:center;">

                                <a href="SkillServlet?action=edit&id=<%= skill.getSkillId() %>"
                                   style="text-decoration:none;
                                          background:#dcfce7;
                                          color:#166534;
                                          padding:6px 12px;
                                          border-radius:5px;
                                          margin-right:8px;
                                          font-size:13px;">
                                    Edit
                                </a>

                                <a href="SkillServlet?action=delete&id=<%= skill.getSkillId() %>"
                                   onclick="return confirm('Delete this skill?');"
                                   style="text-decoration:none;
                                          background:#fee2e2;
                                          color:#b91c1c;
                                          padding:6px 12px;
                                          border-radius:5px;
                                          font-size:13px;">
                                    Delete
                                </a>

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

    </div>

</body>
</html>