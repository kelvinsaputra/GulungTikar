<%-- 
    Document   : profiletoko
    Created on : Mar 12, 2018, 3:14:36 PM
    Author     : user
--%>
<%@page import="java.io.File"%>
<%@page import="model.Session"%>
<%@page import="model.Pengguna"%>
<%@page import="model.Barang"%>
<%@page import="model.Etalase"%>
<%@page import="model.Toko"%>
<%@page import="controller.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Bootstrap core CSS -->



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gulung Tikar Shop</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="js/bootstrap.min.js"></script>

        <!-- Custom styles for this template -->
        <link type="text/css" href="css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <%

            String username = (String) request.getSession(false).getAttribute("username");
            int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
            SystemDA da = new SystemDA();
            Toko toko = new Toko();
            toko = da.getTokoByIdPengguna(idPengguna);
            if (toko != null) {
        %>
        <jsp:include page="nav.jsp"/>

        <div class="container">

            <div class="row">
                <div class="col-12">
                    <div col-12>
                        <h1><%=toko.getPengguna().getNama()%>'s Shop</h1>
                    </div>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-12">
                            <form action="editToko?idToko=<%=toko.getIdToko()%>" method="post">
                                <div class="form-group col-12">
                                    <label>Shop Address: </label>
                                    <input class="form-control" type="text" name="alamat" value="<%= toko.getAlamatToko()%>">
                                </div>
                                <div class="form-group col-11">
                                    Shop Status:
                                    <%
                                        boolean status = toko.isStatus();
                                    %>
                                    <div class="radio">
                                        <label>
                                            <%
                                                if (toko.isStatus()) {
                                            %>
                                            <input type="radio" name="status" value="1" checked="checked">Open
                                            <input type="radio" name="status" value="0">Closed
                                            <%
                                            } else {
                                            %>
                                            <input type="radio" name="status" value="1">Open
                                        </label>
                                        <label>
                                            <input type="radio" name="status" value="0" checked="checked">Closed
                                            <%}%>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group ml-auto">
                                    <button class="btn btn-primary" type="submit"> Edit Shop </button>
                                </div>
                            </form>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-10">
                            <h1>Etalase</h1>
                        </div>
                        <div class="col-2">
                            <form action="tambahbarang.jsp?idToko=<%=toko.getIdToko()%>" method="post">
                                <button class="btn btn-primary" type="submit"> Tambah Barang </button>
                            </form>
                        </div>
                    </div>
                    <%
                        String gagalEdit = request.getParameter("statusEdit");
                        if (gagalEdit != null) {
                            if (gagalEdit.equals("0")) {
                    %>
                    <h3> Gagal edit barang! </h3>
                    <%
                    } else {
                    %>
                    <h3> Berhasil edit barang! </h3>
                    <%
                            }
                        }
                    %>

                    <%
                        ArrayList<Etalase> etalase = new ArrayList<Etalase>();
                        Etalase tempetalase = new Etalase();
                        etalase = da.getAllEtalase();

                        if (etalase != null) {


                    %>
                    <legend>List Barang</legend>
                    <form method="post">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <td style="width: 30%;">Picture</td>
                                    <td style="width: 20%;">Nama</td>
                                    <td style="width: 20%;">Harga</td>
                                    <td style="width: 5%">Ketersediaan</td>
                                    <td style="width: 25%" colspan="2">Options</td>
                                </tr>
                            </thead>
                            <%                                ArrayList<Barang> barang = new ArrayList<Barang>();
                                barang = da.getAllBarang();
                                String current = new java.io.File(".").getCanonicalPath();
                                System.out.println("Current dir:" + current);
                                File webRootPath = new File(application.getRealPath("/")).getParentFile().getParentFile();
                                System.out.println("Current dir:" + webRootPath);
                                for (int i = 0; i < etalase.size(); i++) {
                                    if (etalase.get(i).getToko().getIdToko() == toko.getIdToko()) {
                            %>
                            <tbody
                                <tr>
                                    <%
                                        for (int j = 0; j < barang.size(); j++) {
                                            if (barang.get(j).getIdBarang() == etalase.get(i).getBarang().getIdBarang()) {
                                    %>
                                    <td><img alt="User picture" src="res/<%=barang.get(j).getIdBarang()%>.jpg" class="img-fluid rounded"/></td>
                                    <td><%=barang.get(j).getNamaBarang()%></td>
                                    <td><%=barang.get(j).getHargaBarang()%></td>
                                    <td><%=etalase.get(i).isKetersediaan()%></td>
                                    <td> <input class="btn btn-outline-success" type="submit" formaction="editbarang.jsp?idBarang=<%=barang.get(j).getIdBarang()%>" value="Edit Barang"></td>
                                    <td> <input class="btn btn-danger" type="submit" formaction="deletebarangServlet?idBarang=<%=barang.get(j).getIdBarang()%>&idToko=<%=toko.getIdToko()%>" value="Delete Barang"></td>
                                        <%
                                                }
                                            }
                                        %>
                                </tr>
                            </tbody>

                            <%
                                    }
                                }
                            %>
                        </table>
                    </form>
                </div>
                <%
                    }

                } else {
                %>
                <jsp:include page="nav.jsp"/>
                <div class="container">
                    <h2>You don't have a shop yet! Make your first shop by entering its address</h2>
                    <form action="bukaToko" method="post" class="">
                        <center><div class="form-group">
                                <input type="text" class="form-control col-4" name="alamat" placeholder="Shop Address">
                            </div>
                            <div class="form-group mx-auto">
                                <button class="btn btn-primary col-4" type="submit"> Create Shop </button>
                            </div></center>
                    </form>
                </div>
                <%}%>

            </div>
        </div>

        <jsp:include  page="footer.jsp"/>
    </body>
</html>
