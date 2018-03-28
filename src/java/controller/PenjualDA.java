/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static controller.SystemDA.factory;
import java.util.ArrayList;
import model.Barang;
import model.Toko;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ryou
 */
public class PenjualDA {
     Session s = new Configuration().configure().buildSessionFactory().openSession();
    public PenjualDA() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
    }
    
    public int insertBarang(Barang m) 
    { //harusnya insert barang langsung insert ke etalase berhubungan sm toko jg, jadi sekaligus di servletnya,
        //asa aneh kalo bisa insert barang seenaknya tp gamasuk ke toko/etalase penjual
        Session session = factory.openSession();
        ArrayList<Barang> hasil = null;
        Transaction tx = session.beginTransaction();
        int a = (Integer) session.save(m);
        tx.commit();
        session.close();
        return a;
    }

    public void deleteBarang(int x) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Barang where id_barang=" + x);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updateBarang(int id, String nama, String harga) {
        s.beginTransaction();
        Query query = s.createQuery("update Barang set nama_barang = '" + nama + "', harga_barang = '" + harga + "'  where id_barang = " + id);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }
    
    public boolean insertToko(Toko m) { //inisialisasi pas user buat, bisa otomatis panggil insertToko kalo user register tipe penjual
        Session session = factory.openSession();
        ArrayList<Toko> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }
    
    
}
