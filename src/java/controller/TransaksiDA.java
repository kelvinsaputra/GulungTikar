/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static controller.SystemDA.factory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ryou
 */
public class TransaksiDA {
    public TransaksiDA() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
    }
    
    
}
