<%@ page session="true" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>

<head>
    <title>Add Internship</title>
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


    <!-- FORM AREA -->
    <div style="width:100%;
                min-height:85vh;
                display:flex;
                justify-content:center;
                align-items:center;">

        <div style="width:500px;
                    background:#ffffff;
                    padding:35px;
                    border-radius:12px;
                    box-shadow:0 8px 25px rgba(0,0,0,0.10);">

            <h2 style="text-align:center;
                       color:#14532d;
                       margin-top:0;">
                Add Internship
            </h2>

            <p style="text-align:center;
                      color:#6b7280;
                      margin-bottom:25px;">
                Add a new internship opportunity
            </p>


            <%
                if ("1".equals(error)) {
            %>

                <div style="background:#fee2e2;
                            color:#b91c1c;
                            padding:10px;
                            border-radius:6px;
                            text-align:center;
                            margin-bottom:18px;">
                    Unable to add internship. Please try again.
                </div>

            <%
                }
            %>


            <form action="AddInternshipServlet"
                  method="post">

                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Company Name
                </label>

                <input type="text"
                       name="company"
                       required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:18px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Internship Title
                </label>

                <input type="text"
                       name="title"
                       required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:18px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Required Skills
                </label>

                <input type="text"
                       name="requiredSkills"
                       placeholder="Java, SQL, JDBC"
                       required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:18px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Duration
                </label>

                <input type="text"
                       name="duration"
                       placeholder="2 Months"
                       required
                       style="width:100%;
                              box-sizing:border-box;
                              padding:11px;
                              margin-bottom:18px;
                              border:1px solid #bbf7d0;
                              border-radius:6px;">


                <label style="display:block;
                              margin-bottom:6px;
                              font-weight:bold;
                              color:#374151;">
                    Description
                </label>

                <textarea name="description"
                          rows="4"
                          required
                          style="width:100%;
                                 box-sizing:border-box;
                                 padding:11px;
                                 margin-bottom:22px;
                                 border:1px solid #bbf7d0;
                                 border-radius:6px;
                                 resize:vertical;"></textarea>


                <input type="submit"
                       value="Add Internship"
                       style="width:100%;
                              padding:12px;
                              background:#16a34a;
                              color:white;
                              border:none;
                              border-radius:6px;
                              font-size:15px;
                              font-weight:bold;">

            </form>

        </div>

    </div>

</body>

</html>