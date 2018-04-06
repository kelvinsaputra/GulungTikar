<%-- 
    Document   : userprofile
    Created on : Mar 5, 2018, 11:05:27 PM
    Author     : LENOVO
--%>

<%@page import="model.Session"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <style>

        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            background-color: #ddd;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            background-color: #ccc;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

    </style>


    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title><%=(String) request.getSession(false).getAttribute("username")%>'s Profile</title>

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
        <%
            System.out.print((String) request.getSession(false).getAttribute("username"));
//            SystemDA SDA = new SystemDA();
//            ArrayList<Pengguna> pengguna = SDA.getUserByID(Integer.parseInt(request.getParameter("id")));

        %>
        <!-- Page Content -->
        <div class="tab">
            <button id="defaultOpen" class="tablinks" onclick="openCity(event, 'editprofile')">Edit Profile</button>
            <button class="tablinks" onclick="openCity(event, 'manageshop')">Manage Shop</button>
            <button class="tablinks" onclick="openCity(event, '')">Transaction History</button>
        </div>
        <div id="London" class="tabcontent">
            <h3>London</h3>
            <p>London is the capital city of England.</p>
        </div>

        <div id="Paris" class="tabcontent">
            <h3>Paris</h3>
            <p>Paris is the capital of France.</p>
        </div>

        <div id="Tokyo" class="tabcontent">
            <h3>Tokyo</h3>
            <p>Tokyo is the capital of Japan.</p>
        </div>


        <div id="editprofile" class="tabcontent">
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
                        <div class="col-12">
                            <h2>Welcome <%=(String) request.getSession(false).getAttribute("username")%> </h2>
                            <%
                                SystemDA da = new SystemDA();
                                ArrayList<Pengguna> temppengguna = new ArrayList<Pengguna>();
                                temppengguna = da.getAllUser();
                                Pengguna temp = new Pengguna();
                                for (int i = 0; i < temppengguna.size(); i++) {
                                    if (temppengguna.get(i).getIdPengguna() == (Integer) request.getSession(false).getAttribute("idPengguna")) {
                                        temp = temppengguna.get(i);
                                    }
                                }


                            %>
                            Email : <%=temp.getEmail()%>
                            Rekening : <%=temp.getNoRekening()%>
                            Saldo : <%=temp.getSaldo()%>
                        </div>
                        <hr>
                        <div class="col-12">
                            <h2>Edit Your Profile</h2>
                            <form action="" method="post">
                                <div class="form-group">
                                    <input type="password" class="form-control" id="editPassword" placeholder="New Password">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="editPasswordRetype" placeholder="Retype New Password">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="editName" placeholder="New Display Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="editAddress" placeholder="New Address">
                                </div>
                                <button class="btn btn-danger">Cancel</button>
                                <button class="btn btn-success">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="manageshop" class="tabcontent">
            <div  class="container" style="padding-top: 5%">
                <div class="row">               
                    <%

                        if (temp.getType().equals("Penjual")) {
                            Toko toko = da.getToko2(temp);
                            if (toko == null) {
                    %>
                    <div class="col-md-12">
                        <h2>You don't have a shop yet! Make your first shop by entering its address</h2>
                        <form action="bukaToko" method="post" class="">
                            <center><div class="form-group">
                                    <input type="text" class="form-control col-4" name="alamat" placeholder="Shop Address">
                                </div>
                                <div class="form-group mx-auto">
                                    <button class="btn btn-primary col-4" type="submit"> Create Shop </button>
                                </div></center>
                        </form>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="col-12">
                        <hr>
                        <center><h2>Manage Shop</h2></center>
                            <jsp:include page="profiletoko.jsp"/>
                    </div>
                    <%
                        }
                    } else if (temp.getType().equals("Pembeli")) {

                        Wishlist wishlist = da.getWishlist(temp);
                        if (wishlist != null) {

                            int idWish = wishlist.getIdWishlist();
                            ArrayList<Wishlistentry> wlentry = new ArrayList<Wishlistentry>();
                            wlentry = da.getAllWishlistentry(idWish);
                            ArrayList<Barang> tempbarang = new ArrayList<Barang>();
                            tempbarang = da.getAllBarang();
                            for (int i = 0; i < wlentry.size(); i++) {

                                for (int j = 0; j < tempbarang.size(); j++) {
                                    if (wlentry.get(i).getBarang().getIdBarang() == tempbarang.get(j).getIdBarang()) {
                    %>
                    
                    <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="barang.jsp?idBarang=<%=tempbarang.get(j).getIdBarang()%>"><img class="card-img-top" src="res/<%= tempbarang.get(j).getIdBarang()%>.jpg" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="barang.jsp?idBarang=<%=tempbarang.get(j).getIdBarang()%>"><%= tempbarang.get(j).getNamaBarang()%></a>
                                    </h4>
                                    <h5>Rp. <%= tempbarang.get(j).getHargaBarang()%>,00</h5>
                                    <%
                                        Etalase etalase = da.getEtalaseByID(tempbarang.get(j).getIdBarang());
                                        Toko tokoo = etalase.getToko();
                                        Pengguna pengguna = tokoo.getPengguna();
                                    %>
                                    <p class="card-text"><%=pengguna.getNama()%>'s Shop</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>
                    <%
                                        }
                                    }
                                }
                            }
//                    <!--check wishlist size, keluarin button/tulisan u dont have any, your last shopping cart-->    

                        }
                    %>
                </div>
            </div>
        </div>

        <br>

        <jsp:include  page="footer.jsp"/>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script type="text/javascript">
                function openCity(evt, tabName) {
                    // Declare all variables
                    var i, tabcontent, tablinks;

                    // Get all elements with class="tabcontent" and hide them
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }

                    // Get all elements with class="tablinks" and remove the class "active"
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }

                    // Show the current tab, and add an "active" class to the button that opened the tab
                    document.getElementById(tabName).style.display = "block";
                    evt.currentTarget.className += " active";

                }
                document.getElementById("defaultOpen").click();
        </script>
    </body>
</html>