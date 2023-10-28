package com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION;

import com.samuel.camerarentapplication.DAO.CameraDAO;
import com.samuel.camerarentapplication.MODAL.Camera;
import com.samuel.camerarentapplication.SERVICE.cameraInterf;

import java.util.List;

public class CameraIMPLEMENT implements cameraInterf {


    CameraDAO DAO = new CameraDAO();

    @Override
    public Camera save_Cam(Camera st) {
        return DAO.save_Cam(st);
    }

    @Override
    public List<Camera> retrieveCam() {
        return DAO.retrieveCam();
    }



    @Override
    public boolean updateCamStatus(Camera cam, int newStatus) {
        return DAO.updateCamStatus(cam, newStatus);
    }


    @Override
    public boolean updateCameraRentStatus(int id, String newRentStatus) {
        return DAO.updateCameraRentStatus(id, newRentStatus);
    }
}
