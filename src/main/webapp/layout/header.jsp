<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 25/08/2023
  Time: 8:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
  <!-- Bootstrap Core CSS -->
  <link href="/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="/css/metisMenu.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="/css/startmin.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="navbar-header">
    <a class="navbar-brand" href="/">Startmin</a>
  </div>

  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>

  <ul class="nav navbar-nav navbar-left navbar-top-links">
    <li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
  </ul>

  <ul class="nav navbar-right navbar-top-links">
    <li class="dropdown navbar-inverse">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
      </a>
    </li>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        Hello ${user}!
      </a>
    </li>
    <li>
      <a href="/logout">Logout</a>
    </li>
  </ul>
  <!-- /.navbar-top-links -->
</nav>

<aside class="sidebar navbar-default" role="navigation">
  <div class="sidebar-nav navbar-collapse">
    <ul class="nav" id="side-menu" style="display: block">
      <li class="sidebar-search">
        <div class="input-group custom-search-form">
          <input type="text" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
        </div>
        <!-- /input-group -->
      </li>
      <li>
        <a href="/"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
      </li>
      <li>
        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
          <li>
            <a href="/list">Employee List</a>
          </li>
          <li>
            <a href="/employee">Add Employee</a>
          </li>
        </ul>
        <!-- /.nav-second-level -->
      </li>
    </ul>
  </div>
  <!-- /.sidebar-collapse -->
</aside>
<!-- /.sidebar -->

<script src="../js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../js/startmin.js"></script>
</body>
</html>
