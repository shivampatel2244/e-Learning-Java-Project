<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 17-07-2024
  Time: 02:48 pm
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>

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
    String squalification = "";
    String sdob = "";
    String sphone = "";

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
            squalification = rs.getString("squalifiaction");
            sgender = rs.getString("sgender");
            sdob = rs.getString("sdob");
            sphone = rs.getString("sphone");
            String spassword = rs.getString("spassword");
            image = rs.getBytes("simage");
            if (image != null) {
                base64Image = Base64.getEncoder().encodeToString(image);
                Profile = "data:image/jpeg;base64," + base64Image;
            }

        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .main-body {
            padding: 15px;
        }
        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0,0,0,.125);
            border-radius: .25rem;
        }

        .card-body {
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1rem;
        }

        .gutters-sm {
            margin-right: -8px;
            margin-left: -8px;
        }

        .gutters-sm>.col, .gutters-sm>[class*=col-] {
            padding-right: 8px;
            padding-left: 8px;
        }
        .mb-3, .my-3 {
            margin-bottom: 1rem!important;
        }

        .bg-gray-300 {
            background-color: #e2e8f0;
        }
        .h-100 {
            height: 100%!important;
        }
        .shadow-none {
            box-shadow: none!important;
        }
    </style>
</head>
<body>

<section class="pt-0">
    <div class="container-fluid px-0">
        <div class="card bg-blue h-100px h-md-200px rounded-0" style="background:url(assets/images/pattern/04.png) no-repeat center center; background-size:cover;">
        </div>
    </div>
    <div class="container mt-n4">
        <div class="row">
            <div class="col-12">
                <div class="card bg-transparent card-body pb-0 px-0 mt-2 mt-sm-0">
                    <div class="row d-sm-flex justify-sm-content-between mt-2 mt-md-0">
                        <!-- Avatar -->
                        <div class="col-auto " style="padding-right: 0px !important;">
                            <div class="avatar avatar-xxl position-relative mt-n3">
                                <img class="avatar-img rounded-circle border border-white border-3 shadow" src="<%= Profile%>" alt="">
                            </div>
                        </div>
                        <!-- Profile info -->
                        <div class="col d-sm-flex justify-content-between align-items-center">
                            <div style="padding-left: 0px !important;">
                                <h1 class="my-1 fs-4" style="padding: 16px !important;"><%= sfname%> <%= slname%> <i class="bi bi-patch-check-fill text-info small"></i></h1>
                                <ul class="list-inline mb-0" style="padding: 0px;">
                                    <li class="list-inline-item me-3 mb-1 mb-sm-0">
                                        <span class="h6"><%= em%></span>
                                    </li>

                                </ul>
                            </div>
                            <!-- Button -->
                            <div class="mt-2 mt-sm-0">
                                <a href="<%= request.getContextPath() %>/Login.jsp" class="btn btn-outline-danger mb-0"><i class="bi bi-power fa-fw"></i>Sign Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- =======================
Page Banner END -->
<!-- =======================
Page content START -->
<%--<section class="pt-0">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>

<%--            <!-- Left sidebar START -->--%>
<%--            <div class="col-xl-3">--%>
<%--                <!-- Responsive offcanvas body START -->--%>
<%--                <div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar">--%>
<%--                    <!-- Offcanvas header -->--%>
<%--                    <div class="offcanvas-header bg-light">--%>
<%--                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>--%>
<%--                        <button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- Responsive offcanvas body END -->--%>
<%--            </div>--%>
<%--            <!-- Left sidebar END -->--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- =======================
Page content END -->

<!-- =======================
Page content START -->
<section class="pt-0">
    <div class="container">
        <div class="row">

            <!-- Left sidebar START -->
            <div class="col-xl-3">
                <!-- Responsive offcanvas body START -->
                <div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar">
                    <!-- Offcanvas header -->
                    <div class="offcanvas-header bg-light">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>
                        <button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
                    </div>
                    <!-- Offcanvas body -->
                    <div class="offcanvas-body p-3 p-xl-0">
                        <div class="bg-dark border rounded-3 p-3 w-100">
                            <!-- Dashboard menu -->
                            <div class="list-group list-group-dark list-group-borderless collapse-list">
                                <a class="list-group-item active" href="?sp_name=vp"><i class="bi bi-ui-checks-grid fa-fw me-2"></i>View Profile</a>
                                <a class="list-group-item" href="?sp_name=ep"><i class="bi bi-pencil-square fa-fw me-2"></i>Edit Profile</a>
                                <a class="list-group-item" href="?sp_name=se"><i class="bi bi-gear fa-fw me-2"></i>Settings</a>
                                <a class="list-group-item" href="#"><i class="bi bi-trash fa-fw me-2"></i>Delete Profile</a>
                                <a class="list-group-item text-danger bg-danger-soft-hover" href="#"><i class="fas fa-sign-out-alt fa-fw me-2"></i>Sign Out</a>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Responsive offcanvas body END -->
            </div>
            <!-- Left sidebar END -->

            <!-- Main content START -->
            <div class="col-xl-8">
                <div class="col-md-8" style="box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;">
                    <div class="card mb-3">
                        <div class="card-header bg-transparent border-bottom">
                            <h5 class="card-header-title mb-0">Student Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">First Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= sfname%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Last Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= slname%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Qualification</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= squalification%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= em%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Gender</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= sgender%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">DOB</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= sdob%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Phone No</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%= sphone%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- =======================
Page content END -->

</body>
</html>

</body>
</html>
