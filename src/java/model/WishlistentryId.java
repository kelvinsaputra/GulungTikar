package model;
// Generated Feb 28, 2018 5:28:46 PM by Hibernate Tools 4.3.1



/**
 * WishlistentryId generated by hbm2java
 */
public class WishlistentryId  implements java.io.Serializable {


     private int idWishlist;
     private int idBarang;

    public WishlistentryId() {
    }

    public WishlistentryId(int idWishlist, int idBarang) {
       this.idWishlist = idWishlist;
       this.idBarang = idBarang;
    }
   
    public int getIdWishlist() {
        return this.idWishlist;
    }
    
    public void setIdWishlist(int idWishlist) {
        this.idWishlist = idWishlist;
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
		 if ( !(other instanceof WishlistentryId) ) return false;
		 WishlistentryId castOther = ( WishlistentryId ) other; 
         
		 return (this.getIdWishlist()==castOther.getIdWishlist())
 && (this.getIdBarang()==castOther.getIdBarang());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdWishlist();
         result = 37 * result + this.getIdBarang();
         return result;
   }   


}

