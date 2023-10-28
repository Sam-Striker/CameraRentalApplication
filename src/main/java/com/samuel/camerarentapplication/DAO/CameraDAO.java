package com.samuel.camerarentapplication.DAO;

import com.samuel.camerarentapplication.MODAL.Camera;
import jakarta.persistence.OptimisticLockException;
import jakarta.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;


public class CameraDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();


    public CameraDAO() {
    }

    public Camera save_Cam(Camera st) {
        Transaction tx = session.beginTransaction();
        session.merge(st);
        tx.commit();
        session.close();
        return st;
    }

    public List<Camera> retrieveCam() {
        return session.createQuery("from Camera ", Camera.class).list();
    }

    public boolean updateCamStatus(Camera cam, int newStatus) {
        Transaction tx = session.beginTransaction();
        cam.setStatus(newStatus);
        session.merge(cam);
        tx.commit();
        session.close();
        return true;
    }

    public boolean updateCameraRentStatus(int id, String newRentStatus) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            Camera camera = session.get(Camera.class, id);
            if (camera != null) {
                camera.setRentStatus(newRentStatus);
                session.merge(camera);

                tx.commit();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

}
