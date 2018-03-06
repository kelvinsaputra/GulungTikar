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
public class testDOA {
    public static SessionFactory factory;
    
    public void getAllUser()
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
        
        ArrayList<JSONObject> list = new ArrayList();
        for(int x=0;x<hasil.size();x++)
        {
            JSONObject jo = new JSONObject();
            jo.put("username", hasil.get(x).getNama());
            jo.put("email", hasil.get(x).getEmail());
            list.add(jo);
        }
//        jo.put("id",nim);
//        jo.put("nama","Susi");
//        return jo.toJSONString();
        for(int i=0;i<list.size();i++)
        {
            System.out.println(list.get(i).toJSONString());
        }
        session.close();
    }
}
