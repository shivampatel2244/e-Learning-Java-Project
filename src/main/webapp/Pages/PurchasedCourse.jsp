<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:30 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    try {
        String Driver = application.getInitParameter("Driver");
        String Database = application.getInitParameter("Database");
        String Username = application.getInitParameter("Username");
        String Password = application.getInitParameter("Password");

        Class.forName(Driver);
        Connection con = DriverManager.getConnection(Database, Username, Password);

        PreparedStatement pst = con.prepareStatement("SELECT * FROM student_registration WHERE semail = ?");
        pst.setString(1, em);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            sid = rs.getInt("id");
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
<section class="pb-0 py-sm-5">
    <div class="container">
        <!-- Ttile -->
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="fs-1 fw-bold">
                    <span class="position-relative z-index-9">Purchased</span>
                    <span class="position-relative z-index-1">Courses
                        <!-- SVG START -->
						<span class="position-absolute top-50 start-50 translate-middle z-index-n1">
							<svg width="163.9px" height="48.6px">
								<path class="fill-warning" d="M162.5,19.9c-0.1-0.4-0.2-0.8-0.3-1.3c-0.1-0.3-0.2-0.5-0.4-0.7c-0.3-0.4-0.7-0.7-1.2-0.9l0.1,0l-0.1,0 c0.1-0.4-0.2-0.5-0.5-0.6c0,0-0.1,0-0.1,0c-0.1-0.1-0.2-0.2-0.3-0.3c0-0.3,0-0.6-0.2-0.7c-0.1-0.1-0.3-0.2-0.6-0.2 c0-0.3-0.1-0.5-0.3-0.6c-0.1-0.1-0.3-0.2-0.5-0.2c-0.1,0-0.1,0-0.2,0c-0.5-0.4-1-0.8-1.4-1.1c0,0,0-0.1,0-0.1c0-0.1-0.1-0.1-0.3-0.2 c-0.9-0.5-1.8-1-2.6-1.5c-6-3.6-13.2-4.3-19.8-6.2c-4.1-1.2-8.4-1.4-12.6-2c-5.6-0.8-11.3-0.6-16.9-1.1c-2.3-0.2-4.6-0.3-6.8-0.3 c-1.2,0-2.4-0.2-3.5-0.1c-2.4,0.4-4.9,0.6-7.4,0.7c-0.8,0-1.7,0.1-2.5,0.1c-0.1,0-0.1,0-0.2,0c-0.1,0-0.1,0-0.2,0 c-0.9,0-1.8,0.1-2.7,0.1c-0.9,0-1.8,0-2.7,0c-5.5-0.3-10.7,0.7-16,1.5c-2.5,0.4-5.1,1-7.6,1.5c-2.8,0.6-5.6,0.7-8.4,1.4 c-4.1,1-8.2,1.9-12.3,2.6c-4,0.7-8,1.6-11.9,2.7c-3.6,1-6.9,2.5-10.1,4.1c-1.9,0.9-3.8,1.7-5.2,3.2c-1.7,1.8-2.8,4-4.2,6 c-1,1.3-0.7,2.5,0.2,3.9c2,3.1,5.5,4.4,9,5.7c1.8,0.7,3.6,1,5.3,1.8c2.3,1.1,4.6,2.3,7.1,3.2c5.2,2,10.6,3.4,16.2,4.4 c3,0.6,6.2,0.9,9.2,1.1c4.8,0.3,9.5,1.1,14.3,0.8c0.3,0.3,0.6,0.3,0.9-0.1c0.7-0.3,1.4,0.1,2.1-0.1c3.7-0.6,7.6-0.3,11.3-0.3 c2.1,0,4.3,0.3,6.4,0.2c4-0.2,8-0.4,11.9-0.8c5.4-0.5,10.9-1,16.2-2.2c0.1,0.2,0.2,0.1,0.2,0c0.5-0.1,1-0.2,1.4-0.3 c0.1,0.1,0.2,0.1,0.3,0c0.5-0.1,1-0.3,1.6-0.3c3.3-0.3,6.7-0.6,10-1c2.1-0.3,4.1-0.8,6.2-1.2c0.2,0.1,0.3,0.1,0.4,0.1 c0.1,0,0.1,0,0.2-0.1c0,0,0.1,0,0.1-0.1c0,0,0-0.1,0.1-0.1c0.2-0.1,0.4-0.1,0.6-0.2c0,0,0.1,0,0.1,0c0.1,0,0.2-0.1,0.3-0.2 c0,0,0,0,0,0l0,0c0,0,0,0,0,0c0.2,0,0.4-0.1,0.5-0.1c0,0,0,0,0,0c0.1,0,0.1,0,0.2,0c0.2,0,0.3-0.1,0.3-0.3c0.5-0.2,0.9-0.4,1.4-0.5 c0.1,0,0.2,0,0.2,0c0,0,0.1,0,0.1,0c0,0,0.1-0.1,0.1-0.1c0,0,0,0,0.1,0c0,0,0.1,0,0.1,0c0.2,0.1,0.4,0.1,0.6,0 c0.1,0,0.1-0.1,0.2-0.2c0.1-0.1,0.1-0.2,0.1-0.3c0.5-0.2,1-0.4,1.6-0.7c1.5-0.7,3.1-1.4,4.7-1.9c4.8-1.5,9.1-3.4,12.8-6.3 c0.8-0.2,1.2-0.5,1.6-1c0.2-0.3,0.4-0.6,0.5-0.9c0.5-0.1,0.7-0.2,0.9-0.5c0.2-0.2,0.2-0.5,0.3-0.9c0-0.1,0-0.1,0.1-0.1 c0.5,0,0.6-0.3,0.8-0.5C162.3,24,163,22,162.5,19.9z M4.4,28.7c-0.2-0.4-0.3-0.9-0.1-1.2c1.8-2.9,3.4-6,6.8-8 c2.8-1.7,5.9-2.9,8.9-4.2c4.3-1.8,9-2.5,13.6-3.4c0,0.1,0,0.2,0,0.2l0,0c-1.1,0.4-2.2,0.7-3.2,1.1c-3.3,1.1-6.5,2.1-9.7,3.4 c-4.2,1.6-7.6,4.2-10.1,7.5c-0.5,0.7-1,1.3-1.6,2c-2.2,2.7-1,4.7,1.2,6.9c0.1,0.1,0.3,0.3,0.4,0.5C7.8,32.5,5.5,31.2,4.4,28.7z  M158.2,23.8c-1.7,2.8-4.1,5.1-7,6.8c-2,1.2-4.5,2.1-6.9,2.9c-3.3,1-6.4,2.4-9.5,3.7c-3.9,1.6-8.1,2.5-12.4,2.9 c-6,0.5-11.8,1.5-17.6,2.5c-4.8,0.8-9.8,1-14.7,1.5c-5.6,0.6-11.2,0.2-16.8,0.1c-3.1-0.1-6.3,0.3-9.4,0.5c-2.6,0.2-5.2,0.1-7.8-0.1 c-3.9-0.3-7.8-0.5-11.7-0.9c-2.8-0.3-5.5-0.7-8.2-1.4c-3.2-0.8-6.3-1.7-9.5-2.5c-0.5-0.1-1-0.3-1.4-0.5c-0.2-0.1-0.4-0.1-0.6-0.2 c0,0,0.1,0,0.1,0c0.3-0.1,0.5,0,0.7,0.1c0,0,0,0,0,0c3.4,0.5,6.9,1.2,10.3,1.4c0.5,0,1,0,1.5,0c0.5,0,1.3,0.2,1.3-0.3 c0-0.6-0.7-0.9-1.4-0.9c-2.1,0-4.2-0.2-6.3-0.5c-4.6-0.7-9.1-1.5-13.4-3c-2.9-1.1-5.4-2.7-6.9-5.2c-0.5-0.8-0.5-1.6-0.1-2.4 c3.2-6.2,9-9.8,16.3-12.2c6.7-2.2,13.2-4.5,20.2-6c5-1.1,10-1.8,15-2.9c8.5-1.9,17.2-2.4,26-2.7c3.6-0.1,7.1-0.8,10.8-0.6 c8.4,0.7,16.7,1.2,25,2.3c4.5,0.6,9,1.2,13.6,1.7c3.6,0.4,7.1,1.4,10.5,2.8c3.1,1.3,6,2.9,8.5,5C159.1,17.7,159.8,21.1,158.2,23.8z"/>
							</svg>
						</span>
                        <!-- SVG END -->
					</span>
                </h2>
            </div>
        </div>
        <div class="row">
            <!-- Main content START -->
            <div class="col-12">

                <!-- Course list START -->
                <div class="row g-4">

                    <!-- Card START -->
                    <%
                        try {
                            String Driver = application.getInitParameter("Driver");
                            String Database = application.getInitParameter("Database");
                            String Username = application.getInitParameter("Username");

                            Class.forName(Driver);
                            Connection con = DriverManager.getConnection(Database, Username, "");
                            Statement st = con.createStatement();
                            String sql = "SELECT fp.fname, fp.fimage, fp.fqualification, cp.chours, cp.camount, cp.ctype, cp.cname, cp.cimage, cp.cid " +
                                    "FROM cource_playlist cp " +
                                    "JOIN faculty_profile fp ON cp.cfacultyname = fp.fname " +
                                    "WHERE cp.cid IN (SELECT course_id FROM user_courses WHERE user_id = ?)";
                            PreparedStatement pstmt = con.prepareStatement(sql);
                            pstmt.setInt(1, sid);
                            ResultSet rs = pstmt.executeQuery();

                            while (rs.next()) {
                                int cid = rs.getInt("cid");
                                String fname = rs.getString("fname");
                                String camount = rs.getString("camount");
                                String ctype = rs.getString("ctype");
                                String fqualification = rs.getString("fqualification");
                                byte[] Fimage = rs.getBytes("fimage");
                                int chours = rs.getInt("chours");
                                String cname = rs.getString("cname");
                                byte[] Cimage = rs.getBytes("cimage");

                                // Convert byte array to Base64 encoded string
                                String base64Image = java.util.Base64.getEncoder().encodeToString(Fimage);
                                String FacultyImage = "data:image/jpeg;base64," + base64Image;

                                String base64Imagee = java.util.Base64.getEncoder().encodeToString(Cimage);
                                String CourseImage = "data:image/jpeg;base64," + base64Imagee;

                    %>
                    <div class="col-md-6 col-xl-4">
                        <div class="card shadow-hover overflow-hidden bg-transparent">
                            <div class="position-relative">
                                <!-- Image -->
                                <img class="card-img-top" src="<%= CourseImage%>" alt="Card image" style="object-fit: cover;height: 50vh">
                                <!-- Overlay -->
                                <div class="bg-overlay bg-dark opacity-4"></div>
                                <div class="card-img-overlay d-flex align-items-start flex-column">
                                    <!-- Card overlay bottom -->
                                    <div class="w-100 mt-auto d-inline-flex">
                                        <div class="d-flex align-items-center bg-white p-2 rounded-2">
                                            <!-- Avatar -->
                                            <div class="avatar avatar-sm me-2">
                                                <img class="avatar-img rounded-1" src="<%= FacultyImage%>" alt="avatar" style="object-fit: cover">
                                            </div>
                                            <!-- Avatar info -->
                                            <div class="p-2">
                                                <h6 class="mb-0"><a href="instructor-single.html" class="text-dark"><%= fname%></a></h6>
                                                <span class="small"><%= fqualification%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card body -->
                            <div class="card-body">
                                <!-- Title -->
                                <h5 class="card-title"><%= cname%></h5>
                                <!-- Divider -->
                                <hr>
                                <!-- Time -->
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <a href="./?sp_name=lc&ci=<%= cid%>&cn=<%= cname%>" class="btn btn-outline-primary mb-0">Watch</a>
                                    <span class="h6 fw-light mb-0 me-3"><i class="far fa-clock text-danger me-2"></i> <%= chours%> hours</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <!-- Card END -->

                </div>
                <!-- Course list END -->
            </div>
            <!-- Main content END -->
        </div>

        <!-- Row END -->
    </div>
</section>
<!-- =======================
Page content END -->

<!-- =======================
Action box START -->
<section class="pt-0">
    <div class="container position-relative">
        <!-- SVG -->
        <figure class="position-absolute top-50 start-50 translate-middle ms-3">
            <svg>
                <path d="m496 22.999c0 10.493-8.506 18.999-18.999 18.999s-19-8.506-19-18.999 8.507-18.999 19-18.999 18.999 8.506 18.999 18.999z" fill="#fff" fill-rule="evenodd" opacity=".502"/>
                <path d="m775 102.5c0 5.799-4.701 10.5-10.5 10.5-5.798 0-10.499-4.701-10.499-10.5 0-5.798 4.701-10.499 10.499-10.499 5.799 0 10.5 4.701 10.5 10.499z" fill="#fff" fill-rule="evenodd" opacity=".102"/>
                <path d="m192 102c0 6.626-5.373 11.999-12 11.999s-11.999-5.373-11.999-11.999c0-6.628 5.372-12 11.999-12s12 5.372 12 12z" fill="#fff" fill-rule="evenodd" opacity=".2"/>
                <path d="m20.499 10.25c0 5.66-4.589 10.249-10.25 10.249-5.66 0-10.249-4.589-10.249-10.249-0-5.661 4.589-10.25 10.249-10.25 5.661-0 10.25 4.589 10.25 10.25z" fill="#fff" fill-rule="evenodd" opacity=".2"/>
            </svg>
        </figure>

        <div class="bg-success p-4 p-sm-5 rounded-3">
            <div class="row justify-content-center position-relative">
                <!-- Svg -->
                <figure class="fill-white opacity-1 position-absolute top-50 start-0 translate-middle-y">
                    <svg width="141px" height="141px">
                        <path	d="M140.520,70.258 C140.520,109.064 109.062,140.519 70.258,140.519 C31.454,140.519 -0.004,109.064 -0.004,70.258 C-0.004,31.455 31.454,-0.003 70.258,-0.003 C109.062,-0.003 140.520,31.455 140.520,70.258 Z"/>
                    </svg>
                </figure>
                <!-- Action box -->
                <div class="col-11 position-relative">
                    <div class="row align-items-center">
                        <!-- Title -->
                        <div class="col-lg-7">
                            <h3 class="text-white">Become an Instructor!</h3>
                            <p class="text-white mb-3 mb-lg-0">Speedily say has suitable disposal add boy. On forth doubt miles of child. Exercise joy man children rejoiced. Yet uncommonly his ten who diminution astonished.</p>
                        </div>
                        <!-- Button -->
                        <div class="col-lg-5 text-lg-end">
                            <a href="#" class="btn btn-dark mb-0">Start Teaching today</a>
                        </div>
                    </div>
                </div>
            </div> <!-- Row END -->
        </div>
    </div>
</section>
<!-- =======================
Action box END -->

</body>
</html>
