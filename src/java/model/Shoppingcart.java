package model;
// Generated Feb 28, 2018 5:28:46 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Shoppingcart generated by hbm2java
 */
public class Shoppingcart  implements java.io.Serializable {


     private Integer idShoppingcart;
     private Pengguna pengguna;
     private Set<Shoppingcartentry> shoppingcartentries = new HashSet<Shoppingcartentry>(0);

    public Shoppingcart() {
    }

	
    public Shoppingcart(Pengguna pengguna) {
        this.pengguna = pengguna;
    }
    public Shoppingcart(Pengguna pengguna, Set<Shoppingcartentry> shoppingcartentries) {
       this.pengguna = pengguna;
       this.shoppingcartentries = shoppingcartentries;
    }
   
    public Integer getIdShoppingcart() {
        return this.idShoppingcart;
    }
    
    public void setIdShoppingcart(Integer idShoppingcart) {
        this.idShoppingcart = idShoppingcart;
    }
    public Pengguna getPengguna() {
        return this.pengguna;
    }
    
    public void setPengguna(Pengguna pengguna) {
        this.pengguna = pengguna;
    }
    public Set<Shoppingcartentry> getShoppingcartentries() {
        return this.shoppingcartentries;
    }
    
    public void setShoppingcartentries(Set<Shoppingcartentry> shoppingcartentries) {
        this.shoppingcartentries = shoppingcartentries;
    }




}


