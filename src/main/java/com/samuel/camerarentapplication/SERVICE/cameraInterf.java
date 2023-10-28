package com.samuel.camerarentapplication.SERVICE;

import com.samuel.camerarentapplication.MODAL.Camera;

import java.util.List;

public interface cameraInterf {
    public Camera save_Cam(Camera st);
    public List<Camera> retrieveCam();
    public boolean updateCamStatus(Camera cam, int newStatus);
    public boolean updateCameraRentStatus(int id, String newRentStatus);

}
