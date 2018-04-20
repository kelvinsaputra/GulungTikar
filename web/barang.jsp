<%-- 
    Document   : barang
    Created on : Apr 2, 2018, 5:13:51 PM
    Author     : user
--%>
<%@page import="java.util.Random"%>
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
        <link href="vendor/bootstrap/css/product-detail.css" rel="stylesheet">
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
        %>        
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img src="res/<%= barang.getIdBarang()%>.jpg" /></div>
                                <div class="tab-pane" id="pic-2"><img src="res/<%= barang.getIdBarang()%>.jpg" /></div>
                                <div class="tab-pane" id="pic-3"><img src="res/<%= barang.getIdBarang()%>.jpg" /></div>
                                <div class="tab-pane" id="pic-4"><img src="res/<%= barang.getIdBarang()%>.jpg" /></div>
                                <div class="tab-pane" id="pic-5"><img src="res/<%= barang.getIdBarang()%>.jpg" /></div>
                            </div>
                            <ul class="preview-thumbnail nav nav-tabs">
                                <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="res/<%= barang.getIdBarang()%>.jpg" /></a></li>
                                <li><a data-target="#pic-2" data-toggle="tab"><img src="res/<%= barang.getIdBarang()%>.jpg" /></a></li>
                                <li><a data-target="#pic-3" data-toggle="tab"><img src="res/<%= barang.getIdBarang()%>.jpg" /></a></li>
                                <li><a data-target="#pic-4" data-toggle="tab"><img src="res/<%= barang.getIdBarang()%>.jpg" /></a></li>
                                <li><a data-target="#pic-5" data-toggle="tab"><img src="res/<%= barang.getIdBarang()%>.jpg" /></a></li>
                            </ul>

                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title"><%= barang.getNamaBarang()%></h3>
                            <div class="rating">
                                <div class="stars">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">Toko : <a href="#"> <%=pengguna.getNama()%>'s Shop </a><br></span>
                                <span class="review-no">Alamat : <%=toko.getAlamatToko()%><br></span>
                            </div>
                            <p class="product-description">Suspendisse quos? Tempus cras iure temporibus? Eu laudantium cubilia sem sem! Repudiandae et! Massa senectus enim minim sociosqu delectus posuere.</p>
                            <h4 class="price">Harga : <span><%= barang.getHargaBarang()%></span></h4>
                            <% Random rand = new Random();
                               int n = rand.nextInt(50)+50; %>
                            <p class="vote"><strong><%=n%>%</strong> merasa puas dengan produk ini! <strong>(Survey penjual)</strong></p>
                            
                            <% if (username == null && idPengguna == -1) { %>
                            <br><br>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button"><a href="/GulungTikar/login.jsp" style="text-decoration: none; color: white;">add to cart</a></button>
                            </div>
                            <%
                            } else {
                                //cek tipe kalo udah ada yg login
                                Pengguna user = da.getUserById(idPengguna); //pengguna yg lagi login, kalo diatas pengguna yg punya toko
                                if (user.getType().equals("Pembeli")) {//kalo pembeli yg login view barang
                                    Etalase etalasee = da.getEtalaseByID(barang.getIdBarang());
                                    Toko tokoo = etalasee.getToko();
                                    Pengguna penggunaa = tokoo.getPengguna();
                                    String tersedia = "Tidak";
                                    if(etalasee.isKetersediaan()){
                                        tersedia = "Ya";
                                    }
                            %>
                            <span class="review-no">Tersedia : <%=tersedia%><br></span>
                            <br><br>
                            <div class="action">
                                <form action='ShoppingCartServlet?idBarang=<%=barang.getIdBarang()%>' method="post">
                                    <input type='number' value='1' id="qty" name="qty"/>
                                    <button class="add-to-cart btn btn-default" type="submit">add to cart</button>
                                </form>
                                
                                <form action='wishlist?idBarang=<%=barang.getIdBarang()%>' method='POST'>
                                    <button class="add-to-cart btn btn-default" type="submit" style="background-color: pink; color: red;">add to wishlist</button>
                                </form>
                                
                            </div>
                            <%
                                } else if (user.getType().equals("Penjual")) { //kalo penjual yg login view barang, nanti line ini kebawah bisa jadi else aja jd ga redundan, kecuali next step ada yg dibedain
                            %>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button" disabled>add to cart</button>
                            </div>
                            <%
                                } else { //kalo admin yg login view barang
                            %>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button" disabled>add to cart</button>
                            </div>
                            <%
                                       }
                                    }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        <br/>
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
