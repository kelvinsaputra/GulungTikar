/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.SystemDA;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pengguna;
import model.Transaksi;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "TransaksiServlet", urlPatterns = {"/TransaksiServlet"})
public class TransaksiServlet extends HttpServlet {

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
            out.println("<title>Servlet TransaksiServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransaksiServlet at " + request.getContextPath() + "</h1>");
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
        SystemDA da = new SystemDA();
        int idSc = Integer.parseInt(request.getParameter("idSc"));
        int idPengguna = Integer.parseInt(request.getParameter("idPengguna"));
        String alamat = request.getParameter("alamat");
        String catatan = request.getParameter("catatan");
        Pengguna pengguna = da.getUserById(idPengguna);
        Transaksi transaksi = new Transaksi();
        transaksi.setPengguna(pengguna);
        transaksi.setTanggal(new Date());
        transaksi.setCatatan(catatan);
        transaksi.setKurir("J&T");
        transaksi.setStatus("Sedang dikirim");
        transaksi.setAlamatPengiriman(alamat);
        
        da.insertTransaksi(transaksi);
        
        RequestDispatcher rd=request.getRequestDispatcher("/orderEntryServlets");
        request.setAttribute("idSc", idSc);
        request.setAttribute("idPengguna", idPengguna);
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
