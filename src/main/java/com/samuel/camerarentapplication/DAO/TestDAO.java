package com.samuel.camerarentapplication.DAO;

public class TestDAO {
    public static void main(String[] args) {
        HibernateUtil.getSessionFactory().openSession();
    }

}
