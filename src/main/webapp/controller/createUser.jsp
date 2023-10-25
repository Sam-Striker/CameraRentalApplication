<%--
  Created by IntelliJ IDEA.
  User: STRIKER
  Date: 10/20/2023
  Time: 8:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.samuel.camerarentapplication.MODAL.Users" %>
<%@page import="com.samuel.camerarentapplication.SERVICE.UserInterf" %>
<%@page import="com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.UserIMPLEMENT" %>
<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" %>y
<%@page import="org.springframework.security.crypto.password.PasswordEncoder" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.samuel.camerarentapplication.MODAL.Roles" %>
<%@ page import="com.samuel.camerarentapplication.SERVICE.roleInterf" %>
<%@ page import="com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.rolesIMPLEMENT" %>
<jsp:useBean id="userBean" class="com.samuel.camerarentapplication.BEAN.UserBean" scope="request" />

<%
    try{
        UserInterf service = new UserIMPLEMENT();
        Users account = new Users();
        roleInterf roleService = new rolesIMPLEMENT();

        String nationalID = request.getParameter("nationalID");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        String passwordHash = encoder.encode(password);
        String address = request.getParameter("address");
        String phoneNbr = request.getParameter("phoneNbr");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        String selectedRole = request.getParameter("role");


        if(!nationalID.trim().isEmpty() && !address.trim().isEmpty() && !password.trim().isEmpty() && !phoneNbr.trim().isEmpty()){

            Roles selectedRoleEntity = service.findRoleByName(selectedRole);
            if (selectedRoleEntity == null) {
                selectedRoleEntity = new Roles();
                selectedRoleEntity.setRole_name(selectedRole);
                System.out.println("Saving selectedRoleEntity: " + selectedRoleEntity);
                // Persist the new role
                roleService.createRoles(selectedRoleEntity);
            }

            account.setId(account.getId());
            account.setUsername(username);
            account.setNationalID(nationalID);
            account.setPassword(passwordHash);
            account.setAddress(address);
            account.setPhoneNbr(phoneNbr);
            account.setDate(date);
            account.setRole(selectedRoleEntity);

            service.createAccount(account);

            request.getRequestDispatcher("../components/login.jsp").forward(request, response);
        }else{
            userBean.setErrorMessage("All inputs are required");
            request.getRequestDispatcher("../components/login.jsp").forward(request, response);
        }
    }catch(Exception e){
        userBean.setErrorMessage("Error: Encountered an error " + e);
        request.getRequestDispatcher("../components/login.jsp").forward(request, response);
    }
%>

