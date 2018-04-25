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
import model.Pengguna;
import model.Shoppingcart;
import model.Shoppingcartentry;
import model.ShoppingcartentryId;


/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/ShoppingCartServlet"})
public class ShoppingCartServlet extends HttpServlet {

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
            out.println("<title>Servlet ShoppingCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShoppingCartServlet at " + request.getContextPath() + "</h1>");
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
        Shoppingcartentry temp = new Shoppingcartentry();
        int idBarang = Integer.parseInt(request.getParameter("idBarang"));
        int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
        int qty = Integer.parseInt(request.getParameter("qty"));
        if(qty>=1){
            ArrayList<Pengguna> temppengguna = new ArrayList<Pengguna>();
        temppengguna = da.getAllUser();
        Pengguna pengguna = new Pengguna();

        for (int i = 0; i < temppengguna.size(); i++) {
            if (temppengguna.get(i).getIdPengguna() == idPengguna) {
                pengguna = temppengguna.get(i);
            }
        }

        boolean udahPunyaList = false;
        ArrayList<Shoppingcart> tempsc = new ArrayList<Shoppingcart>();
        tempsc = da.getAllShoppingcart();
        ShoppingcartentryId sid = new ShoppingcartentryId();

        if (tempsc != null) {
            for (int i = 0; i < tempsc.size(); i++) {
                if (tempsc.get(i).getPengguna().getIdPengguna() == idPengguna) {
                    udahPunyaList = true;
                }
            }

            if (udahPunyaList == false) {
                Shoppingcart newSc = new Shoppingcart();
                newSc.setPengguna(pengguna);
                sid.setIdShoppingcart(da.insertShoppingcart(newSc));
            } else {
                ArrayList<Shoppingcart> scart = new ArrayList<Shoppingcart>();
                scart = da.getAllShoppingcart();

                for (int i = 0; i < scart.size(); i++) {
                    if (scart.get(i).getPengguna().getIdPengguna() == idPengguna) {//comment hbmxml user ke wish, tetep wish ke user
                        sid.setIdShoppingcart(scart.get(i).getIdShoppingcart());
                    }
                }
            }

            sid.setIdBarang(idBarang);
            temp.setId(sid);
            temp.setQty(qty);

            da.insertShoppingcartentry(temp);
        }   
            RequestDispatcher rd
                            = request.getRequestDispatcher("shoppingcart.jsp");
                    rd.forward(request, response);
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
