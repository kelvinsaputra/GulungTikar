/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static controller.SystemDA.factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ryou
 */
public class AdminDA {
    public SessionFactory factory;
    private SystemDA SDA = new SystemDA();
    Session s = new Configuration().configure().buildSessionFactory().openSession();
    
    public AdminDA() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
    }
    
    public void updateStatus(int idTrx) {
        s.beginTransaction();
        Query query = s.createQuery("update Transaksi set status = 'Sukses' where id_transaksi = " + idTrx);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }
    
    public void updateSaldo(int idPenjual, int saldo) {
        s.beginTransaction();
        Query query = s.createQuery("update Pengguna set saldo = "+saldo+" where ID_pengguna = " + idPenjual);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }
}
