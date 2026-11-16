<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>

<body style="margin:0; font-family:Arial, sans-serif; background:#f4f7f2;">

    <div style="width:100%; min-height:100vh; display:flex;
                justify-content:center; align-items:center;">

        <div style="width:410px; background:#ffffff; padding:35px;
                    border-radius:12px;
                    box-shadow:0 8px 25px rgba(0,0,0,0.10);">

            <h2 style="text-align:center;
                       color:#14532d;
                       margin:0 0 8px 0;">
                Student Registration
            </h2>

            <p style="text-align:center;
                      color:#6b7280;
                      margin-bottom:28px;">
                Create your account and start exploring internships
            </p>

            <form action="RegisterServlet" method="post">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Name
                </label>

                <input type="text" name="name" required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:16px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;
                              outline:none;">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Roll No
                </label>

                <input type="text" name="rollNo" required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:16px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Email
                </label>

                <input type="email" name="email" required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:16px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Password
                </label>

                <input type="password" name="password" required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:16px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Course
                </label>

                <input type="text" name="course" required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:16px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Semester
                </label>

                <input type="number" name="semester"
                       min="1" max="8" required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:22px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;
                              font-size:14px;">

                <input type="submit"
                       value="Create Account"
                       style="width:100%;
                              padding:12px;
                              background:#16a34a;
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

                Already have an account?

                <a href="login.jsp"
                   style="color:#166534;
                          font-weight:bold;
                          text-decoration:none;">
                    Login
                </a>

            </p>

        </div>

    </div>

</body>
</html>