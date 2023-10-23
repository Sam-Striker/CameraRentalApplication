import com.samuel.camerarentapplication.DAO.CameraDAO;
import com.samuel.camerarentapplication.MODAL.Camera;
import com.samuel.camerarentapplication.SERVICE.IMPLEMENTATION.CameraIMPLEMENT;
import com.samuel.camerarentapplication.SERVICE.cameraInterf;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class TestApp {
    cameraInterf service = new CameraIMPLEMENT();
    @Test
    public void testCameraRental(){
        Camera cam = new Camera();
        cam.setSerialNbr("200");
        cam.setModel("cannon");
        cam.setLense("50mm");
        cam.setStatus(0);
        cam.setRentStatus("available");
        cam.setDate(LocalDate.parse("2023-09-01"));
        cam.setUser(cam.getUser());

        service.save_Cam(cam);
    }

    @Test
    public void test_Update(){
        Camera cam = service.findCam("200");

        cam.setModel("nikonn");
        service.updateCam(cam);

    }

    @Test
    public void test_FindAll(){
        List<Camera> cam = service.retrieveCam();

        assertEquals(1, cam.size());
    }

    @Test
    public void test_FindById(){
        Camera cam = service.findCam("200");

        assertNotNull(cam);
        assertEquals("nikonn", cam.getModel());
    }

    @Test
    public void test_UpdateRentStatus(){
        Camera cam = service.findCam("200");

        cam.setRentStatus("rented");
        service.updateCam(cam);

    }
    @Test
    public void test_updateCamStatus(){
        Camera cam = service.findCam("200");

        cam.setStatus(1);
        service.updateCam(cam);
    }


}
