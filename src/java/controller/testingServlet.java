/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.HashSet;
import model.Barang;
import model.Etalase;
import model.EtalaseId;
import model.Kategori;
import model.Session;
import model.Toko;

/**
 *
 * @author user
 */
public class testingServlet {
    public static void main(String[] args) {
//         Session current = new Session();
        SystemDA da = new SystemDA();
        Barang temp = new Barang();
        PenjualDA pa = new PenjualDA();
        HashSet<Kategori> kategoris = new HashSet();
        ArrayList<Kategori> kategori = new ArrayList<Kategori>();
        kategori = da.getAllKategori();
        
//        System.out.println(request.getParameter("type"));
        
        Kategori newCategory = new Kategori();
        newCategory.setNamaKategori("tes");
        newCategory.setIdKategori(4);

        kategoris.add(newCategory);
//        kategoris.add(kategori.get(1));
        System.out.println(kategoris.size());
        
//        for (int i = 0; i < kategori.size(); i++) {
//            if (kategori.get(i).getIdKategori()==Integer.parseInt(request.getParameter("type"))) {
//                kategoris.add(kategori.get(i));
//            }
//        }
        
        //cari id buat di masukin ke etalase , id kita tentuin dari id terakhir +1 (jadi ga auto increment soalnya bs gatau idnya)
//        ArrayList<Barang> tempbarang = new ArrayList<Barang>();
//        tempbarang = da.getAllBarang();
        
//        int lastID = tempbarang.get(tempbarang.size()-1).getIdBarang();
//        System.out.println(lastID);
//        lastID++;
        
//        temp.setIdBarang(lastID);
        temp.setNamaBarang("almostFinishit");
        temp.setHargaBarang("9999");
        temp.setKategoris(kategoris);

//        System.out.println(da.insertBarang());
        EtalaseId idetalase = new EtalaseId();
        idetalase.setIdBarang(pa.insertBarang(temp));
        idetalase.setIdToko(5);
        
        ArrayList<Toko> toko = new ArrayList<Toko>();
        Toko temptoko = new Toko();
        
        for(int i=0;i<toko.size();i++){
            if(toko.get(i).getIdToko()==5){
                temptoko=toko.get(i);
            }
        }
//        HashSet<Etalase> etalases = new HashSet();
        Etalase etalase = new Etalase();
        etalase.setKetersediaan(true);
//        etalase.setToko(temptoko);
        etalase.setId(idetalase);
//        etalase.setBarang(temp);
//        etalases.add(etalase);
////        temptoko.setEtalases(etalases);
//  
//        
//        da.deleteToko(idPengguna);
//        da.insertToko(temptoko);
        da.insertEtalase(etalase);
//      
    }
}
