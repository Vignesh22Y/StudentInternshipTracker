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
    <title>My Profile</title>
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


    <!-- PROFILE CARD -->
    <div style="width:100%;
                min-height:85vh;
                display:flex;
                justify-content:center;
                align-items:center;">

        <div style="width:430px;
                    background:#ffffff;
                    padding:35px;
                    border-radius:12px;
                    box-shadow:0 8px 25px rgba(0,0,0,0.10);">

            <h2 style="text-align:center;
                       color:#14532d;
                       margin:0 0 8px 0;">
                My Profile
            </h2>

            <p style="text-align:center;
                      color:#6b7280;
                      margin-bottom:28px;">
                Your personal information
            </p>


            <!-- NAME -->
            <div style="margin-bottom:18px;">

                <label style="display:block;
                              color:#166534;
                              font-weight:bold;
                              margin-bottom:6px;">
                    Name
                </label>

                <div style="background:#f0fdf4;
                            border:1px solid #bbf7d0;
                            padding:11px;
                            border-radius:6px;
                            color:#374151;">
                    ${student.name}
                </div>

            </div>


            <!-- ROLL NUMBER -->
            <div style="margin-bottom:18px;">

                <label style="display:block;
                              color:#166534;
                              font-weight:bold;
                              margin-bottom:6px;">
                    Roll No
                </label>

                <div style="background:#f0fdf4;
                            border:1px solid #bbf7d0;
                            padding:11px;
                            border-radius:6px;
                            color:#374151;">
                    ${student.rollNo}
                </div>

            </div>


            <!-- EMAIL -->
            <div style="margin-bottom:18px;">

                <label style="display:block;
                              color:#166534;
                              font-weight:bold;
                              margin-bottom:6px;">
                    Email
                </label>

                <div style="background:#f0fdf4;
                            border:1px solid #bbf7d0;
                            padding:11px;
                            border-radius:6px;
                            color:#374151;">
                    ${student.email}
                </div>

            </div>


            <!-- COURSE -->
            <div style="margin-bottom:18px;">

                <label style="display:block;
                              color:#166534;
                              font-weight:bold;
                              margin-bottom:6px;">
                    Course
                </label>

                <div style="background:#f0fdf4;
                            border:1px solid #bbf7d0;
                            padding:11px;
                            border-radius:6px;
                            color:#374151;">
                    ${student.course}
                </div>

            </div>


            <!-- SEMESTER -->
            <div style="margin-bottom:25px;">

                <label style="display:block;
                              color:#166534;
                              font-weight:bold;
                              margin-bottom:6px;">
                    Semester
                </label>

                <div style="background:#f0fdf4;
                            border:1px solid #bbf7d0;
                            padding:11px;
                            border-radius:6px;
                            color:#374151;">
                    ${student.semester}
                </div>

            </div>


            <a href="dashboard.jsp"
               style="display:block;
                      text-align:center;
                      background:#16a34a;
                      color:white;
                      padding:12px;
                      text-decoration:none;
                      border-radius:6px;
                      font-weight:bold;">
                Back to Dashboard
            </a>

        </div>

    </div>

</body>
</html>