package com.samuel.camerarentapplication.SERVICE;

import com.samuel.camerarentapplication.MODAL.Camera;
import com.samuel.camerarentapplication.MODAL.Roles;
import com.samuel.camerarentapplication.MODAL.Users;

import java.util.List;

public interface UserInterf {
    public Users createAccount(Users account);
    public List<Users> accountList();
    public String login(String nationalID, String password);
    public Roles findRoleByName(String roleName);
    public Users getUserByNationalID(String nationalID);
}
