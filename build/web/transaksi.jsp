<%-- 
    Document   : transaksi
    Created on : Apr 19, 2018, 11:04:21 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>GulungTikar Checkout Order</title>

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
            String statusLogin = (String) request.getSession(false).getAttribute("statusLogin");
            String username = null;
            int idPengguna = -1;
            if (statusLogin != null) {
                if (statusLogin.equals("1")) { //kalo ada yg login
                    username = (String) request.getSession(false).getAttribute("username");
                    idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
                }
            }
            
            Integer idSc = Integer.parseInt(request.getParameter("idSc"));
        %>
        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-10 mx-auto" style="padding: 12%;">
                    <h1 class="h3 mb-3 font-weight-normal">Thank you for your order!</h1>
                    <h1 class="h6 mb-3 font-weight-normal">Please fill in some of the following field</h1>
                    <form action="TransaksiServlet" method="post">
                        <div class="form-group">
                            <input type="hidden" name="idPengguna" class="form-control" value="<%= idPengguna%>">
                            <input type="hidden" name="idSc" class="form-control" value="<%= idSc%>">
                        </div>
                        <div class="form-group">
                            <input type="text" name="alamat" class="form-control" id="alamat" placeholder="Your Address" required autofocus>
                        </div>
                        <div class="form-group">
                            <input type="text" name="catatan" class="form-control" id="catatan" placeholder="Notes" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <br>

        <jsp:include  page="footer.jsp"/>
        
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
