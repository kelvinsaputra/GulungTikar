/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import static controller.SystemDA.factory;
import java.util.ArrayList;
import model.Pengguna;
import model.Shoppingcart;
import model.Wishlist;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ryou
 */
public class PenggunaDA {
    public SessionFactory factory;
    private SystemDA SDA = new SystemDA();
    Session s = new Configuration().configure().buildSessionFactory().openSession();
    
    public PenggunaDA(){
        try {
        factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
    }
    public boolean register(Pengguna p)
    {
        ArrayList<Pengguna> listPengguna = new ArrayList();
        Wishlist wl = new Wishlist();
        Shoppingcart sc = new Shoppingcart();
        listPengguna = SDA.getAllUser();
        boolean found = false;
        int i=0;
        int j=0;
        
        
        while(!found&&i<listPengguna.size())
        {
            if(listPengguna.get(i).getEmail().equals(p.getEmail()))
            {
                found = true;

            }
            else
            {
                i++;
            }
        }


        if(found)
        {
            System.out.println("Register Fail");
            return false;
        }
        else
        {
            System.out.println("User dimasukkan");
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            wl.setPengguna(p);
            sc.setPengguna(p);
            session.save(p);
            session.save(wl);
            session.save(sc);
            tx.commit();
            session.close();
            factory.close();
            return true;
        }
    }
    
    public Pengguna login(Pengguna p)
    {   
        ArrayList<Pengguna> listPengguna = new ArrayList();
        listPengguna =  SDA.getAllUser();
        Pengguna pengguna = new Pengguna();
        boolean found = false;
        int i=0;
        int j=0;
        
        while(!found&&i<listPengguna.size())
        {
            if(listPengguna.get(i).getEmail().equals(p.getEmail())
                    && SDA.MD5(listPengguna.get(i).getPassword()).equals(SDA.MD5(p.getPassword())))
            {
                found = true;
                pengguna = listPengguna.get(i);
            }
            else
            {
                i++;
            }
        }
        
        if(found)
        {
            return pengguna;
        }
        else
        {
            return null;
        }
    }
    
    public void updateStatus(int idTrx) {
        s.beginTransaction();
        Query query = s.createQuery("update Transaksi set status = 'Sudah Diterima' where id_transaksi = " + idTrx);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }
    
    public void updatePassword(int idPengguna, String newPass)  {
        s.beginTransaction();
        Query query = s.createQuery("update Pengguna set password = '"+newPass+"' where id_pengguna = " + idPengguna);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }
    
}
