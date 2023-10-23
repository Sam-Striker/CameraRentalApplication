package com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION;

import com.samuel.camerarentapplication.DAO.UserDAO;
import com.samuel.camerarentapplication.MODAL.Camera;
import com.samuel.camerarentapplication.MODAL.Roles;
import com.samuel.camerarentapplication.MODAL.Users;
import com.samuel.camerarentapplication.SERVICE.UserInterf;

import java.util.List;

public class UserIMPLEMENT implements UserInterf {

    UserDAO DAO = new UserDAO();


    @Override
    public Users createAccount(Users account) {
        return DAO.createAccount(account);
    }

    @Override
    public List<Users> accountList() {
        return DAO.accountList();
    }

    @Override
    public String login(String nationalID, String password) {
        return DAO.login(nationalID, password);
    }

    @Override
    public Roles findRoleByName(String roleName) {
        return DAO.findRoleByName(roleName);
    }

    @Override
    public Users getUserByNationalID(String nationalID) {
        return DAO.getUserByNationalID(nationalID);
    }


}
