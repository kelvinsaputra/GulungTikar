<%-- 
    Document   : index
    Created on : Mar 2, 2018, 10:31:09 AM
    Author     : fsury
--%>

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

        <!-- Navigation -->
        <jsp:include page="nav.jsp"/>
        <%
            System.out.print((String) request.getSession(false).getAttribute("username"));
        %>
        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <!--                <div class="col-lg-3">
                
                                    <h1 class="my-4">Shop Name</h1>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">Category 1</a>
                                        <a href="#" class="list-group-item">Category 2</a>
                                        <a href="#" class="list-group-item">Category 3</a>
                                    </div>z
                
                                </div>-->
                <!-- /.col-lg-3 -->

                <div class="col-lg-12">

                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="res/slide-1.png" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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
                            <h3>Recently Added</h3>
                        </div>

                        <div class="ml-auto">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle ml-auto" type="button" data-toggle="dropdown">Sort
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu drop">
                                    <li class="dropdown-item"><a href="#">Customer ID</a></li>
                                    <li class="dropdown-item"><a href="#">Name</a></li>
                                </ul>
                            </div>
                        </div>
                        <hr class="col-12">

                        <%
                            ArrayList<Barang> listBarang = new SystemDA().getAllBarang();
                            for (int i = 0; i < listBarang.size(); i++) {
                        %>    

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="res/<%= listBarang.get(i).getIdBarang()%>.jpg" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#"><%= listBarang.get(i).getNamaBarang()%></a>
                                    </h4>
                                    <h5>Rp. <%= listBarang.get(i).getHargaBarang()%></h5>
                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>
                        <% }%>
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
