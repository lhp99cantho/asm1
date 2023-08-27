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
<%--        <link href="/css/bootstrap.min.css" rel="stylesheet">--%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

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
                            <c:if test="${emp == null}">
                                <h2>Add Employee form</h2>
                            </c:if>
                            <c:if test="${emp!= null}">
                                <h2>View details Employee</h2>
                            </c:if>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading" style="display: flex; justify-content: space-around">
                                    <c:if test="${emp == null}">
                                        <div>Add Employee</div>
                                    </c:if>
                                    <c:if test="${emp!= null}">
                                        <div>View details Employee</div>
                                    </c:if>
                                    <div id="status-add"></div>
                                </div>
                                <div class="panel-body">
                                    <div class="mb-3">
                                        <label for="firstName" class="form-label">First name</label>
                                        <input type="text" class="form-control" id="firstName" placeholder="First name" value="${emp.firstName}">
                                        <p class="text-danger invalid-feedback">Please enter your first name.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="lastName" class="form-label">Last name</label>
                                        <input type="text" class="form-control" id="lastName" placeholder="Last name" value="${emp.lastName}">
                                        <p class="text-danger invalid-feedback">Please enter your last name.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="phoneNumber" class="form-label">Phone number</label>
                                        <input type="text" class="form-control" id="phoneNumber" placeholder="Phone number" value="${emp.phone}">
                                        <p class="text-danger invalid-feedback">Please enter your phone number.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="dateOfBirth" class="form-label">Date of birth</label>
                                        <input type="date" class="form-control" id="dateOfBirth" placeholder="mm/dd/yyyy" value="${emp.dob}">
                                        <p class="text-danger invalid-feedback">Please provide a valid value.</p>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Female
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Male
                                        </label>
                                    </div>
                                    <div class="mb-3">
                                        <label for="account" class="form-label">Account</label>
                                        <input type="text" class="form-control" id="account" placeholder="Account" value="${emp.account.account}">
                                        <p class="text-danger invalid-feedback">Please provide a valid value.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" placeholder="name@example.com" value="${emp.account.email}">
                                        <p class="text-danger invalid-feedback">Please provide a valid email.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" placeholder="Password">
                                        <p class="text-danger invalid-feedback">Must be 8-20 characters long.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">Address</label>
                                        <textarea class="form-control" id="address" rows="3"></textarea>
                                    </div>
                                    <div class="form-check form-switch" style="font-size: 16px">
                                        <input class="form-check-input" type="checkbox" role="switch" id="active">
                                        <label class="form-check-label" for="active">Active</label>
                                    </div>
                                    <select class="form-select" aria-label="Department" id="department" style="font-size: 16px">
                                        <option selected value="">Choose your department.</option>
                                        <option value="Fsoft Academy">Fsoft Academy</option>
                                        <option value="Fsoft">Fsoft</option>
                                        <option value="FPT retail">FPT retail</option>
                                    </select>
                                    <div class="mb-3">
                                        <label for="remark" class="form-label">Remark</label>
                                        <textarea class="form-control" id="remark" rows="3"></textarea>
                                    </div>
                                    <input readonly hidden="hidden" value="${emp.employeeId}" id="employeeId">
                                    <input readonly hidden="hidden" value="${emp.account.accountId}" id="accountId">
                                    <div class="d-grid gap-2 d-md-block" style="margin-top: 18px">
                                        <button class="btn btn-primary" type="button" id="back-btn">Back</button>
                                        <button type="button" class="btn btn-warning" id="reset-btn">Reset</button>

                                            <button type="button" class="btn btn-success" id="add-btn">Add</button>

                                            <button type="button" class="btn btn-success" id="update-btn">Update</button>

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
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
<%--        <script src="/js/jquery.min.js"></script>--%>

        <!-- Bootstrap Core JavaScript -->
        <script src="/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/js/startmin.js"></script>

        <script src="/js/add.js"></script>

    </body>

</html>