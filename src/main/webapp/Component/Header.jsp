<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Base64" %>

<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:17 am
  To change this template use File | Settings | File Templates.
--%>
<%
    Cookie[] cookies = request.getCookies();
    String em = null;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("em")) {
                em = cookie.getValue();
                break;
            }
        }
    }

    int sid = 0;
    String sfname = "";
    String slname = "";
    String sgender = "";
    String semail = "";
    byte[] image = null;
    String base64Image = "";
    String Profile = "";

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    boolean hasPurchasedCourse = false;

    try {
        String Driver = application.getInitParameter("Driver");
        String Database = application.getInitParameter("Database");
        String Username = application.getInitParameter("Username");
        String Password = application.getInitParameter("Password");

        Class.forName(Driver);
        con = DriverManager.getConnection(Database, Username, Password);

        pst = con.prepareStatement("SELECT * FROM student_registration WHERE semail = ?");
        pst.setString(1, em);
        rs = pst.executeQuery();

        if (rs.next()) {
            sid = rs.getInt("id");
            sfname = rs.getString("sfname");
            slname = rs.getString("slname");
            String squalification = rs.getString("squalifiaction");
            sgender = rs.getString("sgender");
            String sdob = rs.getString("sdob");
            String sphone = rs.getString("sphone");
            String spassword = rs.getString("spassword");
            image = rs.getBytes("simage");
            if (image != null) {
                base64Image = Base64.getEncoder().encodeToString(image);
                Profile = "data:image/jpeg;base64," + base64Image;
            }

            // Check if the student has purchased any courses
            pst = con.prepareStatement("SELECT COUNT(*) FROM student_payment WHERE sid = ?");
            pst.setInt(1, sid);
            rs = pst.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                hasPurchasedCourse = true;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Nav START -->
<nav class="navbar navbar-expand-xl z-index-9">
    <div class="container">
        <!-- Logo START -->
        <a class="navbar-brand" href="./?sp_name=hm">
            <img class="light-mode-item navbar-brand-item" src="assets/images/logo.svg" alt="logo">
            <img class="dark-mode-item navbar-brand-item" src="assets/images/logo-light.svg" alt="logo">
        </a>
        <!-- Logo END -->

        <!-- Responsive navbar toggler -->
        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-animation">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
        </button>

        <!-- Main navbar START -->
        <div class="navbar-collapse collapse" id="navbarCollapse">

            <!-- Nav Main menu START -->
            <ul class="navbar-nav navbar-nav-scroll ms-auto">
                <!-- Nav item 1 Demos -->
                <li class="nav-item"><a class="nav-link" href="./?sp_name=hm">Home</a></li>

                <!-- Nav item 2 Eduport Business -->
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="demoMenu" data-bs-toggle="dropdown" aria-expanded="false">Courses</a>
                    <ul class="dropdown-menu" aria-labelledby="demoMenu">
                        <li> <a class="dropdown-item" href="./?sp_name=fc">Free Course</a> </li>
                        <li> <a class="dropdown-item" href="./?sp_name=pc">Paid Course</a> </li>
                        <% if (hasPurchasedCourse) { %>
                        <li> <a class="dropdown-item" href="./?sp_name=pc">Purchased Course</a> </li>
                        <% } %>
                    </ul>
                </li>
                <!-- Nav item 3 My learning -->
                <li class="nav-item dropdown"><a class="nav-link" href="./?sp_name=fl">Faculty</a></li>

                <!-- Nav item 1 link -->
                <!-- Nav item 3 link-->
                <li class="nav-item"><a class="nav-link" href="./?sp_name=au">About Us</a></li>

                <!-- Nav item 4 link-->
                <li class="nav-item"><a class="nav-link" href="./?sp_name=cu">Contact Us</a></li>

            </ul>
            <!-- Nav Main menu END -->
        </div>
        <!-- Main navbar END -->

        <!-- Profile and notification START -->
        <ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">


        <%--   ===========   Retrive The Email From the Sessions     ========== --%>




    <!-- Profile dropdown START -->
                <li class="nav-item ms-3 dropdown">

                    <!-- Avatar -->
                    <a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false" style="height: 3.2rem;width: 3.2rem">
                        <img class="avatar-img rounded-circle" src="<%= Profile %>" alt="avatar" style="object-fit: cover;object-position: top">
                    </a>

                    <!-- Profile dropdown START -->
                    <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
                        <!-- Profile info -->
                        <li class="px-3 mb-3">
                            <div class="d-flex align-items-center">
                                <!-- Avatar -->
                                <div class="avatar me-3">
                                    <img class="avatar-img rounded-circle shadow" src="<%= Profile %>" alt="avatar" style="object-fit: cover;object-position: top">
                                </div>
                                <div class="p-2">
                                    <a class="h6" href="#"><%= sfname%> <%= slname%></a>
                                    <p class="small m-0"><%= em%></p>
                                </div>
                            </div>
                        </li>
                        <!-- Links -->
                        <li> <hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="./?sp_name=vp"><i class="bi bi-person fa-fw me-2"></i>View Profile</a></li>
                        <li><a class="dropdown-item bg-danger-soft-hover" href="<%= request.getContextPath() %>/Login.jsp"><i class="bi bi-power fa-fw me-2"></i>Sign Out</a></li>
                        <li> <hr class="dropdown-divider"></li>
                        <!-- Dark mode options START -->
                        <li>
                            <div class="bg-light dark-mode-switch theme-icon-active d-flex align-items-center p-1 rounded mt-2">
                                <button type="button" class="btn btn-sm mb-0" data-bs-theme-value="light">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sun fa-fw mode-switch" viewBox="0 0 16 16">
                                        <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                                        <use href="#"></use>
                                    </svg> Light
                                </button>
                                <button type="button" class="btn btn-sm mb-0" data-bs-theme-value="dark">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-moon-stars fa-fw mode-switch" viewBox="0 0 16 16">
                                        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278zM4.858 1.311A7.269 7.269 0 0 0 1.025 7.71c0 4.02 3.279 7.276 7.319 7.276a7.316 7.316 0 0 0 5.205-2.162c-.337.042-.68.063-1.029.063-4.61 0-8.343-3.714-8.343-8.29 0-1.167.242-2.278.681-3.286z"/>
                                        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
                                        <use href="#"></use>
                                    </svg> Dark
                                </button>
                            </div>
                        </li>
                        <!-- Dark mode options END-->
                    </ul>
                    <!-- Profile dropdown END -->
                </li>
            </ul>
            <!-- Profile and notification END -->
        </div>
    </nav>
    <!-- Nav END -->

    <hr class="my-0">
</body>
</html>
