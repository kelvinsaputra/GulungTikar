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
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Barang;
import model.Pengguna;
import model.Wishlist;
import model.Wishlistentry;
import model.WishlistentryId;

/**
 *
 * @author user
 */
@WebServlet(name = "wishlist", urlPatterns = {"/wishlist"})
public class wishlistServlet extends HttpServlet {

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
            out.println("<title>Servlet wishlist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet wishlist at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        SystemDA da = new SystemDA();
        Wishlistentry temp = new Wishlistentry();
        int idBarang = Integer.parseInt(request.getParameter("idBarang"));
        int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
        
        ArrayList<Pengguna> temppengguna = new ArrayList<Pengguna>();
        temppengguna = da.getAllUser();
        Pengguna pengguna = new Pengguna();

        for (int i = 0; i < temppengguna.size(); i++) {
            if (temppengguna.get(i).getIdPengguna() == idPengguna) {
                pengguna = temppengguna.get(i);
            }
        }

        boolean udahPunyaList = false;
        ArrayList<Wishlist> tempwish = new ArrayList<Wishlist>();
        tempwish = da.getAllWishlist();
        WishlistentryId wid = new WishlistentryId();

        if (tempwish != null) {
            for (int i = 0; i < tempwish.size(); i++) {
                if (tempwish.get(i).getPengguna().getIdPengguna() == idPengguna) {
                    udahPunyaList = true;
                }
            }

            if (udahPunyaList == false) {
                Wishlist newWish = new Wishlist();
                newWish.setPengguna(pengguna);
                wid.setIdWishlist(da.insertWishlist(newWish));
            } else {
                ArrayList<Wishlist> wish = new ArrayList<Wishlist>();
                wish = da.getAllWishlist();

                for (int i = 0; i < wish.size(); i++) {
                    if (wish.get(i).getPengguna().getIdPengguna() == idPengguna) {//comment hbmxml user ke wish, tetep wish ke user
                        wid.setIdWishlist(wish.get(i).getIdWishlist());
                    }
                }
            }

            wid.setIdBarang(idBarang);
            temp.setId(wid);
            temp.setTanggalEntry(new Date());

            da.insertWishlistentry(temp);
            
            RequestDispatcher rd
                            = request.getRequestDispatcher("barang.jsp?idBarang="+idBarang);
                    rd.forward(request, response);
//            ArrayList<Barang> tempbarang = new ArrayList<Barang>();
//            tempbarang = da.getAllBarang();
//
//            for (int i = 0; i < tempbarang.size(); i++) {
//                if (tempbarang.get(i).getIdBarang() == idBarang) {
//                    temp.setBarang(tempbarang.get(i));
//                }
//            }

        }

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
