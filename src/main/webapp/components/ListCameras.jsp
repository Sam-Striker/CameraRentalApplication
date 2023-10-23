<%@ page import="com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.CameraIMPLEMENT" %>
<%@ page import="com.samuel.camerarentapplication.SERVICE.cameraInterf" %>
<%@ page import="com.samuel.camerarentapplication.MODAL.Camera" %>
<%@ page import="java.util.List" %>
<%@ page import="com.samuel.camerarentapplication.MODAL.Users" %><%--
  Created by IntelliJ IDEA.
  User: STRIKER
  Date: 10/23/2023
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Camera Information</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Camera Rental System</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="update.jsp">Update</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="delete.jsp">Delete</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="logout.jsp">Log Out</a>
        </li>
    </ul>
</nav>

<div class="container mt-4">
    <!-- Display Camera Information -->
    <h2>Camera Information</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>id</th>
            <th>Serial Number</th>
            <th>Model</th>
            <th>Lens</th>
            <th>Status</th>
            <th>Rent Status</th>
            <th>Date</th>
            <th>user</th>
        </tr>
        </thead>
        <tbody>
        <!-- Replace with data from your database -->
        <%
            List<Camera> cameras;
            cameraInterf service = new CameraIMPLEMENT();
            cameras = service.retrieveCam();

            for(Camera camera : cameras){
        %>
        <tr>
            <td><%=camera.getId()%></td>
            <td><%=camera.getSerialNbr()%></td>
            <td><%=camera.getModel()%></td>
            <td><%=camera.getLense()%></td>
            <td><%=camera.getStatus()%></td>
            <td><%=camera.getRentStatus()%></td>
            <td><%=camera.getDate()%></td>
            <td><%=camera.getUser() != null ? camera.getUser().getId() : "N/A"%></td>

        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>