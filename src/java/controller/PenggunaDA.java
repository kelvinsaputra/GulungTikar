/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.util.ArrayList;
import model.Pengguna;
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
            session.save(p);
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
    
}
