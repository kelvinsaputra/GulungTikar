/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.AdminDA;
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
import model.Etalase;
import model.Orderentry;
import model.Pengguna;
import model.Toko;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ForwardPaymentServlet", urlPatterns = {"/ForwardPaymentServlet"})
public class ForwardPaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet ForwardPaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForwardPaymentServlet at " + request.getContextPath() + "</h1>");
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
        int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
        int idTrx = Integer.parseInt(request.getParameter("idTrx"));
        
        
        AdminDA ada = new AdminDA();
        ada.updateStatus(idTrx);
        
        SystemDA da = new SystemDA(); 
        ArrayList<Orderentry> oe = da.getOrderEntryByID(idTrx);
        for(int i=0; i<oe.size(); i++){
            String harga = (String) oe.get(i).getBarang().getHargaBarang();
            int hargaBarang = Integer.parseInt(harga);
            Etalase et = da.getEtalaseByID(oe.get(i).getBarang().getIdBarang());
            int idToko = et.getToko().getIdToko();
            Toko toko = da.getTokoById(idToko);
            Pengguna penjual = toko.getPengguna();
            int saldo = penjual.getSaldo() + hargaBarang * oe.get(i).getQty();
            ada.updateSaldo(penjual.getIdPengguna(), saldo);
        }
        System.out.println("==========================================================");
        RequestDispatcher rd
                = request.getRequestDispatcher("admin.jsp");
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
