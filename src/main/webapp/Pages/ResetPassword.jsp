<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 21-07-2024
  Time: 04:37 pm
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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

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
                                <a class="list-group-item" href="?sp_name=ep"><i class="bi bi-pencil-square fa-fw me-2"></i>Edit Profile</a>
                                <a class="list-group-item active" href="?sp_name=se"><i class="bi bi-gear fa-fw me-2"></i>Settings</a>
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
                    <!-- Card body START -->
                    <div class="card-body">
                        <!-- Form -->
                        <form class="row g-4" id="registrationForm" action="PassUpdateServlet" method="post">
                            <input type="hidden" name="id" value="<%= sid%>" />
                            <!-- Password change START -->
                            <div class="col-lg-6">
                                <div class="card border bg-transparent rounded-3" style="box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;">
                                    <!-- Card header -->
                                    <div class="card-header bg-transparent border-bottom">
                                        <h5 class="card-header-title mb-0">Update password</h5>
                                    </div>
                                    <!-- Card body START -->
                                    <div class="card-body">
                                        <!-- Current password -->
                                        <div class="mb-3">
                                            <label class="form-label">Current password</label>
                                            <input class="form-control" type="password" name="pass" placeholder="Enter current password" required>
                                        </div>
                                        <!-- New password -->
                                        <div class="mb-3">
                                            <label class="form-label">Enter new password</label>
                                            <div class="input-group">
                                                <input class="form-control" type="password" name="np" id="newPassword" placeholder="Enter new password" required>
                                                <span class="input-group-text p-0 bg-transparent">
                                <i class="far fa-eye cursor-pointer p-2 w-40px" id="toggleNewPassword"></i>
                            </span>
                                            </div>
                                            <div class="rounded mt-1" id="psw-strength"></div>
                                        </div>
                                        <!-- Confirm password -->
                                        <div>
                                            <label class="form-label">Confirm new password</label>
                                            <input class="form-control" type="password" name="cp" id="confirmPassword" placeholder="Enter Confirm password" required>
                                        </div>
                                        <!-- Button -->
                                        <div class="d-flex justify-content-end mt-4">
                                            <button type="submit" class="btn btn-outline-primary mb-0">Change password</button>
                                        </div>
                                    </div>
                                    <!-- Card body END -->
                                </div>
                            </div>
                            <!-- Password change end -->
                        </form>
                    </div>
                    <!-- Card body END -->
                </div>
                <!-- Edit profile END -->
            </div>
            <!-- Main content END -->
        </div><!-- Row END -->
</section>
<!-- =======================
Page content END -->

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const triggerToastFromURL = () => {
            const urlParams = new URLSearchParams(window.location.search);
            const toastType = urlParams.get('toast');

            if (toastType === 'success') {
                Toastify({
                    text: "✅ Password Reset Successfully",
                    duration: 3000,
                    offset: {
                        x: 10,
                        y: 10
                    },
                    backgroundColor: "",
                    close: true, // Show close button
                    gravity: "top", // Toast position: top or bottom
                    position: "right", // Toast position: left, center or right
                    stopOnFocus: true, // Prevent toast from disappearing on hover
                    className: "custom-toast", // Apply custom class
                }).showToast();

                // Remove the 'toast' parameter from the URL
                urlParams.delete('toast');
                const newUrl = `${window.location.pathname}?sp_name=se`;
                window.history.replaceState({}, document.title, newUrl);
            } else {
                console.warn(`Toast type "${toastType}" is not recognized.`);
            }
        };

        triggerToastFromURL();
    });

</script>

<script>
    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        var newPassword = document.getElementById('newPassword').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            event.preventDefault();
            alert('Passwords do not match.');
            location.reload();
        }
    });

    document.getElementById('toggleNewPassword').addEventListener('click', function () {
        const passwordField = document.getElementById('newPassword');
        const passwordFieldType = passwordField.getAttribute('type');
        if (passwordFieldType === 'password') {
            passwordField.setAttribute('type', 'text');
            this.classList.add('fa-eye-slash');
            this.classList.remove('fa-eye');
        } else {
            passwordField.setAttribute('type', 'password');
            this.classList.add('fa-eye');
            this.classList.remove('fa-eye-slash');
        }
    });
</script>

<style>
    /* Custom styles to replicate React Toastify appearance */
    .custom-toast {
        border-radius: 6px;
        padding: 12px 20px; /* Padding for better appearance */
        font-family: 'Poppins', sans-serif; /* Font similar to React Toastify */
        font-size: 16px; /* Adjust font size if needed */
        color: green; /* Text color */
        border-bottom: 2px solid green;
        box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
    }

    .toastify {
        /* Toastify container styles */
        background: white;
    }

    .toast-close{
        color: green !important; /* Close button color */
        font-size: 16px; /* Adjust close button size */
    }
    .toastify .toastify-close:hover {
        color: #ccc; /* Change color on hover */
    }

</style>

<%--<script>--%>
<%--    document.getElementById('toggleNewPassword').addEventListener('click', function () {--%>
<%--        const passwordField = document.getElementById('newPassword');--%>
<%--        const passwordFieldType = passwordField.getAttribute('type');--%>
<%--        if (passwordFieldType === 'password') {--%>
<%--            passwordField.setAttribute('type', 'text');--%>
<%--            this.classList.add('fa-eye-slash');--%>
<%--            this.classList.remove('fa-eye');--%>
<%--        } else {--%>
<%--            passwordField.setAttribute('type', 'password');--%>
<%--            this.classList.add('fa-eye');--%>
<%--            this.classList.remove('fa-eye-slash');--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
