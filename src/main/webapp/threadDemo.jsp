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
    <title>System Update</title>
</head>

<body style="margin:0;
             font-family:Arial, sans-serif;
             background:#f4f7f2;">

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


    <div style="width:90%;
                max-width:700px;
                margin:60px auto;">

        <div style="background:#ffffff;
                    padding:35px;
                    border-radius:12px;
                    box-shadow:0 6px 18px rgba(0,0,0,0.08);">

            <h2 style="text-align:center;
                       color:#14532d;
                       margin-top:0;">
                Background Tasks
            </h2>

            <p style="text-align:center;
                      color:#6b7280;
                      margin-bottom:30px;">
                Multiple tasks were processed using Java threads.
            </p>


            <div style="background:#f0fdf4;
                        border:1px solid #bbf7d0;
                        padding:15px;
                        margin-bottom:15px;
                        border-radius:6px;
                        color:#166534;">
                ${result1}
            </div>

            <div style="background:#f0fdf4;
                        border:1px solid #bbf7d0;
                        padding:15px;
                        margin-bottom:15px;
                        border-radius:6px;
                        color:#166534;">
                ${result2}
            </div>

            <div style="background:#f0fdf4;
                        border:1px solid #bbf7d0;
                        padding:15px;
                        margin-bottom:25px;
                        border-radius:6px;
                        color:#166534;">
                ${result3}
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