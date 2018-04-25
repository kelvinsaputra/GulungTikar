<%-- 
    Document   : search
    Created on : Apr 25, 2018, 12:09:24 PM
    Author     : LENOVO
--%>

<%@page import="model.Pengguna"%>
<%@page import="model.Toko"%>
<%@page import="java.util.Set"%>
<%@page import="model.Etalase"%>
<%@page import="model.Barang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.SystemDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shop Homepage - Search</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link type="text/css" href="css/shop-homepage.css" rel="stylesheet">

    </head>

    <body>
        <!-- Navigation -->
        <jsp:include page="nav.jsp"/>
        <%
            System.out.print((String) request.getSession(false).getAttribute("username"));
        %>

        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <% int sortType = 0;
                       String namaBrg = (String) request.getParameter("nama");
                        try{
                            sortType = Integer.parseInt(request.getParameter("sort"));
                        }catch(Exception e){
                            session.setAttribute("search", namaBrg);
                        }
                    %>
                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="res/slide/slide-1.png" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="res/slide/slide-2.png" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="res/slide/slide-3.png" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="row">
                        <div class="col-md-9">
                            <h3>Search Result</h3>
                        </div>

                        <div class="ml-auto">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle ml-auto" type="button" data-toggle="dropdown">Sort
                                    <span class="caret"></span></button>
                                        <ul class="dropdown-menu drop">
                                            <li class="dropdown-item"><a href="search.jsp?sort=1">Name</a></li>
                                            <li class="dropdown-item"><a href="search.jsp?sort=2">Price</a></li>
                                        </ul>
                            </div>
                        </div>
                        <hr class="col-12">

                        <%
                            String nama = (String) session.getAttribute("search");
                            SystemDA da = new SystemDA();
                            ArrayList<Barang> listBarang = null;
                            if(sortType==0){
                                listBarang = da.searchBarang(nama);
                            }else{
                                if(sortType ==1){
                                    listBarang = da.searchBarangOrderbyNama(nama);
                                }else{
                                    listBarang = da.searchBarangOrderbyHarga(nama);
                                }
                            }
                            
                            Set<Etalase> listEtalase;
                            if(listBarang.size()>0){
                                for (int i = 0; i < listBarang.size(); i++) {
                        %>    
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="card h-100">
                                        <a href="barang.jsp?idBarang=<%=listBarang.get(i).getIdBarang()%>"><img class="card-img-top" src="res/<%= listBarang.get(i).getIdBarang()%>.jpg" alt=""></a>
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a href="barang.jsp?idBarang=<%=listBarang.get(i).getIdBarang()%>"><%= listBarang.get(i).getNamaBarang()%></a>
                                            </h4>
                                            <h5>Rp. <%= listBarang.get(i).getHargaBarang()%>,00</h5>
                                            <%
                                                Etalase etalase = da.getEtalaseByID(listBarang.get(i).getIdBarang());
                                                Toko toko = etalase.getToko();
                                                Pengguna pengguna = toko.getPengguna();
                                            %>
                                            <p class="card-text"><%=pengguna.getNama()%>'s Shop</p>
                                        </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>
                                 <% } %>
                        <% } else { %>
                        <br><br><br>
                        <h4 style="color: red;">Oops... hasil pencarian anda tidak dapat ditemukan.</h4>
                        <h5>Silahkan melakukan pencarian kembali dengan menggunakan kata kunci lain.</h5>
                            <br><br><br><br><br><br>
                        <% } %>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
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
