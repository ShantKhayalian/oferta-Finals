<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Օֆերդա - Հիմնական վարիչ </title>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Blank Page | Bootstrap Based Admin Template - Material Design</title>
        <!-- Favicon-->
        <link rel="icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet"
              type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

        <!-- Bootstrap Core Css -->
        <link href="<%=request.getContextPath()%>/admin/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Waves Effect Css -->
        <link href="<%=request.getContextPath()%>/admin/plugins/node-waves/waves.css" rel="stylesheet"/>

        <!-- Animation Css -->
        <link href="<%=request.getContextPath()%>/admin/plugins/animate-css/animate.css" rel="stylesheet"/>

        <!-- Custom Css -->
        <link href="<%=request.getContextPath()%>/admin/css/style.css" rel="stylesheet">

        <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
        <link href="<%=request.getContextPath()%>/admin/css/themes/all-themes.css" rel="stylesheet"/>

    </head>
</head>
<body class="theme-deep-purple">
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="preloader">
            <div class="spinner-layer pl-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
        <p>Խնդրում ենք սպասել...</p>
    </div>
</div>
<!-- #END# Page Loader -->
<!-- Overlay For Sidebars -->
<div class="overlay"></div>
<!-- #END# Overlay For Sidebars -->
<!-- Search Bar -->
<div class="search-bar">
    <div class="search-icon">
        <i class="material-icons">search</i>
    </div>
    <input type="text" placeholder="START TYPING...">
    <div class="close-search">
        <i class="material-icons">close</i>
    </div>
</div>
<!-- #END# Search Bar -->
<!-- Top Bar -->
<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse"
               data-target="#navbar-collapse" aria-expanded="false"></a>
            <a href="javascript:void(0);" class="bars"></a>
            <a class="navbar-brand" href="">Օֆերդա - Հիմնական Ադմին</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">

        </div>
    </div>
</nav>
<!-- #Top Bar -->
<section>
    <!-- Left Sidebar -->
    <aside id="leftsidebar" class="sidebar">
        <!-- User Info -->
        <div class="user-info">
            <div class="image">
                <%--<img src="<%=request.getAttribute("adminPhoto")%>" width="100" height="100"
                     alt="<%=request.getAttribute("username")%>"/>--%>
            </div>
            <div class="info-container">
                <div class="name" data-toggle="dropdown" aria-haspopup="true"
                     aria-expanded="false">Բարի օր <%=request.getAttribute("username")%>
                </div>
                <%--<div class="email"><%=request.getAttribute("adminPhoneNumber")%>--%>
            </div>

        </div>
        </div>
        <!-- #User Info -->
        <!-- Menu -->
        <jsp:include page="/include/admin_menu.jsp"/>
        <!-- #Menu -->
        <!-- Footer -->
        <div class="legal">
            <div class="copyright">
                &copy; 2019 - 2020 <a href="javascript:void(0);">ItHome</a>.
            </div>
            <div class="version">
                <b>Տարբերակ: </b> 1.0
            </div>
        </div>
        <!-- #Footer -->
    </aside>
    <!-- #END# Left Sidebar -->
    <!-- Right Sidebar -->

    <!-- #END# Right Sidebar -->
</section>

<section class="content">
    <div class="container-fluid">
        <!-- Input -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <form action="AddRubMonths" method="post">
                        <div class="header">
                            <div class="alert-info ">
                                <%
                                    if (request.getAttribute("message") != null) {
                                %>
                                <%=request.getAttribute("message")%>
                                <%
                                    }
                                %>
                            </div>

                            <h2 class="card-inside-title">Ժամկետային ավանդների տարեկան տոկոսադրույքները RUB</h2>
                            <br>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <!-- /////////////////////////////////////////////////////////////////////////////////Comment Armenian -->
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB1Month" class="form-control"  value="0.0" step="0.01"/>
                                            <label class="form-label">1 ամիս</label>

                                        </div>
                                    </div>

                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB3Month" class="form-control"  value="0.0" step="0.01"/>
                                            <label class="form-label">3 ամիս</label>

                                        </div>
                                    </div>

                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB6Month" class="form-control" value="0.0" step="0.01"/>
                                            <label class="form-label">6 ամիս</label>

                                        </div>
                                    </div>

                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB9Month" class="form-control" value="0.0" step="0.01"/>
                                            <label class="form-label">9 ամիս</label>

                                        </div>
                                    </div>
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB12Month" class="form-control" value="0.0" step="0.01"/>
                                            <label class="form-label">12 ամիս</label>

                                        </div>
                                    </div>
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB18Month" class="form-control" value="0.0" step="0.01"/>
                                            <label class="form-label">18 ամիս</label>

                                        </div>
                                    </div>
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB24Month" class="form-control" value="0.0" step="0.01"/>
                                            <label class="form-label">24 ամիս</label>

                                        </div>
                                    </div>
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="number" name="RUB36Month" class="form-control" value="0.0" step="0.01"/>
                                            <label class="form-label">36 ամիս</label>

                                        </div>
                                    </div>


                                    <div class="col-xs-3">
                                        <button class=" btn bg-orange btn-block btn-lg waves-effect" type="submit">Դեպի
                                            հաջորդ քայլ >>>
                                        </button>
                                        <input type="hidden" name="productcode" value="<%=request.getAttribute("productcode")%>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- #END# Input -->
    </div>
</section>
<section class="content">
    <div class="container-fluid">

    </div>
</section>
<!-- Jquery Core Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap Core Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/bootstrap/js/bootstrap.js"></script>

<!-- Select Plugin Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!-- Slimscroll Plugin Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- Jquery Validation Plugin Css -->
<script src="<%=request.getContextPath()%>/admin/plugins/jquery-validation/jquery.validate.js"></script>

<!-- JQuery Steps Plugin Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/jquery-steps/jquery.steps.js"></script>

<!-- Sweet Alert Plugin Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/sweetalert/sweetalert.min.js"></script>

<!-- Waves Effect Plugin Js -->
<script src="<%=request.getContextPath()%>/admin/plugins/node-waves/waves.js"></script>

<!-- Custom Js -->
<script src="<%=request.getContextPath()%>/admin/js/admin.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/pages/forms/form-wizard.js"></script>

<!-- Demo Js -->
<script src="<%=request.getContextPath()%>/admin/js/demo.js"></script>
</body>

</html>
