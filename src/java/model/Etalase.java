package model;
// Generated Feb 28, 2018 5:28:46 PM by Hibernate Tools 4.3.1



/**
 * Etalase generated by hbm2java
 */
public class Etalase  implements java.io.Serializable {


     private EtalaseId id;
     private Barang barang;
     private Toko toko;
     private boolean ketersediaan;

    public Etalase() {
    }

    public Etalase(EtalaseId id, Barang barang, Toko toko, boolean ketersediaan) {
       this.id = id;
       this.barang = barang;
       this.toko = toko;
       this.ketersediaan = ketersediaan;
    }
   
    public EtalaseId getId() {
        return this.id;
    }
    
    public void setId(EtalaseId id) {
        this.id = id;
    }
    public Barang getBarang() {
        return this.barang;
    }
    
    public void setBarang(Barang barang) {
        this.barang = barang;
    }
    public Toko getToko() {
        return this.toko;
    }
    
    public void setToko(Toko toko) {
        this.toko = toko;
    }
    public boolean isKetersediaan() {
        return this.ketersediaan;
    }
    
    public void setKetersediaan(boolean ketersediaan) {
        this.ketersediaan = ketersediaan;
    }




}

