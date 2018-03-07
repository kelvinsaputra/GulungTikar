/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    public  SessionFactory factory;
    
    public SystemDA()
    {
        try {
            factory = new Configuration().configure().buildSessionFactory();
            } catch (Exception e) {
                System.err.println("error membuat session factory");
                e.printStackTrace();
            }
    }
    
    public ArrayList<Pengguna> getAllUser()
    {
        
        Session session = factory.openSession();
        ArrayList<Pengguna> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Pengguna");
        hasil = (ArrayList<Pengguna>) q.list();
        return hasil;
    }
    
    public ArrayList<Pengguna> getUserByID(int id)
    {
        Session session = factory.openSession();
        ArrayList<Pengguna> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Pengguna where ID_pengguna="+id);
        hasil = (ArrayList<Pengguna>) q.list();
        return hasil;
    }
    
    public String MD5(String password) {
		MessageDigest md;
		String hasil = "";
		try {
			md = MessageDigest.getInstance("MD5");md.update(password.getBytes());

	        byte byteData[] = md.digest();

	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }

//	        System.out.println("Digest(in hex format):: " + sb.toString());

	        //convert the byte to hex format method 2
	        StringBuffer hexString = new StringBuffer();
	    	for (int i=0;i<byteData.length;i++) {
	    		String hex=Integer.toHexString(0xff & byteData[i]);
	   	     	if(hex.length()==1) hexString.append('0');
	   	     	hexString.append(hex);
	    	}
//	    	System.out.println("Digest(in hex format):: " + hexString.toString());
	    	hasil = hexString.toString();
	    	
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return hasil;
	}
}
