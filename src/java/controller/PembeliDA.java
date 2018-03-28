/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static controller.SystemDA.factory;
import java.util.ArrayList;
import model.Shoppingcartentry;
import model.Wishlist;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ryou
 */
public class PembeliDA {
    public PembeliDA() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
    }
    
    public boolean insertWishlist(Wishlist m) { //inisialisasi pas user buat, bisa otomatis panggil insertWishlist kalo tipenya pembeli
        Session session = factory.openSession();
        ArrayList<Wishlist> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }
    
    public boolean insertShoppingcartentry(Shoppingcartentry m) {
        Session session = factory.openSession();
        ArrayList<Shoppingcartentry> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }
}
