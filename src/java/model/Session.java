/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author fsury
 */
public class Session {
    
    private static Session instance;
    private static Pengguna pengguna;
    
    public Session(){
        instance = this;
    }

    public static Session getInstance() {
        return instance;
    }
    
    public void purge(){
       pengguna = null;
    }
    
    public Session(Pengguna pengguna) {
        this.pengguna = pengguna;
    }

    public Pengguna getPengguna() {
        return pengguna;
    }

    public void setPengguna(Pengguna pengguna) {
        this.pengguna = pengguna;
    }
}
