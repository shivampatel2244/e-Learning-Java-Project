<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 21-07-2024
  Time: 04:36 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <title>Title</title>
</head>
<body>

<!-- =======================
Page Banner START -->
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
                                <a href="?sp_name=ph" class="btn btn-outline-dark mb-0"><i class="fa fa-history fa-fw"></i> Payment History</a>
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
                                <a class="list-group-item" href="?sp_name=vp"><i class="bi bi-ui-checks-grid fa-fw me-2"></i>Dashboard</a>
                                <a class="list-group-item active" href="?sp_name=ep"><i class="bi bi-pencil-square fa-fw me-2"></i>Edit Profile</a>
                                <a class="list-group-item" href="?sp_name=se"><i class="bi bi-gear fa-fw me-2"></i>Settings</a>
                                <a class="list-group-item" href="#"><i class="bi bi-trash fa-fw me-2"></i>Delete Profile</a>
                                <a class="list-group-item text-danger bg-danger-soft-hover" href="<%= request.getContextPath() %>/Login.jsp"><i class="fas fa-sign-out-alt fa-fw me-2"></i>Sign Out</a>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Responsive offcanvas body END -->
            </div>
            <!-- Left sidebar END -->

            <!-- Main content START -->
            <div class="col-xl-9">
                <!-- Edit profile START -->
                <div class="card bg-transparent border rounded-3" style="box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;">
                    <!-- Card header -->
                    <div class="card-header bg-transparent border-bottom">
                        <h3 class="card-header-title mb-0">Edit Profile</h3>
                    </div>
                    <!-- Card body START -->
                    <div class="card-body">
                        <!-- Form -->
                        <form action="UpdateDataServlet" class="row g-4" id="registrationForm" method="post">

                            <input type="hidden" name="id" value="<%= sid%>"/>
                            <!-- Full name -->
                            <div class="col-6">
                                <label class="form-label">First Name</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="sfname" value="<%= sfname%>" placeholder="Enter First name" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label">Last Name</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="slname" value="<%= slname%>" placeholder="Enter Last name" required>
                                </div>
                            </div>

                            <!-- Qualification -->
                            <div class="col-md-6">
                                <label class="form-label">Qualification</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" value="<%= squalification%>" name="squalification" placeholder="Enter Qualification" required>
                                </div>
                            </div>

                            <!-- Email id -->
                            <div class="col-md-6">
                                <label class="form-label">Email id</label>
                                <input class="form-control" type="email" value="<%= em%>" name="semail" placeholder="Email" required>
                            </div>

                            <!-- Gender -->
                            <div class="col-md-6">
                                <label class="form-label">Gender</label>
                                <select class="form-control" id="gender" name="sgender" required>
                                    <option value="<%= sgender%>"><%= sgender%></option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>

                            <!-- Date of Birth -->
                            <div class="col-md-6">
                                <label for="dob" class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" value="<%= sdob%>" name="sdob" id="dob" required>
                            </div>

                            <!-- Mobile No -->
                            <div class="col-6">
                                <label for="mobileNumber" class="form-label">Mobile Number</label>
                                <input type="text" class="form-control" name="sphone" placeholder="Mobile Number" value="<%= sphone%>" id="mobileNumber" pattern="[0-9]{10}" required>
                            </div>

                            <!-- Save button -->
                            <div class="col-6">
                                <label for="mobileNumber" class="form-label"></label>
                                <button type="submit" class="form-control btn btn-outline-primary mt-2">Save changes</button>
                            </div>
                        </form>

                    </div>
                    <!-- Card body END -->
                </div>
                <!-- Edit profile END -->
            </div>
            <!-- Main content END -->
        </div><!-- Row END -->
    </div>
</section>
<!-- =======================
Page content END -->
<script>
    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        // Check if the form is valid
        if (!this.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
            alert('Please fill out all required fields correctly.');
        }
    }, false);
</script>
</body>
</html>
