/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.SystemDA;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(name = "tambahbarangServlet", urlPatterns = {"/tambahbarangServlet"})
public class tambahbarangServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet tambahbarangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tambahbarangServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //        processRequest(request, response);
        Session current = new Session();
        SystemDA da = new SystemDA();
        Barang temp = new Barang();
        
        HashSet<Kategori> kategoris = new HashSet();
        ArrayList<Kategori> kategori = new ArrayList<Kategori>();
        kategori = da.getAllKategori();
        
//        System.out.println(request.getParameter("type"));
        
        for (int i = 0; i < kategori.size(); i++) {
            if (kategori.get(i).getIdKategori()==Integer.parseInt(request.getParameter("type"))) {
                kategoris.add(kategori.get(i));
            }
        }
        
        //cari id buat di masukin ke etalase , id kita tentuin dari id terakhir +1 (jadi ga auto increment soalnya bs gatau idnya)
//        ArrayList<Barang> tempbarang = new ArrayList<Barang>();
//        tempbarang = da.getAllBarang();
        
//        int lastID = tempbarang.get(tempbarang.size()-1).getIdBarang();
//        System.out.println(lastID);
//        lastID++;
        
//        temp.setIdBarang(lastID);
        temp.setNamaBarang(request.getParameter("namabarang"));
        temp.setHargaBarang(request.getParameter("hargabarang"));
        temp.setKategoris(kategoris);
        
        EtalaseId idetalase = new EtalaseId();
        idetalase.setIdBarang(da.insertBarang(temp));
        idetalase.setIdToko(Integer.parseInt(request.getParameter("idToko")));
        
        ArrayList<Toko> toko = new ArrayList<Toko>();
        Toko temptoko = new Toko();
        
        for(int i=0;i<toko.size();i++){
            if(toko.get(i).getIdToko()==Integer.parseInt(request.getParameter("idToko"))){
                temptoko=toko.get(i);
            }
        }
        
        Etalase etalase = new Etalase();
        etalase.setKetersediaan(true);
        etalase.setToko(temptoko);
        etalase.setId(idetalase);
        etalase.setBarang(temp);
//  
//        
        da.insertEtalase(etalase);
//        
        
        response.sendRedirect("profiletoko.jsp");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
