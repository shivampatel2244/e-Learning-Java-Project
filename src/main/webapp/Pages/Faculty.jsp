<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:36 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
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
    Inner part START -->
    <section class="pt-4">
        <div class="container">
            <!-- Search option START -->
            <div class="row mb-4 align-items-center">
                <!-- Search bar -->
                <div class="col-sm-6 col-xl-4">
                    <form class="border rounded p-2">
                        <div class="input-group input-borderless">
                            <input class="form-control me-1" type="search" placeholder="Search instructor">
                            <button type="button" class="btn btn-primary mb-0 rounded"><i class="fas fa-search"></i></button>
                        </div>
                    </form>
                </div>

                <!-- Select option -->
                <div class="col-sm-6 col-xl-3 mt-3 mt-lg-0">
                    <form class="border rounded p-2 input-borderless">
                        <select class="form-select form-select-sm js-choice" aria-label=".form-select-sm">
                            <option value="">Category</option>
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
                    </form>
                </div>

                <!-- Select option -->
                <div class="col-sm-6 col-xl-3 mt-3 mt-xl-0">
                    <form class="border rounded p-2 input-borderless">
                        <select class="form-select form-select-sm js-choice" aria-label=".form-select-sm">
                            <option value="">Sort by</option>
                            <option>Most popular</option>
                            <option>Most viewed</option>
                            <option>Top rated</option>
                        </select>
                    </form>
                </div>

                <!-- Button -->
                <div class="col-sm-6 col-xl-2 mt-3 mt-xl-0 d-grid">
                    <a href="#" class="btn btn-lg btn-primary mb-0">Filter Results</a>
                </div>
            </div>
            <!-- Search option END -->

            <!-- Instructor list START -->
            <div class="row g-4 justify-content-start">
                <%
                    try {
                        String Driver = application.getInitParameter("Driver");
                        String Database = application.getInitParameter("Database");
                        String Username = application.getInitParameter("Username");

                        Class.forName(Driver);
                        Connection con = DriverManager.getConnection(Database, Username, "");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from faculty_profile");

                        while (rs.next()) {
                            int FactId = rs.getInt("fid");
                            String FactName = rs.getString("fname");
                            byte[] imgBytes = rs.getBytes("fimage");
                            String FactDesignation = rs.getString("fdesignation");

                            // Convert byte array to Base64 encoded string
                            String base64Image = java.util.Base64.getEncoder().encodeToString(imgBytes);
                            String imageSrc = "data:image/jpeg;base64," + base64Image;
                %>
                <!-- Card item START -->
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="card p-2">
                            <div class="position-relative">
                                <!-- Image -->
                                <img src="<%= imageSrc %>" class="card-img" alt="course image" style="height: 45vh;object-fit: cover">
                                <!-- Overlay -->
                                <div class="card-img-overlay d-flex flex-column p-3">
                                    <div class="w-100 mt-auto text-end">
                                        <!-- Card category -->
                                        <a href="#" class="badge text-bg-info rounded-1"><i class="fas fa-user-graduate me-2"></i>25</a>
                                        <a href="#" class="badge text-bg-orange rounded-1"><i class="fas fa-clipboard-list me-2"></i>15</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card body -->
                            <div class="card-body text-center">
                                <!-- Title -->
                                <h5 class="card-title"><a href="./?sp_name=fd&fid=<%= FactId%>"><%= FactName%></a></h5>
                                <p class="mb-2"><%= FactDesignation%></p>

                            </div>
                    </div>
                </div>
                <!-- Card item END -->
                <%
                        }
                        rs.close();
                        st.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            <!-- Instructor list END -->

            <!-- Pagination START -->
            <nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
                <ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
                    <li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-double-left"></i></a></li>
                    <li class="page-item mb-0"><a class="page-link" href="#">1</a></li>
                    <li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item mb-0"><a class="page-link" href="#">..</a></li>
                    <li class="page-item mb-0"><a class="page-link" href="#">6</a></li>
                    <li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a></li>
                </ul>
            </nav>
            <!-- Pagination END -->

        </div>
    </section>
    <!-- =======================
    Inner part END -->

    <!-- =======================
    Action box START -->
    <section class="pt-0">
        <div class="container position-relative">
            <!-- SVG -->
            <figure class="position-absolute top-50 start-50 translate-middle ms-2">
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
                            <path d="M140.520,70.258 C140.520,109.064 109.062,140.519 70.258,140.519 C31.454,140.519 -0.004,109.064 -0.004,70.258 C-0.004,31.455 31.454,-0.003 70.258,-0.003 C109.062,-0.003 140.520,31.455 140.520,70.258 Z"/>
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
                </div>
            </div>
        </div>
    </section>
    <!-- =======================
    Action box END -->

</body>
</html>
