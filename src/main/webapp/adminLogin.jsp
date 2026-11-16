<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>

<body style="margin:0;
             font-family:Arial, sans-serif;
             background:#f4f7f2;">

    <div style="width:100%;
                min-height:100vh;
                display:flex;
                justify-content:center;
                align-items:center;">

        <div style="width:380px;
                    background:#ffffff;
                    padding:35px;
                    border-radius:12px;
                    box-shadow:0 8px 25px rgba(0,0,0,0.10);">

            <h2 style="text-align:center;
                       color:#14532d;
                       margin-bottom:8px;">
                Admin Login
            </h2>

            <p style="text-align:center;
                      color:#6b7280;
                      margin-bottom:28px;">
                Manage internships and student records
            </p>

            <form action="AdminLoginServlet" method="post">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Username
                </label>

                <input type="text"
                       name="username"
                       required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:18px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Password
                </label>

                <input type="password"
                       name="password"
                       required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:22px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <input type="submit"
                       value="Login as Admin"
                       style="width:100%;
                              padding:12px;
                              background:#166534;
                              color:white;
                              border:none;
                              border-radius:6px;
                              font-size:15px;
                              font-weight:bold;
                              cursor:pointer;">

            </form>

            <p style="text-align:center;
                      margin-top:20px;
                      color:#6b7280;
                      font-size:14px;">

                <a href="login.jsp"
                   style="color:#166534;
                          font-weight:bold;
                          text-decoration:none;">
                    Student Login
                </a>

            </p>

        </div>

    </div>

</body>
</html>