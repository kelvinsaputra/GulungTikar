package model;
// Generated Mar 7, 2018 11:31:33 AM by Hibernate Tools 4.3.1



/**
 * OrderentryId generated by hbm2java
 */
public class OrderentryId  implements java.io.Serializable {


     private int idTransaksi;
     private int idBarang;

    public OrderentryId() {
    }

    public OrderentryId(int idTransaksi, int idBarang) {
       this.idTransaksi = idTransaksi;
       this.idBarang = idBarang;
    }
   
    public int getIdTransaksi() {
        return this.idTransaksi;
    }
    
    public void setIdTransaksi(int idTransaksi) {
        this.idTransaksi = idTransaksi;
    }
    public int getIdBarang() {
        return this.idBarang;
    }
    
    public void setIdBarang(int idBarang) {
        this.idBarang = idBarang;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof OrderentryId) ) return false;
		 OrderentryId castOther = ( OrderentryId ) other; 
         
		 return (this.getIdTransaksi()==castOther.getIdTransaksi())
 && (this.getIdBarang()==castOther.getIdBarang());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdTransaksi();
         result = 37 * result + this.getIdBarang();
         return result;
   }   


}


