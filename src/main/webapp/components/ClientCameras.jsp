
<%@ page import="com.samuel.camerarentapplication.MODAL.Camera" %>
<%@ page import="java.util.List" %>
<%@ page import="com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.CameraIMPLEMENT" %>
<%@ page import="com.samuel.camerarentapplication.SERVICE.cameraInterf" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Camera Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Camera Rental System</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="../components/login.jsp">Log Out</a>
        </li>
    </ul>
</nav>

<div class="container mt-4">
    <h2>Camera Information</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>id</th>
            <th>user</th>
            <th>Serial Number</th>
            <th>Model</th>
            <th>Lens</th>
<%--            <th>Status</th>--%>
            <th>Rent Status</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Camera> cameras;
            cameraInterf service = new CameraIMPLEMENT();
            cameras = service.retrieveCam();

            for(Camera camera : cameras){
                if (camera.getStatus() == 1){
        %>
        <tr>
            <td><%=camera.getId()%></td>
            <td><%=camera.getUser() != null ? camera.getUser().getUsername() : "N/A"%></td>
            <td><%=camera.getSerialNbr()%></td>
            <td><%=camera.getModel()%></td>
            <td><%=camera.getLense()%></td>
<%--            <td><%=camera.getStatus()%></td>--%>
            <td><%=camera.getRentStatus()%></td>
            <td><%=camera.getDate()%></td>
            <td>
                <div class="tdAction">
                    <button class="updateBtn">RENT</button>
                </div>
            </td>
        </tr>
        <%
            }}
        %>
        </tbody>
    </table>

    <div class="actions">
        <form action="../controller/cameraInsertion.jsp" method="post" id="form">
            <h3>Rent Cameras</h3>
            <small style="color: darkred;">${cameraBean.errorMessage}</small>
            <small style="color: green;">${cameraBean.infoMessage}</small>

            <input type="hidden" id="existingId" name="existingId">

            <div class="form-group">
                <label for="serialNbr">Serial Number:</label>
                <input type="text" class="form-control" id="serialNbr" name="serialNbr" required>
            </div>
            <div class="form-group">
                <label for="model">Model:</label>
                <input type="text"  class="form-control" id="model" name="model" required>
            </div>
            <div class="form-group">
                <label for="lense">Lens:</label>
                <input type="text"  class="form-control" id="lense" name="lense" required>
            </div>-
            <div class="form-group" >
                <label for="date">Date:</label>
                <input type="date" class="form-control" id="date" name="date" required>
            </div>

            <input type="submit" id="formBtn" value="Submit" />
        </form>
    </div>
</div>
</body>
</html>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script defer>
    const form = document.getElementById("form");
    const updateButtons = document.querySelectorAll('.updateBtn');
    const existingId = document.getElementById('existingId');
    const serialNbrInput = document.getElementById('serialNbr');
    const modelInput = document.getElementById('model');
    const lenseInput = document.getElementById('lense');
    const dateInput = document.getElementById('date');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            existingId.value = cells[0].textContent;
            serialNbrInput.value = cells[2].textContent;
            modelInput.value = cells[3].textContent;
            lenseInput.value = cells[4].textContent;
            dateInput.value = cells[7].textContent;
            formBtn.value = 'UpdateStatus';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../controller/cameraInsertion.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>