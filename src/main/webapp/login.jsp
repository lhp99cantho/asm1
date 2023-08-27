<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <style>
        .main {
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12 mt-5">
            <h3 class="text-center">Login</h3>
            <hr>
        </div>

        <div class="main col-md-6 mt-3">
            <div class="card">
                <div class="card-body">
                    <c:if test="${error != null}">
                        <p class="text-danger">${error}</p>
                    </c:if>

                    <div id="errorMessage" style="color: red;"></div>

                    <form id="loginForm" action="/login" method="POST">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" value="${username}" id="username"
                                   class="form-control ${usernameError != null ? 'is-invalid' : ''}" name="username">
                            <c:if test="${usernameError != null}">
                                <p class="text-danger">${usernameError}</p>
                            </c:if>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" value="${password}" id="password"
                                   class="form-control ${passwordError != null ? 'is-invalid' : ''}" name="password">
                            <c:if test="${passwordError != null}">
                                <p class="text-danger">${passwordError}</p>
                            </c:if>
                        </div>

                        <a href="/forgot-password">Forgot password?</a> <br>

                        <button type="submit" class="btn btn-success mt-2">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
   // JavaScript validation logic here
   document.getElementById("loginForm").onsubmit = function() {
       var username = document.getElementById("username").value;
       var password = document.getElementById("password").value;

      if (username === "" || password === "") {
          errorMessage.innerHTML = "Please enter your username and password!";
          return false; // ngăn form submit
      } else {
         errorMessage.innerHTML = "";
      }
   };
</script>

</body>
</html>
