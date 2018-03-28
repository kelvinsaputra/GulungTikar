/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import controller.PenjualDA;
import controller.SystemDA;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
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
@MultipartConfig

public class tambahbarangServlet extends HttpServlet {
    public static String path;
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
            out.println("<h1>Servlet tambahbarangServlet at " + path + "</h1>");
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
        SystemDA da = new SystemDA();
        PenjualDA pa = new PenjualDA();
        ServletContext context = request.getServletContext();
        path = context.getRealPath("/");
//        final String path = "D:\\Git\\GulungTikar\\web\\css";
        final Part filePart = request.getPart("file");
        final int fileName = da.getIDBarang()+1;
        File temppath = new File(path).getParentFile().getParentFile();
        File fileBeneran = new File(temppath+"/web/res");
        System.out.println("===============================-"+fileBeneran);

        OutputStream out = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();

        try {
            out = new FileOutputStream(new File(fileBeneran + File.separator
                    + fileName+".jpg"));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
//            writer.println("New file " + fileName + " created at " + path);
//            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
//                    new Object[]{fileName, path});
            Barang temp = new Barang();

                    HashSet<Kategori> kategoris = new HashSet();
                    ArrayList<Kategori> kategori = new ArrayList<Kategori>();
                    kategori = da.getAllKategori();

            //        System.out.println(request.getParameter("type"));
                    for (int i = 0; i < kategori.size(); i++) {
                        if (kategori.get(i).getIdKategori() == Integer.parseInt(request.getParameter("type"))) {
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
                    idetalase.setIdBarang(pa.insertBarang(temp));
                    idetalase.setIdToko(Integer.parseInt(request.getParameter("idToko")));

                    ArrayList<Toko> toko = new ArrayList<Toko>();
                    Toko temptoko = new Toko();

                    for (int i = 0; i < toko.size(); i++) {
                        if (toko.get(i).getIdToko() == Integer.parseInt(request.getParameter("idToko"))) {
                            temptoko = toko.get(i);
                        }
                    }

                    Etalase etalase = new Etalase();
                    etalase.setKetersediaan(true);
            //        etalase.setToko(temptoko);
                    etalase.setId(idetalase);
            //        etalase.setBarang(temp);
            //  
            //        
                    da.insertEtalase(etalase);
            //        

                    RequestDispatcher rd
                            = request.getRequestDispatcher("userprofile.jsp");
                    rd.forward(request, response);
        } catch (FileNotFoundException fne) {
            writer.println("You either did not specify a file to upload or are "
                    + "trying to upload a file to a protected or nonexistent "
                    + "location.");
            writer.println("<br/> ERROR: " + fne.getMessage());

            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                    new Object[]{fne.getMessage()});
//        } finally {
//            if (out != null) {
//                out.close();
//            }
//            if (filecontent != null) {
//                filecontent.close();
//            }
//            if (writer != null) {
//                writer.close();
//            }
//        }
        
        

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
    
//    private String getFileName(final Part part) {
//    final String partHeader = part.getHeader("content-disposition");
//    LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
//    for (String content : part.getHeader("content-disposition").split(";")) {
//        if (content.trim().startsWith("filename")) {
//            return content.substring(
//                    content.indexOf('=') + 1).trim().replace("\"", "");
//        }
//    }
//    return null;
//}
}
