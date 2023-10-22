package com.samuel.camerarentapplication.DAO;

import com.samuel.camerarentapplication.MODAL.Camera;
import jakarta.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


public class CameraDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();


    public CameraDAO() {
    }

    public Camera save_Cam(Camera st){
        Transaction tx = session.beginTransaction();
        session.merge(st);
        tx.commit();
        session.close();
        return st;
    }

    public List<Camera> retrieveCam(){
        return session.createQuery("from Camera ", Camera.class).list();
    }

    public boolean deleteCam(Camera cam){
        Transaction tx = session.beginTransaction();
        session.remove(cam);
        tx.commit();
        session.close();
        return true;
    }


    public Camera findCam(String serialNbr){

//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            String hql = "FROM Camera WHERE serialNbr = :serialNbr";
//            Query query = session.createQuery(hql, Camera.class);
//            query.setParameter("serialNbr", serialNbr);
//            return query.uniqueResult();
//        }

        List<Camera> results = new ArrayList<>();

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            Query query = session.createQuery("FROM Camera WHERE serialNbr = :serialNbr");
            query.setParameter("serialNbr", serialNbr);

            results = query.getResultList();
        } catch (HibernateException ex) {
            // Handle the exception here, e.g., log or rethrow it
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

    public boolean updateCam(Camera cam) {
        boolean result = false;
        Transaction tx = session.beginTransaction();
        session.update(cam);
        tx.commit();
        session.close();
        result = Boolean.TRUE;
        return result;
    }
}
