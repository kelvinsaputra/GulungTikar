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

        <title>Insert Barang</title>

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
            <center><h1>Insert Barang</h1></center>
        <form enctype="multipart/form-data" action="tambahbarangServlet?idToko=<%=Integer.parseInt(request.getParameter("idToko"))%>" method="post">
             <div class="form-group">
            Nama Barang : <input type="text" name="namabarang">
             </div>
             <div class="form-group">
            Harga Barang : <input type="text" name="hargabarang">
             </div>
             <div class="form-group">
                 Pilih kategori :<br>
            <%
                SystemDA da = new SystemDA();
                ArrayList<Kategori> kategori= new ArrayList<Kategori>();
                kategori = da.getAllKategori();

                if(kategori!=null){
                    for(int i=0;i<kategori.size();i++){
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
            <button type="submit"> Tambah Barang! </button>
            <br>
        </form>
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
