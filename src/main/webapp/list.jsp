<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Startmin - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="/css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="/css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
    <jsp:include page="/layout/header.jsp"></jsp:include>
        <div id="wrapper">
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Employee List</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading" style="display: flex; justify-content: space-between">
                                    <div>DataTables</div>
                                    <form class="input-group mb-3 " style="display: flex" action="/list" method="get">
                                        <button class="btn btn-outline-secondary bg-success text-white" type="submit" id="btn-search">Search</button>
                                        <input type="text" class="form-control" placeholder="Enter name employee for searching ..." aria-label="Example text with button addon" aria-describedby="button-addon1" id="input-search" name="search">
                                    </form>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Date of birth</th>
                                                    <th>Address</th>
                                                    <th>Phone number</th>
                                                    <th>Department</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listEmp}" var="emp">
                                                <tr class="gradeA">
                                                    <td>${emp.employeeId}</td>
                                                    <td>${emp.lastName} ${emp.firstName}</td>
                                                    <td>${emp.dob}</td>
                                                    <td class="center">${emp.address}</td>
                                                    <td class="center">${emp.phone}</td>
                                                    <td class="center">${emp.departmentName}</td>
                                                    <td class="center">
                                                        <a type="" class="btn btn-success" href="/employee?view=${emp.employeeId}">
                                                            View
                                                        </a>
                                                        <button type="button" class="btn btn-primary">
                                                            Update
                                                        </button>
                                                        <button type="button" class="btn btn-warning delete-btn" data-id="${emp.employeeId}">
                                                            Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->
            </div>

        </div>
        <!-- /#wrapper -->


        <!-- jQuery -->
        <script src="/js/jquery.min.js"></script>
        <script src="/js/list.js"></script>

        <!-- Bootstrap Core JavaScript -->
<%--        <script src="/js/bootstrap.min.js"></script>--%>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/js/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="/js/jquery.dataTables.min.js"></script>
        <script src="/js/dataTables.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/js/startmin.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
<%--        <script>--%>
<%--            $(document).ready(function () {--%>
<%--                $('#dataTables-example').DataTable({--%>
<%--                    responsive: true--%>
<%--                });--%>
<%--            });--%>
<%--        </script>--%>

    </body>

</html>