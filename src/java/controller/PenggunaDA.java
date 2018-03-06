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
    public static SessionFactory factory;
    public void register(Pengguna p)
    {
         try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
        ArrayList<Pengguna> listPengguna = new ArrayList();
        listPengguna= SystemDA.getAllUser();
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
            }
    }
    
}
