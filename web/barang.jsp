<%-- 
    Document   : barang
    Created on : Apr 2, 2018, 5:13:51 PM
    Author     : user
--%>
<%@page import="model.Pengguna"%>
<%@page import="model.Toko"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="model.Etalase"%>
<%@page import="java.util.HashSet"%>
<%@page import="model.Barang"%>
<%@page import="controller.SystemDA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shop Homepage - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link type="text/css" href="css/shop-homepage.css" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <%
            String statusLogin = (String) request.getSession(false).getAttribute("statusLogin");
            String username = null;
            int idPengguna = -1;
            if (statusLogin != null) {
                if (statusLogin.equals("1")) { //kalo ada yg login
                    username = (String) request.getSession(false).getAttribute("username");
                    idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
                }
            }

            String id = (String) request.getParameter("idBarang");
            int idBarang = Integer.parseInt(id);
            SystemDA da = new SystemDA();
            Barang barang = new Barang();
            barang = da.getBarangByID(idBarang);

            Etalase etalase = da.getEtalaseByID(idBarang);
            Toko toko = etalase.getToko();
            Pengguna pengguna = toko.getPengguna();

            if (username == null && idPengguna == -1) {
        %>

        Toko : <a href="#"> <%=pengguna.getNama()%>'s Shop </a><br>
        Alamat : <%=toko.getAlamatToko()%><br>
        Nama : <%= barang.getNamaBarang()%><br>
        Harga : <%= barang.getHargaBarang()%><br>
        <%
        } else {
            //cek tipe kalo udah ada yg login
            Pengguna user = da.getUserById(idPengguna); //pengguna yg lagi login, kalo diatas pengguna yg punya toko
            if (user.getType().equals("Pembeli")) {//kalo pembeli yg login view barang
        %>
        Toko : <a href="#> "<%=pengguna.getNama()%>'s Shop </a><br>
        Alamat : <%=toko.getAlamatToko()%><br>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="barang.jsp?idBarang=<%=barang.getIdBarang()%>"><img class="card-img-top" src="res/<%= barang.getIdBarang()%>.jpg" alt=""></a>
                <div class="card-body">
                    <h4 class="card-title">
                        <a href="barang.jsp?idBarang=<%=barang.getIdBarang()%>"><%= barang.getNamaBarang()%></a>
                    </h4>
                    <h5>Rp. <%=barang.getHargaBarang()%>,00</h5>
                    <%
                        Etalase etalasee = da.getEtalaseByID(barang.getIdBarang());
                        Toko tokoo = etalasee.getToko();
                        Pengguna penggunaa = tokoo.getPengguna();
                    %>
                    <p class="card-text"><%=penggunaa.getNama()%>'s Shop</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
            </div>
        </div>
        <input type="submit" formaction="addToCart?idBarang=<%=idBarang%>" value="Add to cart!">
        <form action="wishlist?idBarang=<%=idBarang%>" method="post">
            <input type="submit" value="Add to Wishlist!">
        </form>

        <%
        } else if (user.getType().equals("Penjual")) { //kalo penjual yg login view barang, nanti line ini kebawah bisa jadi else aja jd ga redundan, kecuali next step ada yg dibedain
        %>
        Toko : <a href="#> "<%=pengguna.getNama()%>'s Shop </a><br>
        Alamat : <%=toko.getAlamatToko()%><br>
        Nama : <%= barang.getNamaBarang()%><br>
        Harga : <%= barang.getHargaBarang()%><br>
        <%
        } else { //kalo admin yg login view barang
        %>
        Toko : <a href="#> "<%=pengguna.getNama()%>'s Shop </a><br>
        Alamat : <%=toko.getAlamatToko()%><br>
        Nama : <%= barang.getNamaBarang()%><br>
        Harga : <%= barang.getHargaBarang()%><br>
        <%
                }

            }


        %>
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
