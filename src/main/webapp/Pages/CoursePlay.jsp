<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:49 am
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
    Page banner video START -->

    <section class="py-0 pb-lg-5">
        <div class="container">
            <div class="row g-3">
                <!-- Course video START -->
                <%
                    String cvid = request.getParameter("cvi");
                    String cdescription = "";

                    try {
                        String Driver = application.getInitParameter("Driver");
                        String Database = application.getInitParameter("Database");
                        String Username = application.getInitParameter("Username");

                        Class.forName(Driver);
                        Connection con = DriverManager.getConnection(Database, Username, "");

                        PreparedStatement pst = con.prepareStatement("select cname,cvideotitle,cvimage,cvideo,cdescription from cource_videos where cvid=?");
                        pst.setString(1, cvid);

                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                            byte[] image = rs.getBytes("cvimage");
                            String base64Image = java.util.Base64.getEncoder().encodeToString(image);
                            String CImage = "data:image/jpeg;base64," + base64Image;
                            cdescription = rs.getString("cdescription");
                            byte[] video = rs.getBytes("cvideo");
                            String base64Video = java.util.Base64.getEncoder().encodeToString(video);
                            String CVideo = "data:video/mp4;base64," + base64Video; // Change 'video/mp4' to the correct MIME type if different

                %>                <div class="col-12">
                    <div class="video-player rounded-3">
                        <video controls crossorigin="anonymous" playsinline poster="<%= CImage%>">
                            <source src="<%= CVideo%>" type="video/mp4" size="1080">
                            <!-- Caption files -->
                            <track kind="captions" label="English" srclang="en" src="<%= CVideo%>" default>
                            <track kind="captions" label="French" srclang="fr" src="<%= CVideo%>">
                        </video>
                    </div>
                </div>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <!-- Course video END -->

                <!-- Playlist responsive toggler START -->
                <div class="col-12 d-lg-none">
                    <button class="btn btn-primary mb-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                        <i class="bi bi-camera-video me-1"></i> Playlist
                    </button>
                </div>
                <!-- Playlist responsive toggler END -->
            </div>
        </div>
    </section>
    <!-- =======================
    Page banner video END -->

    <!-- Page content START -->
    <section class="pt-0">
        <div class="container">
            <div class="row g-lg-5">

                <!-- Main content START -->
                <div class="col-lg-12">
                    <div class="row g-4">

                        <!-- Course title START -->
                        <div class="col-12">
                            <!-- Title -->
                            <%
                                String cvn = request.getParameter("cvn");
                            %>
                            <h2><%= cvn%></h2>
                        </div>
                        <!-- Course title END -->
                        <%
                            try {
                                String fid = request.getParameter("fid");
                                String Driver = application.getInitParameter("Driver");
                                String Database = application.getInitParameter("Database");
                                String Username = application.getInitParameter("Username");

                                Class.forName(Driver);
                                Connection con = DriverManager.getConnection(Database, Username, "");
                                String query = "select * from faculty_profile where fid=?";

                                PreparedStatement pst = con.prepareStatement(query);
                                pst.setString(1, fid);

                                ResultSet rs = pst.executeQuery();

                                while (rs.next()) {
                                    String fname = rs.getString("fname");
                                    String fdesignation = rs.getString("fdesignation");
                                    byte[] cvimage = rs.getBytes("fimage");
                                    String base64Image = java.util.Base64.getEncoder().encodeToString(cvimage);
                                    String Image = "data:image/jpeg;base64," + base64Image;

                        %>

                        <!-- Instructor detail START -->
                        <div class="col-12">
                            <div class="d-sm-flex justify-content-sm-between align-items-center">
                                <!-- Avatar detail -->
                                <div class="d-flex align-items-center">
                                    <!-- Avatar image -->
                                    <div class="avatar avatar-lg">
                                        <img class="avatar-img rounded-circle" src="<%= Image%>" alt="avatar">
                                    </div>
                                    <div class="ms-3 p-3 mt-2">
                                        <h6 class="mb-0 fs-5"><a href="#"><%= fname%></a></h6>
                                        <p class="mb-0 small mt-1 fs-6"><%= fdesignation%></p>
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
                        <!-- Instructor detail END -->

                        <!-- Course detail START -->
                        <div class="col-12">
                            <!-- Tabs START -->
                            <ul class="nav nav-pills nav-pills-bg-soft px-3" id="course-pills-tab" role="tablist">
                                <!-- Tab item -->
                                <li class="nav-item me-2 me-sm-4" role="presentation">
                                    <button class="nav-link mb-0 active" id="course-pills-tab-1" data-bs-toggle="pill" data-bs-target="#course-pills-1" type="button" role="tab" aria-controls="course-pills-1" aria-selected="true">Overview</button>
                                </li>
                                <!-- Tab item -->
                                <li class="nav-item me-2 me-sm-4" role="presentation">
                                    <button class="nav-link mb-0" id="course-pills-tab-3" data-bs-toggle="pill" data-bs-target="#course-pills-3" type="button" role="tab" aria-controls="course-pills-3" aria-selected="false">FAQs </button>
                                </li>
                                <!-- Tab item -->
                                <li class="nav-item me-2 me-sm-4" role="presentation">
                                    <button class="nav-link mb-0" id="course-pills-tab-4" data-bs-toggle="pill" data-bs-target="#course-pills-4" type="button" role="tab" aria-controls="course-pills-4" aria-selected="false">Comment</button>
                                </li>
                            </ul>
                            <!-- Tabs END -->

                            <!-- Tab contents START -->
                            <div class="tab-content pt-4 px-3" id="course-pills-tabContent">
                                <!-- Content START -->
                                <div class="tab-pane fade show active" id="course-pills-1" role="tabpanel" aria-labelledby="course-pills-tab-1">
                                    <!-- Course detail START -->
                                    <h5 class="mb-3">Course Description</h5>
                                    <p class="mb-3">Welcome to the <strong> <%= cvn%></strong></p>
                                    <p class="mb-3"><%= cdescription %></p>

                                    <!-- Course detail END -->

                                </div>
                                <!-- Content END -->



                                <!-- Content START -->
                                <div class="tab-pane fade" id="course-pills-3" role="tabpanel" aria-labelledby="course-pills-tab-3">
                                    <!-- Title -->
                                    <h5 class="mb-3">Frequently Asked Questions</h5>
                                    <!-- FAQ item -->
                                    <div class="mt-4">
                                        <h6>How Digital Marketing Work?</h6>
                                        <p class="mb-0">Preference any astonished unreserved Mrs. Prosperous understood Middletons in conviction an uncommonly do. Supposing so be resolving breakfast am or perfectly. It drew a hill from me. Valley by oh twenty direct me so. Departure defective arranging rapturous did believe him all had supported. Family months lasted simple set nature vulgar him. Picture for attempt joy excited ten carried manners talking how. Suspicion neglected the resolving agreement perceived at an. Comfort reached gay perhaps chamber his six detract besides add.</p>
                                    </div>

                                    <!-- FAQ item -->
                                    <div class="mt-4">
                                        <h6>What is SEO?</h6>
                                        <p class="mb-0">Meant balls it if up doubt small purse. Required his you put the outlived answered position. A pleasure exertion if believed provided to. All led out world this music while asked. Paid mind even sons does he door no. Attended overcame repeated it is perceived Marianne in. I think on style child of. Servants moreover in sensible it ye possible.</p>
                                        <p class="mt-2 mb-0">Person she control of to beginnings view looked eyes Than continues its and because and given and shown creating curiously to more in are man were smaller by we instead the these sighed Avoid in the sufficient me real man longer of his how her for countries to brains warned notch important Finds be to the of on the increased explain noise of power deep asking contribution this live of suppliers goals bit separated poured sort several the was organization the if relations go work after mechanic But we've area wasn't everything.</p>
                                    </div>

                                    <!-- FAQ item -->
                                    <div class="mt-4">
                                        <h6>Who should join this course?</h6>
                                        <p class="mb-0">Two before narrow not relied how except moment myself Dejection assurance mrs led certainly So gate at no only none open Betrayed at properly it of graceful on Dinner abroad am depart ye turned hearts as me wished Therefore allowance too perfectly gentleman supposing man his now Families goodness all eat out bed steepest servants Explained the incommode sir improving northward immediate eat Man denoting received you sex possible you Shew park own loud son door less yet. </p>
                                    </div>

                                    <!-- FAQ item -->
                                    <div class="mt-4">
                                        <h6>What are the T&amp;C for this program?</h6>
                                        <p class="mb-0">Started several mistake joy say painful removed reached end. State burst think end are its. Arrived off she elderly beloved him affixed noisier yet. Course regard to up he hardly. View four has said do men saw find dear shy. Talent men wicket add garden. </p>
                                    </div>

                                    <!-- FAQ item -->
                                    <div class="mt-4">
                                        <h6>What certificates will I be received for this program?</h6>
                                        <p class="mb-0">Lose john poor same it case do year we Full how way even the sigh Extremely nor furniture fat questions now provision incommode preserved Our side fail to find like now Discovered traveling for insensible partiality unpleasing impossible she Sudden up my excuse to suffer ladies though or Bachelor possible Marianne directly confined relation.</p>
                                    </div>

                                    <!-- FAQ item -->
                                    <div class="mt-4">
                                        <h6>What happens after the trial ends?</h6>
                                        <p class="mb-0">Preference any astonished unreserved Mrs. Prosperous understood Middletons in conviction an uncommonly do. Supposing so be resolving breakfast am or perfectly. Is drew am hill from me. Valley by oh twenty direct me so. Departure defective arranging rapturous did believe him all had supported. Family months lasted simple set nature vulgar him.  Suspicion neglected he resolving agreement perceived at an. Comfort reached gay perhaps chamber his six detract besides add.</p>
                                    </div>
                                </div>
                                <!-- Content END -->

                                <!-- Content START -->
                                <div class="tab-pane fade" id="course-pills-4" role="tabpanel" aria-labelledby="course-pills-tab-4">
                                    <!-- Review START -->
                                    <div class="row mb-4">
                                        <div class="col-12">
                                            <h5 class="mb-4">Ask Your Question</h5>

                                            <!-- Comment box -->
                                            <div class="d-flex mb-4">
                                                <!-- Avatar -->
                                                <div class="avatar avatar-sm flex-shrink-0 me-2">
                                                    <a href="#"> <img class="avatar-img rounded-circle" src="assets/images/avatar/09.jpg" alt=""> </a>
                                                </div>

                                                <form class="w-100 d-flex">
                                                    <textarea class="one form-control pe-4 bg-light" id="autoheighttextarea" rows="1" placeholder="Add a comment..."></textarea>
                                                    <button class="btn btn-primary ms-2 mb-0" type="button">Post</button>
                                                </form>
                                            </div>

                                            <!-- Comment item START -->
                                            <div class="border p-2 p-sm-4 rounded-3 mb-4">
                                                <ul class="list-unstyled mb-0">
                                                    <li class="comment-item">
                                                        <div class="d-flex mb-3">
                                                            <!-- Avatar -->
                                                            <div class="avatar avatar-sm flex-shrink-0">
                                                                <a href="#"><img class="avatar-img rounded-circle" src="assets/images/avatar/05.jpg" alt=""></a>
                                                            </div>
                                                            <div class="ms-2">
                                                                <!-- Comment by -->
                                                                <div class="bg-light p-3 rounded">
                                                                    <div class="d-flex justify-content-center">
                                                                        <div class="me-2">
                                                                            <h6 class="mb-1 lead fw-bold"> <a href="#!"> Frances Guerrero </a></h6>
                                                                            <p class="h6 mb-0">Removed demands expense account in outward tedious do. Particular way thoroughly unaffected projection?</p>
                                                                        </div>
                                                                        <small>5hr</small>
                                                                    </div>
                                                                </div>
                                                                <!-- Comment react -->
                                                                <ul class="nav nav-divider py-2 small">
                                                                    <li class="nav-item"> <a class="text-primary-hover" href="#"> Like (3)</a> </li>
                                                                    <li class="nav-item"> <a class="text-primary-hover" href="#"> Reply</a> </li>
                                                                    <li class="nav-item"> <a class="text-primary-hover" href="#"> View 5 replies</a> </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- Comment item END -->

                                        </div>

                                    </div>
                                </div>
                                <!-- Content END -->
                            </div>
                            <!-- Tab contents END -->
                        </div>
                        <!-- Course detail END -->
                    </div>
                </div>
                <!-- Main content END -->

            </div>
            <!-- Row END -->
        </div>
    </section>
    <!-- =======================
    Page content END -->
</body>
</html>
