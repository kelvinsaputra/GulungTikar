<%-- 
    Document   : shoppingcart
    Created on : Mar 6, 2018, 12:31:20 PM
    Author     : LENOVO
--%>

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

        <title>Gulung Tikar Cart</title>

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
    <center><h1>Shopping Cart</h1></center>
    <hr>
        <%

            SystemDA da = new SystemDA();            
            Shoppingcart shoppingcart = new Shoppingcart();
            int idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
            shoppingcart = da.getShoppingcartByID(idPengguna);
            ArrayList<Shoppingcartentry> shoppingCartE = da.getShoppingcartentryByID(shoppingcart.getIdShoppingcart());
            if(shoppingCartE!=null)
            {
            if(shoppingcart!=null)
            {
            ArrayList<Shoppingcartentry> sce = da.getShoppingcartentryByID(shoppingcart.getIdShoppingcart());
            if(sce.size()!=0)
            {
        %>

        <!-- Page Content -->
        <div class="container" style="padding: 5%">
            <table id="cart" class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:50%">Product</th>
                        <th style="width:10%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:22%" class="text-center">Subtotal</th>
                        <th style="width:10%"></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (int i = 0; i < sce.size(); i++) {
                    %>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-2 hidden-xs"><img class="tab-pane" src="res/<%= sce.get(i).getBarang().getIdBarang()%>.jpg" alt="..." class="img-responsive"/></div>
                                <div class="col-sm-10" style="padding-left: 10%;">
                                    <h4 class="nomargin"><%= sce.get(i).getBarang().getNamaBarang() %></h4>
                                    <p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">Rp. <%= sce.get(i).getBarang().getHargaBarang() %></td>
                        <td data-th="Quantity">
                            <input type="number" class="form-control text-center" value='<%= sce.get(i).getQty() %>' min="0">
                        </td>
                        
                        <td data-th="Subtotal" class="text-center"></td>
                        <td class="actions" data-th="">
                            <form action="deleteShoppingCartEntry" method="POST">
                                <input type="hidden" name="idBarang" class="form-control" value="<%=sce.get(i).getBarang().getIdBarang()%>">
                                <input type="hidden" name="idPengguna" class="form-control" value="<%=idPengguna%>">
                                <button class="btn btn-danger btn-sm">Delete</button>								
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <td><a href="index.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                        <td colspan="2" class="hidden-xs"></td>
                        <td class="hidden-xs text-center"><strong></strong></td>
                        <td>
                            <form action="transaksi.jsp?idSc=<%=shoppingcart.getIdShoppingcart()%>" method="post">
                                <input type="hidden" id="idSc" name="idSc" value="">
                                <button class="btn btn-success btn-sm">Checkout</button>
                            </form>
                        </td>
                    </tr>
                     </tfoot>
            </table>
                    <% }
            }
            }else
            {%>
            <center><img class="d-block img-fluid" src="res/empty_cart.jpeg" alt="empty cart"></center>

            <%}%>
               
        </div>
        <br>

        <jsp:include page="footer.jsp"/>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>