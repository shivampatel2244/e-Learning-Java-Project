<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from eduport.webestica.com/rtl/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 May 2024 02:01:04 GMT -->
<head>
    <title>Eduport - LMS, Education and Course Theme</title>

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">

    <!-- Dark mode -->
    <script>

        document.addEventListener('DOMContentLoaded', () => {
            const storedTheme = localStorage.getItem('theme');

            const getPreferredTheme = () => {
                if (storedTheme) {
                    return storedTheme;
                }
                return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
            };

            const setTheme = (theme) => {
                if (theme === 'auto') {
                    theme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
                }
                document.documentElement.setAttribute('data-bs-theme', theme);
            };

            setTheme(getPreferredTheme());

            const themeIconActive = document.querySelector('.theme-icon-active');
            if (themeIconActive) {
                const showActiveTheme = (theme) => {
                    const activeThemeIcon = document.querySelector('.theme-icon-active use');
                    const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`);
                    if (btnToActive) {
                        const svgOfActiveBtn = btnToActive.querySelector('.mode-switch use').getAttribute('href');

                        document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
                            element.classList.remove('active');
                        });

                        btnToActive.classList.add('active');
                        activeThemeIcon.setAttribute('href', svgOfActiveBtn);
                    }
                };

                window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
                    if (storedTheme !== 'light' && storedTheme !== 'dark') {
                        setTheme(getPreferredTheme());
                    }
                });

                showActiveTheme(getPreferredTheme());

                document.querySelectorAll('[data-bs-theme-value]').forEach(toggle => {
                    toggle.addEventListener('click', () => {
                        const theme = toggle.getAttribute('data-bs-theme-value');
                        localStorage.setItem('theme', theme);
                        setTheme(theme);
                        showActiveTheme(theme);
                    });
                });
            }
        });

    </script>
<%--    <script>--%>
<%--        const storedTheme = localStorage.getItem('theme')--%>

<%--        const getPreferredTheme = () => {--%>
<%--            if (storedTheme) {--%>
<%--                return storedTheme--%>
<%--            }--%>
<%--            return window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'light'--%>
<%--        }--%>

<%--        const setTheme = function (theme) {--%>
<%--            if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {--%>
<%--                document.documentElement.setAttribute('data-bs-theme', 'dark')--%>
<%--            } else {--%>
<%--                document.documentElement.setAttribute('data-bs-theme', theme)--%>
<%--            }--%>
<%--        }--%>

<%--        setTheme(getPreferredTheme())--%>

<%--        window.addEventListener('DOMContentLoaded', () => {--%>
<%--            var el = document.querySelector('.theme-icon-active');--%>
<%--            if(el != 'undefined' && el != null) {--%>
<%--                const showActiveTheme = theme => {--%>
<%--                    const activeThemeIcon = document.querySelector('.theme-icon-active use')--%>
<%--                    const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)--%>
<%--                    const svgOfActiveBtn = btnToActive.querySelector('.mode-switch use').getAttribute('href')--%>

<%--                    document.querySelectorAll('[data-bs-theme-value]').forEach(element => {--%>
<%--                        element.classList.remove('active')--%>
<%--                    })--%>

<%--                    btnToActive.classList.add('active')--%>
<%--                    activeThemeIcon.setAttribute('href', svgOfActiveBtn)--%>
<%--                }--%>

<%--                window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {--%>
<%--                    if (storedTheme !== 'light' || storedTheme !== 'dark') {--%>
<%--                        setTheme(getPreferredTheme())--%>
<%--                    }--%>
<%--                })--%>

<%--                showActiveTheme(getPreferredTheme())--%>

<%--                document.querySelectorAll('[data-bs-theme-value]')--%>
<%--                    .forEach(toggle => {--%>
<%--                        toggle.addEventListener('click', () => {--%>
<%--                            const theme = toggle.getAttribute('data-bs-theme-value')--%>
<%--                            localStorage.setItem('theme', theme)--%>
<%--                            setTheme(theme)--%>
<%--                            showActiveTheme(theme)--%>
<%--                        })--%>
<%--                    })--%>

<%--            }--%>
<%--        })--%>

<%--    </script>--%>



    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&amp;family=Roboto:wght@400;500;700&amp;display=swap">

    <!-- Plugins CSS -->
    <link rel="stylesheet" type="text/css" href="assets/vendor/font-awesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/choices/css/choices.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/aos/aos.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/plyr/plyr.css" />
    <link rel="stylesheet" type="text/css" href="assets/vendor/tiny-slider/tiny-slider.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/glightbox/css/glightbox.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/aos/aos.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/style-rtl.css">

</head>

<body>

<!-- Header START -->
<header class="navbar-light navbar-sticky">
    <jsp:include page="Component/Header.jsp"/>
</header>
<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>
    <%
        String pageName = request.getParameter("sp_name");

        if (pageName != null) {
            switch (pageName) {
                case "hm":
    %>
    <jsp:include page="./Pages/MainHome.jsp"/>
    <%
            break;
        case "fc":
    %>
    <jsp:include page="./Pages/FreeCourse.jsp"/>
    <%
            break;
        case "lc":
    %>
    <jsp:include page="./Pages/Lecture.jsp"/>
    <%
            break;
        case "pc":
    %>
    <jsp:include page="./Pages/PaidCourse.jsp"/>
    <%
            break;
        case "co":
    %>
    <jsp:include page="./Pages/CheckOut.jsp"/>
    <%
            break;
        case "fl":
    %>
    <jsp:include page="./Pages/Faculty.jsp"/>
    <%
            break;
        case "fd":
    %>
    <jsp:include page="./Pages/FacultyDetails.jsp"/>
    <%
            break;
        case "au":
    %>
    <jsp:include page="./Pages/About.jsp"/>
    <%
            break;
        case "cu":
    %>
    <jsp:include page="./Pages/ContactUs.jsp"/>
    <%
            break;
        case "cp":
    %>
    <jsp:include page="./Pages/CoursePlay.jsp"/>
    <%
            break;
        case "vp":
    %>
    <jsp:include page="/Pages/ViewProfile.jsp" />
    <%
            break;
        case "purc":
    %>
    <jsp:include page="/Pages/PurchasedCourse.jsp" />
    <%
            break;
        case "ph":
    %>
    <jsp:include page="/Pages/PaymentHistory.jsp" />
    <%
            break;
        case "ep":
    %>
    <jsp:include page="/Pages/EditProfile.jsp"/>
    <%
            break;
        case "se":
    %>
    <jsp:include page="/Pages/ResetPassword.jsp"/>
    <%
            break;
        case "ResetPass":
    %>
    <jsp:include page=""/>
    <%
            break;
        default:
            // Page not found, show 404 error
            response.setStatus(404); // Set HTTP 404 status
    %>
    <jsp:forward page=""/>
    <%
                break;
        }
    } else {
        // Default to Dashboard if no pageName parameter provided
    %>
    <%--    <jsp:include page="/Pages/Dashboard.jsp"/>--%>
    <jsp:include page="./Pages/MainHome.jsp"/>
    <%
        }
    %>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<footer class="bg-dark pt-5">
    <jsp:include page="Component/Footer.jsp"/>
</footer>
<!-- =======================
Footer END -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="assets/vendor/tiny-slider/tiny-slider-rtl.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/choices/js/choices.min.js"></script>
<script src="assets/vendor/plyr/plyr.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

</body>

<!-- Mirrored from eduport.webestica.com/rtl/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 May 2024 02:01:11 GMT -->
</html>