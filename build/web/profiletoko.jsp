<%-- 
    Document   : profiletoko
    Created on : Mar 12, 2018, 3:14:36 PM
    Author     : user
--%>
<%@page import="model.Session"%>
<%@page import="model.Pengguna"%>
<%@page import="model.Barang"%>
<%@page import="model.Etalase"%>
<%@page import="model.Toko"%>
<%@page import="controller.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
            Session current = new Session();
           
            SystemDA da = new SystemDA();
            ArrayList<Toko> toko = new ArrayList<Toko>();
            Toko temp = new Toko();
            if(current.getPengguna()!=null){
                toko = da.getAllToko();
            }
            
            if(toko!=null){
                
            
            for(int i=0;i<toko.size();i++){
                if(toko.get(i).getPengguna().getIdPengguna()==current.getPengguna().getIdPengguna()){
                    temp = toko.get(i);
                }
            }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Profile Toko</h1>

        <h3>Alamat toko: <%= temp.getAlamatToko()%></h3>
        <h3>Status toko: <%= temp.isStatus()%></h3>
        <!--<form action="editToko.jsp?idToko=<%=temp.getIdToko()%>" method="post">
            <button type="submit"> Edit Toko </button>
        </form>-->
        <h1>ETALASE TOKO HEHE</h1>
        <form action="tambahbarang.jsp?idToko=<%=temp.getIdToko()%>" method="post">
            <button type="submit"> Tambah barang </button>
        </form>
        <%ArrayList<Etalase> etalase = new ArrayList<Etalase>();
            Etalase tempetalase = new Etalase();
            etalase=da.getAllEtalase();
            
            if(etalase!=null){
                
            
        %>
    <legend>List barang</legend>
    <form method="post">
        <table>
            <tr>
                <td>Nama</td>
                <td>Harga</td>
                <td>Ketersediaan</td>
            </tr>

            <%
            ArrayList<Barang> barang = new ArrayList<Barang>();
            barang=da.getAllBarang();
            
            for(int i=0;i<etalase.size();i++){
                if(etalase.get(i).getToko().getIdToko()==temp.getIdToko()){
            %>
            <tr>
                <%
                    for(int j=0;j<barang.size();j++){
                        if(barang.get(j).getIdBarang()==etalase.get(i).getBarang().getIdBarang()){
                %>
                <td><%=barang.get(j).getNamaBarang()%></td>
                <td><%=barang.get(j).getHargaBarang()%></td>
                <td><%=etalase.get(i).isKetersediaan()%></td>
                <td> <input type="submit" formaction="editbarang.jsp?idBarang=<%=barang.get(j).getIdBarang()%>" value="Edit Barang"></td>
                <td> <input type="submit" formaction="deletebarangServlet?idBarang=<%=barang.get(j).getIdBarang()%>&idToko=<%=temp.getIdToko()%>" value="Delete Barang"></td>
                    <%
                            }
                        }
                    %>
            </tr>

            <%
                }
            }
    }
    } else {
            %>
            <h1> null</h1>
            <%}%>
        </table>
    </form>

</body>
</html>
