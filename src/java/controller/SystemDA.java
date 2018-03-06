/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Pengguna;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONObject;

/**
 *
 * @author Ryou
 */
public class SystemDA {
    public static SessionFactory factory;
    
    public static ArrayList<Pengguna> getAllUser()
    {
        try {
        factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
        Session session = factory.openSession();
        ArrayList<Pengguna> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Pengguna");
        hasil = (ArrayList<Pengguna>) q.list();
        return hasil;
    }
}
