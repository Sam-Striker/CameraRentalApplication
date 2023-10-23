package com.samuel.camerarentapplication.SERVICE;

import com.samuel.camerarentapplication.MODAL.Camera;

import java.util.List;

public interface cameraInterf {
    public Camera save_Cam(Camera st);
    public List<Camera> retrieveCam();
    public Camera findCam(String serialNbr);
    public boolean updateCam(Camera st);
    public boolean updateCamStatus(Camera cam, int newStatus);
    public boolean updateCameraRentStatus(int cameraId, String newRentStatus);

}
