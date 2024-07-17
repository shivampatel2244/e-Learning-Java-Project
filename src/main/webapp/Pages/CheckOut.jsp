<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:33 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
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
    String sphone = "";
    String semail = "";
    byte[] image = null;
    String base64Image = "";
    String Profile = "";

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

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
            semail = rs.getString("semail");
            String sdob = rs.getString("sdob");
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

    <!-- =======================
    Page Banner START -->
    <section class="py-4">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bg-light p-4 text-center rounded-3">
                        <h1 class="m-0">Course Grid Minimal</h1>
                        <!-- Breadcrumb -->
                        <div class="d-flex justify-content-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb breadcrumb-dots mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Course minimal</li>
                                </ol>
                            </nav>
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
    <section class="pt-5">
        <div class="container">

            <div class="row g-4 g-sm-5">
                <!-- Main content START -->
                <div class="col-xl-8 mb-4 mb-sm-0">

                    <!-- Personal info START -->
                    <div class="card card-body shadow p-4">
                        <!-- Title -->
                        <h5 class="mb-0">Personal Details</h5>

                        <!-- Form START -->
                        <form class="row g-3 mt-0">
                            <!-- FName -->
                            <div class="col-md-6 bg-light-input">
                                <label for="yourName" class="form-label">Your name *</label>
                                <input type="text" class="form-control" id="yourName" placeholder="Name" value="<%= sfname%>">
                            </div>
                            <!-- LName -->
                            <div class="col-md-6 bg-light-input">
                                <label for="yourName" class="form-label">Your name *</label>
                                <input type="text" class="form-control" id="yourName" placeholder="Name" value="<%= slname%>">
                            </div>
                            <!-- Email -->
                            <div class="col-md-6 bg-light-input">
                                <label for="emailInput" class="form-label">Email address *</label>
                                <input type="email" class="form-control" id="emailInput" placeholder="Email" value="<%= semail%>">
                            </div>
                            <!-- Number -->
                            <div class="col-md-6 bg-light-input">
                                <label for="mobileNumber" class="form-label">Mobile number *</label>
                                <input type="text" class="form-control" id="mobileNumber" placeholder="Mobile number" value="<%=sphone%>">
                            </div>

                        </form>
                        <!-- Form END -->

                    </div>
                    <!-- Personal info END -->
                </div>
                <!-- Main content END -->

                <!-- Right sidebar START -->
                <div class="col-xl-4">
                    <div class="row mb-0">
                        <div class="col-md-6 col-xl-12">
                            <!-- Order summary START -->
                            <div class="card card-body shadow p-4 mb-4">
                                <!-- Title -->
                                <h4 class="mb-4">Order Summary</h4>

                                <!-- Course item START -->
                                <div class="row g-3">
                                    <!-- Image -->
                                    <div class="col-sm-4">
                                        <img class="rounded" src="assets/images/courses/4by3/08.jpg" alt="">
                                    </div>
                                    <!-- Info -->
                                    <div class="col-sm-8">
                                        <h6 class="mb-0"><a href="#">Sketch from A to Z: for an app designer</a></h6>
                                        <!-- Info -->
                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                            <!-- Price -->
                                            <span class="text-success">Rs.150</span>

                                            <!-- Remove and edit button -->
                                            <div class="text-primary-hover">
                                                <a href="#" class="text-body me-2"><i class="bi bi-trash me-1"></i>Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Course item END -->

                                <hr>
                                <!-- Divider -->

                                <!-- Price and detail -->
                                <ul class="list-group list-group-borderless mb-2">
                                    <li class="list-group-item px-0 d-flex justify-content-between">
                                        <span class="h6 fw-light mb-0">Original Price</span>
                                        <span class="h6 fw-light mb-0 fw-bold">Rs.500</span>
                                    </li>
                                    <li class="list-group-item px-0 d-flex justify-content-between">
                                        <span class="h6 fw-light mb-0">Coupon Discount</span>
                                        <span class="text-danger">-Rs.20</span>
                                    </li>
                                    <li class="list-group-item px-0 d-flex justify-content-between">
                                        <span class="h5 mb-0">Total</span>
                                        <span class="h5 mb-0">Rs.480</span>
                                    </li>
                                </ul>

                                <!-- Button -->
                                <div class="d-grid">
                                    <a href="./Credit-Card-master/index.html" class="btn btn-lg btn-success">Place Order</a>
                                </div>

                                <!-- Content -->
                                <p class="small mb-0 mt-2 text-center">By completing your purchase, you agree to these <a href="#"><strong>Terms of Service</strong></a></p>

                            </div>
                            <!-- Order summary END -->
                        </div>
                    </div>
                    <!-- Row End -->
                </div>
                <!-- Right sidebar END -->

            </div><!-- Row END -->
        </div>
    </section>
    <!-- =======================
    Page content END -->

</body>
</html>
