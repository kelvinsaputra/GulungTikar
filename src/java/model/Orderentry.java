package model;
// Generated Feb 28, 2018 5:28:46 PM by Hibernate Tools 4.3.1



/**
 * Orderentry generated by hbm2java
 */
public class Orderentry  implements java.io.Serializable {


     private OrderentryId id;
     private Barang barang;
     private Transaksi transaksi;
     private int qty;

    public Orderentry() {
    }

    public Orderentry(OrderentryId id, Barang barang, Transaksi transaksi, int qty) {
       this.id = id;
       this.barang = barang;
       this.transaksi = transaksi;
       this.qty = qty;
    }
   
    public OrderentryId getId() {
        return this.id;
    }
    
    public void setId(OrderentryId id) {
        this.id = id;
    }
    public Barang getBarang() {
        return this.barang;
    }
    
    public void setBarang(Barang barang) {
        this.barang = barang;
    }
    public Transaksi getTransaksi() {
        return this.transaksi;
    }
    
    public void setTransaksi(Transaksi transaksi) {
        this.transaksi = transaksi;
    }
    public int getQty() {
        return this.qty;
    }
    
    public void setQty(int qty) {
        this.qty = qty;
    }




}


