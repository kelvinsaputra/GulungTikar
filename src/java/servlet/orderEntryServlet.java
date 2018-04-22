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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Barang;
import model.Etalase;
import model.Orderentry;
import model.OrderentryId;
import model.Shoppingcart;
import model.Shoppingcartentry;
import model.Transaksi;

/**
 *
 * @author Ryou
 */
@WebServlet(name = "orderEntryServlet", urlPatterns = {"/orderEntryServlet"})
public class orderEntryServlet extends HttpServlet {

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
        SystemDA da = new SystemDA();        
       int idSc = Integer.parseInt(request.getParameter("idSc"));
       int idPengguna = Integer.parseInt(request.getParameter("idPengguna"));
       Transaksi transaksi = (Transaksi) request.getAttribute("idTransaksi");
       Shoppingcart shoppingcart = da.getShoppingcartByID(idPengguna);
       ArrayList<Shoppingcartentry> sce = da.getShoppingcartentryByID(shoppingcart.getIdShoppingcart());
       RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
       Orderentry orderentry = new Orderentry();
       
       for(int i=0;i<sce.size();i++)
       {
           Barang barang = sce.get(i).getBarang();
           OrderentryId id = new OrderentryId();
           id.setIdBarang(barang.getIdBarang());
           id.setIdTransaksi(transaksi.getIdTransaksi());
           orderentry.setId(id);
           orderentry.setQty(sce.get(i).getQty());
           da.insertOrderentry(orderentry);
           da.deleteShoppingcartentry(barang.getIdBarang(),shoppingcart.getIdShoppingcart());
          
//           ArrayList<Etalase> listEtalase = new ArrayList();
//           listEtalase.addAll(barang.getEtalases());
//           int idPenjual = listEtalase.get(0).getToko().getPengguna().getIdPengguna();
//           ArrayList<Transaksi> transaksiPenjual = da.getTransaksiByIdPengguna(idPenjual);
//           if(transaksiPenjual.size()==0)
//           {
//               System.out.println("IDPenjual"+idPenjual);
//               transaksi.setIdTransaksi(transaksi.getIdTransaksi());
//               transaksi.getPengguna().setIdPengguna(idPenjual);
//               da.insertTransaksi(transaksi);
//           }
       }
       da.deleteShoppingcart(idPengguna);
       rd.forward(request, response);
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
