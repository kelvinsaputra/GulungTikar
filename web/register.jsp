<%-- 
    Document   : register
    Created on : Mar 5, 2018, 10:42:18 PM
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

        <title>GulungTikar Register</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link type="text/css" href="css/shop-homepage.css" rel="stylesheet">
    </head>

    <body>

        <!-- Navigation -->
        <jsp:include page="nav.jsp"/>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-10 mx-auto" style="padding: 5%;">
                    <h1 class="h3 mb-3 font-weight-normal">Sign up now!</h1>
                    <h3 class="h5 mb-3 font-weight-normal">Fill in the form below to get instant access:</h3>
                    <form action="registerServlet" method="post">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" id="inputName" placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="address" class="form-control" id="inputAddress" placeholder="Address" required>
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email Address" required autofocus>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="norekening" class="form-control" id="inputPassword" placeholder="Account Number" required>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="type" id="type" value="Pembeli">
                            <label class="form-check-label" for="pembeli">
                                Pembeli
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="type" id="type" value="Penjual">
                            <label class="form-check-label" for="penjual">
                                Penjual
                            </label>
                        </div>
                        <br>
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Register</button>
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
