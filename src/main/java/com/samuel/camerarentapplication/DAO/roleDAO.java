package com.samuel.camerarentapplication.DAO;

import com.samuel.camerarentapplication.MODAL.Roles;
import com.samuel.camerarentapplication.MODAL.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class roleDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public roleDAO() {
    }
    public Roles createRoles(Roles role){
        Transaction tx = session.beginTransaction();
        session.persist(role);
        tx.commit();
        session.close();

        return role;
    }
}
