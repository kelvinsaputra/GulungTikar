<%-- 
    Document   : shoppingcart
    Created on : Mar 6, 2018, 12:31:20 PM
    Author     : fsury
--%>

<%@page import="model.Orderentry"%>
<%@page import="model.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Shoppingcartentry"%>
<%@page import="model.Shoppingcart"%>
<%@page import="model.Barang"%>
<%@page import="controller.SystemDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>GulungTikar Register</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/product-detail.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="js/bootstrap.min.js"></script>

        <!-- Custom styles for this template -->
        <link type="text/css" href="css/shop-homepage.css" rel="stylesheet">
        <link type="text/css" href="css/shop-shoppingcart.css" rel="stylesheet">
    </head>

    <body>

        <!-- Navigation -->
        <jsp:include page="nav.jsp"/>

        <hr>
        <%
            int total = 0;
            int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
            ArrayList<Transaksi> trx = new SystemDA().getTransaksiByIdPengguna(idPengguna);
        %>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <h1>Transaction History</h1>
                <% for (int i = 0; i < trx.size(); i++) {
                        ArrayList<Orderentry> order = new SystemDA().getOrderEntryByID(trx.get(i).getIdTransaksi());
                        System.out.print("=====================================" + order.size());
                %>

                <div class="col-lg-12 col-md-6 mb-4">
                    <div class="card h-60">
                        <div class="row">
                            <div class="mr-auto">
                                <h4>Transaction number:</h4>
                            </div>
                            <div class="ml-auto">
                                <%=trx.get(i).getIdTransaksi()%>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="width:40%">Product</th>
                                            <th style="width:20%">Price</th>
                                            <th style="width:8%">Quantity</th>
                                            <th style="width:10%"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int j = 0; j < order.size(); j++) {
                                                total += Integer.parseInt(order.get(j).getBarang().getHargaBarang()) * order.get(j).getQty();
                                        %>
                                        <tr>
                                            <td data-th="Product">
                                                <div class="row">
                                                    <div class="col-sm-5 hidden-xs"><img class="tab-pane" src="res/<%= order.get(j).getBarang().getIdBarang()%>.jpg" alt="..." class="img-responsive"/></div>
                                                    <div class="col-sm-7" style="padding-left: 10%;">
                                                        <h4 class="nomargin"><%= order.get(j).getBarang().getNamaBarang()%></h4>
                                                    </div>
                                                </div>
                                            </td>

                                            <td data-th="Price">
                                                Rp. <%= order.get(j).getBarang().getHargaBarang()%>
                                            </td>

                                            <td data-th="Qty">
                                                <%= order.get(j).getQty()%>
                                            </td>
                                        </tr>
                                        <% }%>
                                        <tr>                                 
                                            <td><h4>Sub total:</h4></td>
                                            <td colspan="2">Rp. <%= total%> </td>
                                        </tr>
                                        <tr>                                 
                                            <td><h4>Status:</h4></td>
                                            <td><%= trx.get(i).getStatus()%> </td>
                                            <td>
                                                <%if(!trx.get(i).getStatus().equalsIgnoreCase("sudah diterima")){ %>
                                                <form action="konfirmasiServlet" method="GET">
                                                    <input class="btn btn-outline-success" type="submit" value="Konfirmasi Penerimaan">
                                                    <input type="hidden" name="idTrx" value="<%= trx.get(i).getIdTransaksi() %>"/>
                                                </form>
                                                <%} total=0;%>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">last updated: <%= trx.get(i).getTanggal() %></small>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <br>

        <jsp:include page="footer.jsp"/>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>