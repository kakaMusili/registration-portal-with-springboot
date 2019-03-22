<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>andikwa-nasi</title>
</head>
<body>
<div class="container-fluid ">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="/welcome">andikwa-nasi</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
                aria-controls="navbarText"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/login">login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register">New Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/show-users">All Users</a>
                </li>
            </ul>
            <span class="navbar-text white-text">
          <a class="nav-link" href="/login"><i class="fas fa-sign-in-alt"></i>Login</a>
        </span>
        </div>
    </nav>
</div>

<c:choose>
<c:when test="${mode=='MODE_HOME'}">
    <div class="container" id="homediv">
        <div class="jumbotron text-center">
            <h1>Welcome to andika-nasi</h1>
            <h3>register now its free </h3>
        </div>
    </div>
</c:when>

<c:when test="${mode=='MODE_REGISTER'}">
    <div class="container text-center">
        <h3>New Registration</h3>
        <hr>
        <form class="form-horizontal" method="POST" action="save-user">
            <input type="hidden" name="id" value="${user.id }" />
            <div class="form-group">
                <label class="control-label col-md-3">Username</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="userName"
                           value="${user.userName }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">First Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="firstName"
                           value="${user.firstName }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Last Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="lastName"
                           value="${user.lastName }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Age </label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="age"
                           value="${user.age }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">Password</label>
                <div class="col-md-7">
                    <input type="password" class="form-control" name="password"
                           value="${user.password }" />
                </div>
            </div>
            <div class="form-group ">
                <input type="submit" class="btn btn-primary" value="Register" />
            </div>
        </form>
    </div>
</c:when>
    <c:when test="${mode =='ALL_USERS'}">
        <div class="container text-center" id="tasksDiv">
            <h3>All Users</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>UserName</th>
                        <th>First Name</th>
                        <th>LastName</th>
                        <th>Age</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users }">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.userName}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.age}</td>
                            <td><a href="/delete-user?id=${user.id }"><span
                                    class="far fa-trash-alt" style="color: red"></span></a></td>
                            <td><a href="/edit-user?id=${user.id }"><span
                                    class="fas fa-pencil-alt"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </c:when>
    <c:when test="${mode=='MODE_UPDATE' }">
        <div class="container text-center">
            <h3>Update</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="save-user">
                <input type="hidden" name="id" value="${user.id }" />
                <div class="form-group">
                    <label class="control-label col-md-3">Username</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="userName"
                               value="${user.userName }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">First Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="firstName"
                               value="${user.firstName }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Last Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="lastName"
                               value="${user.lastName }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Age </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="age"
                               value="${user.age }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control" name="password"
                               value="${user.password }" />
                    </div>
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Update" />
                </div>
            </form>
        </div>
    </c:when>
    <c:when test="${mode=='MODE_LOGIN'}">
        <div class="container text-center">
            <h3>User Login</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="/login-user">
                <c:if test="${not empty error }">
                    <div class= "alert alert-danger">
                        <c:out value="${error }"></c:out>
                    </div>
                </c:if>
                <div class="form-group">
                    <label class="control-label col-md-3">Username</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="userName"
                               value="${user.userName}" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control" name="password"
                               value="${user.password }" />
                    </div>
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Login" />
                </div>
            </form>
        </div>
    </c:when>
</c:choose>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</body>
</html>