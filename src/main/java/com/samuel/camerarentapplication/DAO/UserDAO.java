package com.samuel.camerarentapplication.DAO;

import com.samuel.camerarentapplication.MODAL.Roles;
import com.samuel.camerarentapplication.MODAL.Users;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

public class UserDAO {

    Session session = HibernateUtil.getSessionFactory().openSession();

    public UserDAO() {
    }
    public Users createAccount(Users account){
        Transaction tx = session.beginTransaction();
        session.merge(account);
        tx.commit();
        session.close();

        return account;
    }


    public List<Users> accountList() {
        return  session.createQuery("from Users", Users.class).list();
    }

    public String login(String nationalID, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Users> query = session.createQuery("SELECT u FROM Users u WHERE u.nationalID = :nationalID", Users.class);
            query.setParameter("nationalID", nationalID);
            Users user = query.getSingleResult();

            List<Users> accounts = query.list();
            for (Users account: accounts) {
                PasswordEncoder encoder = new BCryptPasswordEncoder();
                if(encoder.matches(password, account.getPassword())){
                    return "logged in";
                }return "login failed";
            }
            return "nationalID not found";
        }
    }


    public Roles findRoleByName(String roleName) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Roles> query = session.createQuery("FROM Roles WHERE role_name = :roleName", Roles.class);
            query.setParameter("roleName", roleName);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public Users getUserByNationalID(String nationalID) {
        try {
            Query<Users> query = session.createQuery("FROM Users WHERE nationalID = :nationalID", Users.class);
            query.setParameter("nationalID", nationalID);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }



}
