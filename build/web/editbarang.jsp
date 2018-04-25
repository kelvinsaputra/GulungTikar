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

        <title>Gulung Tikar Edit</title>

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
                <%
                    int idBarang = -1;
                    idBarang = Integer.parseInt(request.getParameter("idBarang"));

                    SystemDA da = new SystemDA();
                    ArrayList<Barang> temp = new ArrayList<Barang>();
                    temp = da.getAllBarang();
                    String namaLama = null, harga = null;

                    for (int i = 0; i < temp.size(); i++) {
                        if (temp.get(i).getIdBarang() == idBarang) {
                            namaLama = temp.get(i).getNamaBarang();
                            harga = temp.get(i).getHargaBarang();
                        }
                    }
                    if (idBarang != -1 && namaLama != null && harga != null) {

                %>
                <div class="col-12">
                    <h1>Edit barang</h1>
                </div>
                <div class="col-12">
                    <form action="editbarangServlet?idBarang=<%=idBarang%>" method="post">
                        <div class="form-group">
                            <label>Nama  : </label>
                             <input class="form-control" type="text" name="nama" value="<%=namaLama%>">
                        </div>
                        <div class="form-group">
                            <label>Harga : </label>
                            <input class="form-control" type="text" name="harga" value="<%=harga%>">
                        </div>
                        <div class="form-group">
                            <!-- kurang tambahin edit ketersediaan di etalase<!---->            
                            <button class="btn btn-primary" type="submit" method="post"> Edit </button> 
                        </div>
                    </form>
                </div>

                <%} else {
                %> <h1> error input idBarang</h1><%
                }%>
            </div>
        </div>
        <br>

        <jsp:include page="footer.jsp"/>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>