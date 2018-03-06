package model;
// Generated Feb 28, 2018 5:28:46 PM by Hibernate Tools 4.3.1



/**
 * ShoppingcartentryId generated by hbm2java
 */
public class ShoppingcartentryId  implements java.io.Serializable {


     private int idShoppingcart;
     private int idBarang;

    public ShoppingcartentryId() {
    }

    public ShoppingcartentryId(int idShoppingcart, int idBarang) {
       this.idShoppingcart = idShoppingcart;
       this.idBarang = idBarang;
    }
   
    public int getIdShoppingcart() {
        return this.idShoppingcart;
    }
    
    public void setIdShoppingcart(int idShoppingcart) {
        this.idShoppingcart = idShoppingcart;
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
		 if ( !(other instanceof ShoppingcartentryId) ) return false;
		 ShoppingcartentryId castOther = ( ShoppingcartentryId ) other; 
         
		 return (this.getIdShoppingcart()==castOther.getIdShoppingcart())
 && (this.getIdBarang()==castOther.getIdBarang());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdShoppingcart();
         result = 37 * result + this.getIdBarang();
         return result;
   }   


}


