package model;
// Generated Mar 7, 2018 11:31:33 AM by Hibernate Tools 4.3.1



/**
 * EtalaseId generated by hbm2java
 */
public class EtalaseId  implements java.io.Serializable {


     private int idToko;
     private int idBarang;

    public EtalaseId() {
    }

    public EtalaseId(int idToko, int idBarang) {
       this.idToko = idToko;
       this.idBarang = idBarang;
    }
   
    public int getIdToko() {
        return this.idToko;
    }
    
    public void setIdToko(int idToko) {
        this.idToko = idToko;
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
		 if ( !(other instanceof EtalaseId) ) return false;
		 EtalaseId castOther = ( EtalaseId ) other; 
         
		 return (this.getIdToko()==castOther.getIdToko())
 && (this.getIdBarang()==castOther.getIdBarang());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdToko();
         result = 37 * result + this.getIdBarang();
         return result;
   }   


}


