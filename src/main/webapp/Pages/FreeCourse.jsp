<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:28 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
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
    <section class="pt-0">
        <div class="container">

            <!-- Filter bar START -->
            <form class="bg-light border p-4 rounded-3 my-4 z-index-9 position-relative">
                <div class="row g-3">
                    <!-- Input -->
                    <div class="col-xl-3">
                        <input class="form-control me-1" type="search" placeholder="Enter keyword">
                    </div>

                    <!-- Select item -->
                    <div class="col-xl-8">
                        <div class="row g-3">
                            <!-- Select items -->
                            <div class="col-sm-6 col-md-3 pb-2 pb-md-0">
                                <select class="form-select form-select-sm js-choice" aria-label=".form-select-sm example">
                                    <option value="">Categories</option>
                                    <option>All</option>
                                    <option>Development</option>
                                    <option>Design</option>
                                    <option>Accounting</option>
                                    <option>Translation</option>
                                    <option>Finance</option>
                                    <option>Legal</option>
                                    <option>Photography</option>
                                    <option>Writing</option>
                                    <option>Marketing</option>
                                </select>
                            </div>

                            <!-- Search item -->
                            <div class="col-sm-6 col-md-3 pb-2 pb-md-0">
                                <select class="form-select form-select-sm js-choice" aria-label=".form-select-sm example">
                                    <option value="">Price level</option>
                                    <option>All</option>
                                    <option>Free</option>
                                    <option>Paid</option>
                                </select>
                            </div>

                            <!-- Search item -->
                            <div class="col-sm-6 col-md-3 pb-2 pb-md-0">
                                <select class="form-select form-select-sm js-choice" aria-label=".form-select-sm example">
                                    <option value="">Skill level</option>
                                    <option>All levels</option>
                                    <option>Beginner</option>
                                    <option>Intermediate</option>
                                    <option>Advanced</option>
                                </select>
                            </div>

                            <!-- Search item -->
                            <div class="col-sm-6 col-md-3 pb-2 pb-md-0">
                                <select class="form-select form-select-sm js-choice" aria-label=".form-select-sm example">
                                    <option value="">Language</option>
                                    <option>English</option>
                                    <option>Francas</option>
                                    <option>Russian</option>
                                    <option>Hindi</option>
                                    <option>Bengali</option>
                                    <option>Spanish</option>
                                </select>
                            </div>
                        </div> <!-- Row END -->
                    </div>
                    <!-- Button -->
                    <div class="col-xl-1">
                        <button type="button" class="btn btn-primary mb-0 rounded z-index-1 w-100"><i class="fas fa-search"></i></button>
                    </div>
                </div> <!-- Row END -->
            </form>
            <!-- Filter bar END -->

            <div class="row g-4">
                <%
                    try {
                        String Driver = application.getInitParameter("Driver");
                        String Database = application.getInitParameter("Database");
                        String Username = application.getInitParameter("Username");

                        Class.forName(Driver);
                        Connection con = DriverManager.getConnection(Database, Username, "");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT fp.fname, fp.fimage,fp.fqualification, cp.chours, cp.ctype,cp.cname, cp.cimage, cp.cid " +
                                "FROM cource_playlist cp " +
                                "JOIN faculty_profile fp ON cp.cfacultyname = fp.fname where ctype = 'free';");

                        while (rs.next()) {
                            int cid = rs.getInt("cid");
                            String fname = rs.getString("fname");
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
                <!-- Card START -->
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
                                            <img class="avatar-img rounded-1" style="object-fit: cover" src="<%= FacultyImage%>" alt="avatar">
                                        </div>
                                        <!-- Avatar info -->
                                        <div class="p-1">
                                            <h6 class="mb-0"><a href="#" class="text-dark"><%= fname%></a></h6>
                                            <span class="small"><%= fqualification %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card body -->
                        <div class="card-body">
                            <!-- Title -->
                            <h5 class="card-title"><a href="./?sp_name=lc&ci=<%= cid%>&cn=<%= cname%>"><%= cname%></a></h5>

                            <!-- Divider -->
                            <hr>
                            <!-- Time -->
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h5 class="text-success mb-0"><%= ctype%></h5>
                                <span class="h6 fw-light mb-0 me-3"><i class="far fa-clock text-danger me-2"></i> <%= chours%> Hours</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Card END -->
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>

            <!-- Row END -->
        </div>
    </section>
    <!-- =======================
    Page content END -->

    <!-- =======================
    Newsletter START -->
    <section class="pt-0">
        <div class="container position-relative overflow-hidden">
            <!-- SVG decoration -->
            <figure class="position-absolute top-50 start-50 translate-middle ms-3">
                <svg>
                    <path class="fill-white opacity-2" d="m496 22.999c0 10.493-8.506 18.999-18.999 18.999s-19-8.506-19-18.999 8.507-18.999 19-18.999 18.999 8.506 18.999 18.999z"/>
                    <path class="fill-white opacity-2" d="m775 102.5c0 5.799-4.701 10.5-10.5 10.5-5.798 0-10.499-4.701-10.499-10.5 0-5.798 4.701-10.499 10.499-10.499 5.799 0 10.5 4.701 10.5 10.499z"/>
                    <path class="fill-white opacity-2" d="m192 102c0 6.626-5.373 11.999-12 11.999s-11.999-5.373-11.999-11.999c0-6.628 5.372-12 11.999-12s12 5.372 12 12z"/>
                    <path class="fill-white opacity-2" d="m20.499 10.25c0 5.66-4.589 10.249-10.25 10.249-5.66 0-10.249-4.589-10.249-10.249-0-5.661 4.589-10.25 10.249-10.25 5.661-0 10.25 4.589 10.25 10.25z"/>
                </svg>
            </figure>
            <!-- Svg decoration -->
            <figure class="position-absolute bottom-0 end-0 mb-5 d-none d-sm-block">
                <svg class="rotate-130" width="258.7px" height="86.9px" viewBox="0 0 258.7 86.9">
                    <path stroke="white" fill="none" stroke-width="2" d="M0,7.2c16,0,16,25.5,31.9,25.5c16,0,16-25.5,31.9-25.5c16,0,16,25.5,31.9,25.5c16,0,16-25.5,31.9-25.5 c16,0,16,25.5,31.9,25.5c16,0,16-25.5,31.9-25.5c16,0,16,25.5,31.9,25.5s16-25.5,31.9-25.5"/>
                    <path stroke="white" fill="none" stroke-width="2" d="M0,57c16,0,16,25.5,31.9,25.5c16,0,16-25.5,31.9-25.5c16,0,16,25.5,31.9,25.5c16,0,16-25.5,31.9-25.5 c16,0,16,25.5,31.9,25.5c16,0,16-25.5,31.9-25.5c16,0,16,25.5,31.9,25.5s16-25.5,31.9-25.5"/>
                </svg>
            </figure>

            <div class="bg-grad-blue p-3 p-sm-5 rounded-3">
                <div class="row justify-content-center position-relative">
                    <!-- SVG decoration -->
                    <figure class="position-absolute top-50 start-0 translate-middle-y">
                        <svg width="141px" height="141px">
                            <path class="fill-white opacity-1" d="M140.520,70.258 C140.520,109.064 109.062,140.519 70.258,140.519 C31.454,140.519 -0.004,109.064 -0.004,70.258 C-0.004,31.455 31.454,-0.003 70.258,-0.003 C109.062,-0.003 140.520,31.455 140.520,70.258 Z"/>
                        </svg>
                    </figure>
                    <!-- Newsletter -->
                    <div class="col-12 position-relative my-2 my-sm-3">
                        <div class="row align-items-center">
                            <!-- Title -->
                            <div class="col-lg-6">
                                <h3 class="text-white mb-3 mb-lg-0">Are you ready for a more great Conversation?</h3>
                            </div>
                            <!-- Input item -->
                            <div class="col-lg-6 text-lg-end">
                                <form class="bg-body rounded p-2">
                                    <div class="input-group">
                                        <input class="form-control border-0 me-1" type="email" placeholder="Type your email here">
                                        <button type="button" class="btn btn-dark mb-0 rounded">Subscribe</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div> <!-- Row END -->
            </div>
        </div>
    </section>
    <!-- =======================
    Newsletter END -->
</body>
</html>
