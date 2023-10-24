<%--
  Created by IntelliJ IDEA.
  User: STRIKER
  Date: 10/20/2023
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.samuel.camerarentapplication.SERVICE.UserInterf" %>
<%@page import="com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.UserIMPLEMENT" %>
<%@ page import="com.samuel.camerarentapplication.MODAL.Roles" %>
<%@ page import="com.samuel.camerarentapplication.MODAL.Users" %>
<%@ page import="com.samuel.camerarentapplication.DAO.UserDAO" %>
<jsp:useBean id="userBean" class="com.samuel.camerarentapplication.BEAN.UserBean" scope="request" />

<%
  String nationalID = request.getParameter("email");
  String password = request.getParameter("password");

  if(!nationalID.trim().isEmpty() && !password.trim().isEmpty()) {
    UserInterf service = new UserIMPLEMENT();
    UserDAO userDAO = new UserDAO();
    String feedback = service.login(nationalID, password);
//            check if login succeeded
    if (feedback.equals("logged in")) {
      userBean.setInfoMessage(feedback);
      userBean.setNationalID(nationalID);
      userBean.setPassword(password);

      Users user = userDAO.getUserByNationalID(nationalID);

        if (user != null) {

          int userId = user.getId();
          request.getSession().setAttribute("userId", userId);


          Roles role = user.getRole();
          if (role != null) {
            String roleName = role.getRole_name();
            if ("client".equals(roleName)) {
              response.sendRedirect("../components/Client.jsp");
              return;
            } else if ("seller".equals(roleName)) {
              response.sendRedirect("../components/ListCameras.jsp");
              return;
            }
          }
        }

    } else {
      userBean.setNationalID(nationalID);
      userBean.setPassword(password);
      userBean.setErrorMessage("All inputs are required");
      request.getRequestDispatcher("components/login.jsp").forward(request, response);
    }
  }
%>