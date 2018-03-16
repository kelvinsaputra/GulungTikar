<%-- 
    Document   : editbarang
    Created on : Mar 16, 2018, 8:48:31 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Barang"%>
<%@page import="controller.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int idBarang = Integer.parseInt(request.getParameter("idBarang"));
            SystemDA da = new SystemDA();
            ArrayList<Barang> temp = ArrayList<Barang>();
            temp = da.getAllBarang();
            String namaLama,harga;
            
            for(int i=0 ;i<temp.size();i++){
                if(temp.get(i).getIdBarang()==idBarang){
                    namaLama = temp.get(i).getNamaBarang();
                    harga = temp.get(i).getHargaBarang();
                }
            }
            
            String gagal = request.getParameter("gagal");
                                if (gagal != null) {
                                    out.println("Edit gagal! Pastikan semua field terisi!");
                                }
        %>
        <h1>Edit barang!</h1>
        <form action="editbarangServlet?idBarang=<%=idBarang%>" method="post">
            Nama  : <input type="text" name="nama" placeholder="<%=namaLama%>">
            Harga : <input type="text" name="harga" placeholder="<%=harga%>">
        </form>
    </body>
</html>
