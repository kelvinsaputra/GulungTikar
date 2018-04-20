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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Orderentry;
import model.OrderentryId;
import model.Pengguna;
import model.Shoppingcartentry;
import model.Transaksi;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "OrderEntryServlet", urlPatterns = {"/OrderEntryServlet"})
public class OrderEntryServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderEntryServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderEntryServlet at " + request.getContextPath() + "</h1>");
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
        SystemDA da = new SystemDA();
        int idSc = (Integer) request.getAttribute("idSc");
        int idPengguna = (Integer) request.getAttribute("idPengguna");
        ArrayList<Shoppingcartentry> temp = new ArrayList<>();
        temp = da.getShoppingcartentryByID(idSc);
        Transaksi transaksi = da.getTransaksibyUserId(idPengguna);
        for(int i=0; i<temp.size(); i++){
            Orderentry newOrder = new Orderentry();
            OrderentryId newId = new OrderentryId(transaksi.getIdTransaksi(), temp.get(i).getBarang().getIdBarang());
            newOrder.setId(newId);
            newOrder.setTransaksi(transaksi);
            newOrder.setBarang(temp.get(i).getBarang());
            newOrder.setQty(temp.get(i).getQty());

            da.insertOrderentry(newOrder);
            da.deleteShoppingcartentry(temp.get(i).getBarang().getIdBarang(), idPengguna);
        }
        RequestDispatcher rd
                = request.getRequestDispatcher("userprofile.jsp");
        rd.forward(request, response);
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
        int idSc = (Integer) request.getAttribute("idSc");
        int idPengguna = (Integer) request.getAttribute("idPengguna");
        ArrayList<Shoppingcartentry> temp = new ArrayList<>();
        temp = da.getShoppingcartentryByID(idSc);
        Transaksi transaksi = da.getTransaksibyUserId(idPengguna);
        for(int i=0; i<temp.size(); i++){
            Orderentry newOrder = new Orderentry();
            newOrder.setTransaksi(transaksi);
            newOrder.setBarang(temp.get(i).getBarang());
            newOrder.setQty(temp.get(i).getQty());

            da.insertOrderentry(newOrder);
            da.deleteShoppingcartentry(temp.get(i).getBarang().getIdBarang(), idPengguna);
        }
        RequestDispatcher rd
                = request.getRequestDispatcher("userprofile.jsp");
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
