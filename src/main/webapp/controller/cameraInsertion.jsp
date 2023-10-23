<%@ page import="com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.CameraIMPLEMENT" %>
<%@ page import="com.samuel.camerarentapplication.SERVICE.cameraInterf" %>
<%@ page import="com.samuel.camerarentapplication.MODAL.Camera" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="com.samuel.camerarentapplication.MODAL.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cameraBean" class="com.samuel.camerarentapplication.BEAN.CameraBean" scope="request" />


<%
    try{
        cameraInterf service = new CameraIMPLEMENT();
        Camera newCamera = new Camera();


        // Retrieve data from the form
        String serialNbr = request.getParameter("serialNbr");
        String model = request.getParameter("model");
        String lense = request.getParameter("lense");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        int userId = (int) session.getAttribute("userId");

        if(!serialNbr.trim().isEmpty() && !model.trim().isEmpty() && !lense.trim().isEmpty()){

            newCamera.setSerialNbr(serialNbr);
            newCamera.setModel(model);
            newCamera.setLense(lense);
            newCamera.setStatus(newCamera.getStatus());
            newCamera.setRentStatus("available");
            newCamera.setDate(date);

            // Set the user_id
            Users user = new Users();
            user.setId(userId);
            newCamera.setUser(user);

            service.save_Cam(newCamera);
            //cameraBean.setInfoMessage("camera inserted success.");

            request.getRequestDispatcher("../components/ListCameras.jsp").forward(request, response);
        }else{
            cameraBean.setErrorMessage("All inputs are required");
            request.getRequestDispatcher("../components/login.jsp").forward(request, response);
        }
    }catch(Exception e){
        cameraBean.setErrorMessage("Error: Encountered an error " + e);
        request.getRequestDispatcher("../components/login.jsp").forward(request, response);
    }
%>

