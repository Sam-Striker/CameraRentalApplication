package com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION;

import com.samuel.camerarentapplication.DAO.CameraDAO;
import com.samuel.camerarentapplication.DAO.roleDAO;
import com.samuel.camerarentapplication.MODAL.Roles;
import com.samuel.camerarentapplication.SERVICE.roleInterf;

public class rolesIMPLEMENT implements roleInterf {

    roleDAO DAO = new roleDAO();
    @Override
    public Roles createRoles(Roles role) {
        return DAO.createRoles(role);
    }
}
