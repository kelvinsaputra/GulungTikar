/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import model.Barang;
import model.Pengguna;
import model.Etalase;
import model.Kategori;
import model.Orderentry;
import model.Shoppingcart;
import model.Shoppingcartentry;
import model.Toko;
import model.Transaksi;
import model.Wishlist;
import model.Wishlistentry;
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
    //NOTE : KALO WHERE ID BLA IN (SELECT)... GABISA, berarti di servlet harus ambil dulu getAllBLA buat dapetin id sesuai id user,
    // baru update / dll diganti jadi where id bla = idygtadididapetdiservlet
    public static SessionFactory factory;
    Session s = new Configuration().configure().buildSessionFactory().openSession();

    public SystemDA() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat session factory");
            e.printStackTrace();
        }
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
    
    public ArrayList<Pengguna> getAllUser() {

        Session session = factory.openSession();
        ArrayList<Pengguna> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Pengguna");
        hasil = (ArrayList<Pengguna>) q.list();
        return hasil;
    }
    
    public Pengguna getUserById(int id) {
        Session session = factory.openSession();
        Pengguna hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Pengguna where id="+id);
        hasil = (Pengguna) q.list().get(0);
        return hasil;
    }

    public boolean insertUser(Pengguna m) {
        Session session = factory.openSession();
        ArrayList<Pengguna> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }

    public void deleteUser(int x) {
        s.beginTransaction();

        Query query = s.createQuery("delete from Pengguna where id_pengguna=" + x);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updatePassword(int a, String pass) {
        s.beginTransaction();
        Query query = s.createQuery("update Pengguna set password = '" + pass + "'  where id_pengguna = " + a);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updateUser(int a, String nama, String alamat, int norek) {
        s.beginTransaction();
        Query query = s.createQuery("update Pengguna set nama = '" + nama + "', alamat_rumah = '" + alamat + "', norek = " + norek + "  where id_pengguna = " + a);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public ArrayList<Barang> getAllBarang() {
        Session session = factory.openSession();
        ArrayList<Barang> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Barang");
        hasil = (ArrayList<Barang>) q.list();
        return hasil;
    }
    
    public Barang getBarangByID(int idBarang)
    {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Barang where id_barang="+idBarang);
        if(q.list().size()>0){
            Barang hasil = (Barang) q.list().get(0);
            return hasil;
        } else {
            return null;
        }
    }
    
//    public ArrayList<Barang> getBarang(int x) {
//        s.beginTransaction();
//        Query query = s.createQuery("select from Barang where id_barang=" + x);
//        Barang hasil = new Barang();
//        s.getTransaction().commit();
//    }
    public ArrayList<Etalase> getAllEtalase() {
        Session session = factory.openSession();
        ArrayList<Etalase> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Etalase");
        hasil = (ArrayList<Etalase>) q.list();
        return hasil;
    }

    public Etalase getEtalaseByID(int idBarang)
    {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Etalase where id_barang="+idBarang);
        if(q.list().size()>0){
            Etalase hasil = (Etalase) q.list().get(0);
            return hasil;
        } else {
            return null;
        }
    }
    public void deleteEtalase(int idBarang, int idToko) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Etalase where id_barang=" + idBarang + " and id_toko =" + idToko); //disini many to many jd deletenya di etalase pengguna siapa jg harus dicek
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updateEtalase(int idBarang, int idPengguna, String x) {
        s.beginTransaction();
        Query query = s.createQuery("update Etalase set ketersediaan = '" + x + "' where id_barang=" + idBarang + " and id_toko in (select id_toko from toko where id_pengguna =" + idPengguna + ")");
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public boolean insertEtalase(Etalase m) {
        Session session = factory.openSession();
        ArrayList<Etalase> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }

    public ArrayList<Kategori> getAllKategori() { //kategori diinput hardcode aja di sql, kategori barang yang harusnya di getall
        //get all barang di kategori tsb, tapi ga ada class kategoribarang di package model
        Session session = factory.openSession(); // ini di skip dulu aja disimpen manatau guna entar kalo udah dibenerin
        ArrayList<Kategori> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Kategori");
        hasil = (ArrayList<Kategori>) q.list();
        return hasil;
    }

//    public ArrayList<Kategori> getKategori() {
//        Session session = factory.openSession();
//        ArrayList<Kategori> hasil = null;
//        Transaction tx = session.beginTransaction();
//        Query q = session.createQuery("from Kategori");
//        hasil = (ArrayList<Kategori>) q.list();
//        return hasil;
//    }
    
    //orderentry sama shoppingcart redundant deh kayanya,
    // 1 transaksi punya banyak shoppingcartentry aja, jangan bikin 1 transaksi punya banyak orderentry, 2x kerjanya
    // tambahin aja id transaksi di shoppingcartentry, jadi bisa select id barang from shoppingcartentry where id transaksi = x buat history dia beli apa aja di transaksi itu
    // pas insert shoppingcart, tambah kasih id transaksi user selanjutnya (kalo auto increment di table transaksi),
    //di cek dulu di table transaksi mis id transaksi next 20, nah 20 nya disimpen di temp terus tiap insert shoppingcartentry
    // insert id transaksinya 20 terus sampe beres, insert ke table transaksi, next jadi 21
    public ArrayList<Orderentry> getAllOrderentry() { //di servlet where id transaksi = ... , di history page
        Session session = factory.openSession();
        ArrayList<Orderentry> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Orderentry");
        hasil = (ArrayList<Orderentry>) q.list();
        return hasil;
    }

//    public ArrayList<Orderentry> getOrderentry() {
//        Session session = factory.openSession();
//        ArrayList<Orderentry> hasil = null;
//        Transaction tx = session.beginTransaction();
//        Query q = session.createQuery("from Orderentry");
//        hasil = (ArrayList<Orderentry>) q.list();
//        return hasil;
//    }
    
// get all shopping cart ga guna, ga buat apa2 yg diliat entry aja
    public ArrayList<Shoppingcart> getAllShoppingcart() { //cari di servlet pake for biasa, ambil id shopping cart lanjut ke entry
        Session session = factory.openSession();
        ArrayList<Shoppingcart> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Shoppingcart");
        hasil = (ArrayList<Shoppingcart>) q.list();
        return hasil;
    }

    public void deleteShoppingcart(int idPengguna) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Shoppingcart where id_pengguna=" + idPengguna);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public boolean insertShoppingcart(Shoppingcart m) {
        Session session = factory.openSession();
        ArrayList<Shoppingcart> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }

    public ArrayList<Shoppingcartentry> getAllShoppingcartentry() { //cari di servlet pake for biasa, ambil id barang where id shopping dari ^
        Session session = factory.openSession();
        ArrayList<Shoppingcartentry> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Shoppingcartentry");
        hasil = (ArrayList<Shoppingcartentry>) q.list();
        return hasil;
    }

    public void deleteShoppingcartentry(int idBarang, int idPengguna) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Shoppingcartentry where id_barang=" + idBarang + " and id_shoppingcart in (select id_shoppingcart from shoppingcart where id_pengguna =" + idPengguna + ")"); //disini many to many jd deletenya di etalase pengguna siapa jg masuk
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updateShoppingcartentry(int idBarang, int idPengguna, int x) {
        s.beginTransaction();
        Query query = s.createQuery("update Shoppingcartentry set qty = " + x + " where id_barang=" + idBarang + " and id_shoppingcart in (select id_shoppingcart from shoppingcart where id_pengguna =" + idPengguna + ")");
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    

    public ArrayList<Toko> getAllToko() { //tombol buuat toko , buat shopping cart dsb buat inisialisasi awal
        Session session = factory.openSession();
        ArrayList<Toko> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Toko");
        hasil = (ArrayList<Toko>) q.list();
        return hasil;
    }
    
    public int getIDBarang() { //tombol buuat toko , buat shopping cart dsb buat inisialisasi awal
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("SELECT idBarang FROM Barang ORDER BY idBarang DESC");
        if(!q.list().isEmpty()){
            Integer hasil = (Integer) q.list().get(0);
            return hasil;
        } else {
            return 6;
        }
    }
    
    public ArrayList<Toko> getToko(Pengguna p) { //tombol buuat toko , buat shopping cart dsb buat inisialisasi awal
        Session session = factory.openSession();
        ArrayList<Toko> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Toko where id_pengguna="+p.getIdPengguna());
        hasil = (ArrayList<Toko>) q.list();
        return hasil;
    }
    
    
    public Toko getToko2(Pengguna p) { //tombol buuat toko , buat shopping cart dsb buat inisialisasi awal
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Toko where id_pengguna="+p.getIdPengguna());
        if(q.list().size()>0){
            Toko hasil = (Toko) q.list().get(0);
            return hasil;
        } else {
            return null;
        }
    }
    
    public Wishlist getWishlist(Pengguna p) { //tombol buuat toko , buat shopping cart dsb buat inisialisasi awal
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Wishlist where id_pengguna="+p.getIdPengguna());
        if(q.list().size()>0){
            Wishlist hasil = (Wishlist) q.list().get(0);
            return hasil;
        } else {
            return null;
        }
    }

    //toko gaboleh didelete bray kan user nya penjual pembeli, kecuali kalo user ganti tipe, otomatis toko didelete
    //deletenya harus delete semua deh yg terkait sm toko jadi cascade / something ini temp aja dulu
    public void deleteToko(int idPengguna) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Toko where id_pengguna=" + idPengguna);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updateToko(int idToko, int stat, String alamat) {
        s.beginTransaction();
        Query query = s.createQuery("update Toko set status = " + stat + ", alamat_toko='" + alamat + "' where id_toko=" + idToko); //relasi 1 ke 1 tinggal simple gaperlu select in soalnya lgsg nyambung
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    

//    public ArrayList<Toko> getToko() {
//        Session session = factory.openSession();
//        ArrayList<Toko> hasil = null;
//        Transaction tx = session.beginTransaction();
//        Query q = session.createQuery("from Toko");
//        hasil = (ArrayList<Toko>) q.list();
//        return hasil;
//    }
    
    public ArrayList<Transaksi> getAllTransaksi() {
        Session session = factory.openSession();
        ArrayList<Transaksi> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Transaksi");
        hasil = (ArrayList<Transaksi>) q.list();
        return hasil;
    }

    public void deleteTransaksi(int idTransaksi, int idPengguna) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Transaksi where id_pengguna=" + idPengguna + "and id_transaksi=" + idTransaksi);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public void updateTransaksi(int idTransaksi, String stat) { //yg bisa diupdate dari transaksi cuma status kalo ga nanti bisa berubah2 transaksinya lol
        s.beginTransaction();
        Query query = s.createQuery("update Transaksi set status = '" + stat + "' where id_transaksi=" + idTransaksi);
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public boolean insertTransaksi(Transaksi m) {
        Session session = factory.openSession();
        ArrayList<Transaksi> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }

//    public ArrayList<Transaksi> getTransaksi() {
//        Session session = factory.openSession();
//        ArrayList<Transaksi> hasil = null;
//        Transaction tx = session.beginTransaction();
//        Query q = session.createQuery("from Transaksi");
//        hasil = (ArrayList<Transaksi>) q.list();
//        return hasil;
//    }
    
    public ArrayList<Wishlist> getAllWishlist() {
        Session session = factory.openSession();
        ArrayList<Wishlist> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Wishlist");
        hasil = (ArrayList<Wishlist>) q.list();
        return hasil;
    }

    public void deleteWishlist(int idPengguna) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Wishlist where id_pengguna=" + idPengguna); //cuma ada 1 wishlist 1 user, where dari id user aja sama
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    public int insertWishlist(Wishlist m) { //inisialisasi pas user buat, bisa otomatis panggil insertWishlist kalo tipenya pembeli
        Session session = factory.openSession();
        ArrayList<Wishlist> hasil = null;
        Transaction tx = session.beginTransaction();
        int a = (Integer) session.save(m);
        tx.commit();
        session.close();
        return a;
    }    

//    public ArrayList<Wishlist> getWishlist() {
//        Session session = factory.openSession();
//        ArrayList<Wishlist> hasil = null;
//        Transaction tx = session.beginTransaction();
//        Query q = session.createQuery("from Wishlist");
//        hasil = (ArrayList<Wishlist>) q.list();
//        return hasil;
//    }
    public ArrayList<Wishlistentry> getAllWishlistentry(int idWishlist) {
        Session session = factory.openSession();
        ArrayList<Wishlistentry> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Wishlistentry where id_wishlist="+idWishlist);
        hasil = (ArrayList<Wishlistentry>) q.list();
        if(q.list().size()>0){
            return hasil;
        } else {
            return null;
        }
    }
    
    public void deleteWishlistentry(int idPengguna, int idBarang) {
        s.beginTransaction();
        Query query = s.createQuery("delete from Wishlistentry where id_barang=" + idBarang + "and id_wishlist in (select id_wishlist from wishlist where id_pengguna=" + idPengguna+")");
        int exec = query.executeUpdate();
        s.getTransaction().commit();
    }

    //wishlistentry gaperlu update, tanggalnya gaperlu keupdate sekali insert ttp aja tanggal itu
    
    public boolean insertWishlistentry(Wishlistentry m) { //inisialisasi pas user buat, bisa otomatis panggil insertToko kalo user register tipe penjual
        Session session = factory.openSession();
        ArrayList<Wishlistentry> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(m);
        tx.commit();
        session.close();
        return true;
    }
    

}
