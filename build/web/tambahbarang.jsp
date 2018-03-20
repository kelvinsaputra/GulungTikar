<%-- 
    Document   : tambahbarang
    Created on : Mar 12, 2018, 4:55:37 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Toko"%>
<%@page import="model.Kategori"%>
<%@page import="controller.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="tambahbarangServlet?idToko=<%=Integer.parseInt(request.getParameter("idToko"))%>" method="post">
            Nama Barang : <input type="text" name="namabarang">
            Harga Barang : <input type="text" name="hargabarang">
            
            <%
                SystemDA da = new SystemDA();
                ArrayList<Kategori> kategori= new ArrayList<Kategori>();
                kategori = da.getAllKategori();

                if(kategori!=null){
                    for(int i=0;i<kategori.size();i++){
            %>
            Pilih kategori : <input type="radio" name="type" value="<%=kategori.get(i).getIdKategori()%>"> <%=kategori.get(i).getNamaKategori()%>
            <%
                    }                    
                }

            %>

            <button type="submit"> Tambah Barang! </button>
        </form>
    </body>
</html>
