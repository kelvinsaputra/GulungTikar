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
           
            String username = (String) request.getSession(false).getAttribute("username");
            int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
            SystemDA da = new SystemDA();
            ArrayList<Toko> toko = new ArrayList<Toko>();
            Toko temp = new Toko();
            if(username!=null){
                toko = da.getAllToko();
            }
            
            if(toko!=null){
                
            
            for(int i=0;i<toko.size();i++){
                if(toko.get(i).getPengguna().getIdPengguna()==idPengguna){
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
                <jsp:include page="nav.jsp"/>
        <h1>Profile Toko</h1>

        <form action="editToko?idToko=<%=temp.getIdToko()%>" method="post">
            <h3>Alamat toko: <input type="text" name="alamat" value="<%= temp.getAlamatToko()%>" > </h3>
            <h3>Status toko: <input type="text" name="status" value="<%= temp.isStatus()%>" ></h3>
            <button type="submit"> Edit Toko </button>
        </form>

        <h1>ETALASE TOKO HEHE</h1>
        <%
            String gagalEdit = request.getParameter("statusEdit");
            if(gagalEdit!=null){
                if(gagalEdit.equals("0")){
        %>
        <h3> gagal edit barang! </h3>
        <%
                } else {
        %>
        <h3> berhasil edit barang! </h3>
        <%
}
}
        %>
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
