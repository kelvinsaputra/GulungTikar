<%-- 
    Document   : userprofile
    Created on : Mar 5, 2018, 11:05:27 PM
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
        <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="js/bootstrap.min.js"></script>
        
        <!-- Custom styles for this template -->
        <link type="text/css" href="css/shop-homepage.css" rel="stylesheet">
    </head>

    <body>

        <!-- Navigation -->
        <jsp:include page="nav.jsp"/>

        <!-- Page Content -->
        <div class="container" style="padding-top: 5%">
            <div class="row">
                <div class="col-md-4">
                    <form action="" method="post" enctype="multipart/form-data">
                    <img alt="User picture" src="css/Bikesgray.jpg" class="img-fluid rounded"/>    
                        <div class="form-group">
                            <input type="file" name="file" id="file" required>
                        </div>
                        <button class="btn btn-primary" id="upload-button" type="submit">Upload image</button>
                    </form>
                </div>
                <div class="col-6 mx-auto">
                    <form action="" method="post">
                        <fieldset disabled>
                            <div class="form-group">
                                <label for="editEmail">Email</label>
                                <input type="email" class="form-control" id="editEmail" placeholder="name@example.com">
                            </div>
                        </fieldset>
                        <div class="form-group">
                                <label for="editPassword">Password</label>
                                <input type="password" class="form-control" id="editPassword" placeholder="fill to change">
                            </div>
                        <div class="form-group">
                            <label for="editName">Name</label>
                            <input type="text" class="form-control" id="editName" placeholder="Bakphia Pathok">
                        </div>
                        <div class="form-group">
                            <label for="editAddress">Address</label>
                            <input type="text" class="form-control" id="editAddress" placeholder="Dipati ukur 80-84">
                        </div>
                        <fieldset disabled>
                            <div class="form-group">
                                <label for="editName">No Rekening</label>
                                <input type="text" class="form-control" id="inputName" placeholder="0123456789">
                            </div>
                            <div class="form-group">
                                <label for="editName">Saldo</label>
                                <input type="text" class="form-control" id="inputName" placeholder="0">
                            </div>
                        </fieldset>
                            <button class="btn btn-danger">Cancel</button>
                            <button class="btn btn-success">Save</button>
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