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

    public Camera findCam(String serialNbr) {

        Session session = null;
        List<Camera> results = new ArrayList<>();

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            Query query = session.createQuery("FROM Camera WHERE serialNbr = :serialNbr");
            query.setParameter("serialNbr", serialNbr);

            results = query.getResultList();
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        if (results.size() == 1) {
            return results.get(0);
        } else {
            return null;
        }
    }




    public boolean updateCameraRentStatus(int cameraId, String newRentStatus) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            Camera camera = session.get(Camera.class, cameraId);
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
