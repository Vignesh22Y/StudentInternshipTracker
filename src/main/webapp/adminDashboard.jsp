<%@ page session="true" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
                Welcome, <b>${sessionScope.adminUsername}</b>
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
                max-width:1000px;
                margin:50px auto;">

        <h1 style="text-align:center;
                   color:#14532d;
                   margin-bottom:8px;">
            Admin Dashboard
        </h1>

        <p style="text-align:center;
                  color:#6b7280;
                  margin-bottom:35px;">
            Manage internship opportunities
        </p>


        <!-- CARDS -->
        <div style="display:flex;
                    justify-content:center;
                    gap:25px;
                    flex-wrap:wrap;">


            <!-- ADD INTERNSHIP -->
            <div style="width:300px;
                        background:#ffffff;
                        padding:30px;
                        box-sizing:border-box;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <div style="width:60px;
                            height:60px;
                            margin:0 auto 15px;
                            background:#dcfce7;
                            color:#166534;
                            border-radius:50%;
                            display:flex;
                            align-items:center;
                            justify-content:center;
                            font-size:11px;
                            font-weight:bold;">
                    ADD
                </div>

                <h3 style="color:#14532d;
                           margin-bottom:10px;">
                    Add Internship
                </h3>

                <p style="color:#6b7280;
                          font-size:14px;
                          line-height:1.5;
                          min-height:42px;">
                    Add a new internship opportunity for students.
                </p>

                <a href="addInternship.jsp"
                   style="display:inline-block;
                          margin-top:12px;
                          background:#16a34a;
                          color:white;
                          padding:10px 22px;
                          text-decoration:none;
                          border-radius:6px;
                          font-size:14px;">
                    Add Internship
                </a>

            </div>


            <!-- MANAGE INTERNSHIPS -->
            <div style="width:300px;
                        background:#ffffff;
                        padding:30px;
                        box-sizing:border-box;
                        text-align:center;
                        border-radius:12px;
                        box-shadow:0 6px 18px rgba(0,0,0,0.08);">

                <div style="width:60px;
                            height:60px;
                            margin:0 auto 15px;
                            background:#dcfce7;
                            color:#166534;
                            border-radius:50%;
                            display:flex;
                            align-items:center;
                            justify-content:center;
                            font-size:11px;
                            font-weight:bold;">
                    MANAGE
                </div>

                <h3 style="color:#14532d;
                           margin-bottom:10px;">
                    Manage Internships
                </h3>

                <p style="color:#6b7280;
                          font-size:14px;
                          line-height:1.5;
                          min-height:42px;">
                    View, edit and delete available internships.
                </p>

                <a href="AdminInternshipServlet"
                   style="display:inline-block;
                          margin-top:12px;
                          background:#16a34a;
                          color:white;
                          padding:10px 22px;
                          text-decoration:none;
                          border-radius:6px;
                          font-size:14px;">
                    Manage
                </a>

            </div>

        </div>

    </div>

</body>
</html>