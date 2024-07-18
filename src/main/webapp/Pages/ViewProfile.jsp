<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 17-07-2024
  Time: 02:48 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                                <img class="avatar-img rounded-circle border border-white border-3 shadow" src="assets/images/avatar/12.jpg" alt="">
                            </div>
                        </div>
                        <!-- Profile info -->
                        <div class="col d-sm-flex justify-content-between align-items-center">
                            <div style="padding-left: 0px !important;">
                                <h1 class="my-1 fs-4" style="padding: 16px !important;">Shivam Menpara</h1>
                                <ul class="list-inline mb-0" style="padding: 0px;">
                                    <li class="list-inline-item me-3 mb-1 mb-sm-0">
                                        <span class="h6">shivpatel6379@gmail.com</span>
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

                <!-- Advanced filter responsive toggler START -->
                <!-- Divider -->
                <hr class="d-xl-none">
                <div class="col-12 col-xl-3 d-flex justify-content-between align-items-center">
                    <a class="h6 mb-0 fw-bold d-xl-none" href="#">Menu</a>
                    <button class="btn btn-primary d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                        <i class="fas fa-sliders-h"></i>
                    </button>
                </div>
                <!-- Advanced filter responsive toggler END -->
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
                </div>
                <!-- Responsive offcanvas body END -->
            </div>
            <!-- Left sidebar END -->
        </div>
    </div>
</section>
<!-- =======================
Page content END -->

</body>
</html>

</body>
</html>
