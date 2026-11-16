<%@ page session="true" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
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

        <div>

            <span style="color:#4b5563;
                         margin-right:18px;">
                Welcome, <b>${sessionScope.studentName}</b>
            </span>

            <a href="LogoutServlet"
               style="text-decoration:none;
                      background:#fee2e2;
                      color:#b91c1c;
                      padding:8px 15px;
                      border-radius:6px;
                      font-size:14px;">
                Logout
            </a>

        </div>

    </div>


    <!-- MAIN CONTENT -->
    <div style="width:92%;
                max-width:1100px;
                margin:45px auto;">

        <h1 style="text-align:center;
                   color:#14532d;
                   margin-bottom:8px;">
            Student Dashboard
        </h1>

        <p style="text-align:center;
                  color:#6b7280;
                  margin-bottom:35px;">
            Manage your skills and internship applications
        </p>


        <!-- FIRST ROW -->
        <div style="display:flex;
                    justify-content:center;
                    gap:20px;
                    flex-wrap:wrap;">


            <!-- PROFILE CARD -->
            <div style="width:300px;
                        background:#ffffff;
                        padding:25px;
                        box-sizing:border-box;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <div style="width:55px;
                            height:55px;
                            margin:0 auto 15px;
                            background:#dcfce7;
                            color:#166534;
                            border-radius:50%;
                            display:flex;
                            align-items:center;
                            justify-content:center;
                            font-size:11px;
                            font-weight:bold;">
                    PROFILE
                </div>

                <h3 style="color:#14532d;
                           margin-bottom:10px;">
                    My Profile
                </h3>

                <p style="color:#6b7280;
                          font-size:14px;
                          line-height:1.5;
                          min-height:42px;">
                    View and update your personal information.
                </p>

                <a href="ProfileServlet"
                   style="display:inline-block;
                          margin-top:12px;
                          background:#16a34a;
                          color:white;
                          padding:10px 22px;
                          text-decoration:none;
                          border-radius:6px;
                          font-size:14px;">
                    View Profile
                </a>

            </div>


            <!-- SKILLS CARD -->
            <div style="width:300px;
                        background:#ffffff;
                        padding:25px;
                        box-sizing:border-box;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <div style="width:55px;
                            height:55px;
                            margin:0 auto 15px;
                            background:#dcfce7;
                            color:#166534;
                            border-radius:50%;
                            display:flex;
                            align-items:center;
                            justify-content:center;
                            font-size:11px;
                            font-weight:bold;">
                    SKILLS
                </div>

                <h3 style="color:#14532d;
                           margin-bottom:10px;">
                    My Skills
                </h3>

                <p style="color:#6b7280;
                          font-size:14px;
                          line-height:1.5;
                          min-height:42px;">
                    Add and manage your technical and professional skills.
                </p>

                <a href="SkillServlet"
                   style="display:inline-block;
                          margin-top:12px;
                          background:#16a34a;
                          color:white;
                          padding:10px 22px;
                          text-decoration:none;
                          border-radius:6px;
                          font-size:14px;">
                    Manage Skills
                </a>

            </div>


            <!-- INTERNSHIPS CARD -->
            <div style="width:300px;
                        background:#ffffff;
                        padding:25px;
                        box-sizing:border-box;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <div style="width:55px;
                            height:55px;
                            margin:0 auto 15px;
                            background:#dcfce7;
                            color:#166534;
                            border-radius:50%;
                            display:flex;
                            align-items:center;
                            justify-content:center;
                            font-size:11px;
                            font-weight:bold;">
                    JOBS
                </div>

                <h3 style="color:#14532d;
                           margin-bottom:10px;">
                    Internships
                </h3>

                <p style="color:#6b7280;
                          font-size:14px;
                          line-height:1.5;
                          min-height:42px;">
                    Explore available internship opportunities.
                </p>

                <a href="InternshipServlet"
                   style="display:inline-block;
                          margin-top:12px;
                          background:#16a34a;
                          color:white;
                          padding:10px 22px;
                          text-decoration:none;
                          border-radius:6px;
                          font-size:14px;">
                    Explore
                </a>

            </div>

        </div>


        <!-- SECOND ROW -->
        <div style="display:flex;
                    justify-content:center;
                    margin-top:25px;">

            <!-- APPLICATION CARD -->
            <div style="width:300px;
                        background:#ffffff;
                        padding:25px;
                        box-sizing:border-box;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <div style="width:55px;
                            height:55px;
                            margin:0 auto 15px;
                            background:#dcfce7;
                            color:#166534;
                            border-radius:50%;
                            display:flex;
                            align-items:center;
                            justify-content:center;
                            font-size:11px;
                            font-weight:bold;">
                    APPS
                </div>

                <h3 style="color:#14532d;
                           margin-bottom:10px;">
                    My Applications
                </h3>

                <p style="color:#6b7280;
                          font-size:14px;
                          line-height:1.5;
                          min-height:42px;">
                    Check your internship applications and their current status.
                </p>

                <a href="applications.jsp"
                   style="display:inline-block;
                          margin-top:12px;
                          background:#16a34a;
                          color:white;
                          padding:10px 22px;
                          text-decoration:none;
                          border-radius:6px;
                          font-size:14px;">
                    View Applications
                </a>
                <a href="ThreadDemoServlet"
                   style="display:block;
                          width:220px;
                          margin:30px auto 0;
                          text-align:center;
                          background:#166534;
                          color:white;
                          padding:11px;
                          text-decoration:none;
                          border-radius:6px;
                          font-weight:bold;">
                    Run System Check
        </a>

            </div>

        </div>

    </div>

</body>
</html>