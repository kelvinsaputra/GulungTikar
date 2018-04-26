<%-- 
    Document   : index
    Created on : Mar 2, 2018, 10:31:09 AM
    Author     : fsury
--%>

<%@page import="model.Kategori"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.SystemDA"%>
<%@page import="model.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Gulung Tikar Insert Barang</title>

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
                <div class="col-12">
                    <center><h1>Insert Barang</h1></center>
                </div>
                <div class="col-6">
                    <form enctype="multipart/form-data" action="tambahbarangServlet?idToko=<%=Integer.parseInt(request.getParameter("idToko"))%>" method="post">
                        <div class="form-group">
                            <label>Nama Barang :</label>
                            <div class="form-group">
                                <input class="form-control" type="text" name="namabarang">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Harga Barang :</label>
                            <div class="form-group">
                                <input class="form-control" type="text" name="hargabarang">
                            </div>
                        </div>
                        <div class="form-group">
                            Pilih kategori :<br>
                            <%
                                SystemDA da = new SystemDA();
                                ArrayList<Kategori> kategori = new ArrayList<Kategori>();
                                kategori = da.getAllKategori();

                                if (kategori != null) {
                                    for (int i = 0; i < kategori.size(); i++) {
                            %>
                            <input type="radio" name="type" value="<%=kategori.get(i).getIdKategori()%>"> <%=kategori.get(i).getNamaKategori()%><br>
                            <%
                                    }
                                }

                            %>
                        </div>
                        <div class="form-group">
                            Upload Picture : <input type="file" name="file" id="file"  >
                        </div>
                        <button class="btn btn-primary" type="submit"> Tambah Barang </button>
                        <br>
                    </form>
                </div>

            </div>
        </div>
        <!-- /.container -->

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
