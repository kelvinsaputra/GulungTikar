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
            System.out.println(request.getSession(false).getAttribute("type"));
//            SystemDA SDA = new SystemDA();
//            ArrayList<Pengguna> pengguna = SDA.getUserByID(Integer.parseInt(request.getParameter("id")));
        %>
        <!-- Page Content -->
        <div class="tab">
            <%if(!request.getSession(false).getAttribute("type").equals("Admin")){%>
            <button id="defaultOpen" class="tablinks" onclick="openTab(event, 'editprofile')">Edit Profile</button>
            <%
                if (request.getSession(false).getAttribute("type").equals("Pembeli")) {
            %>
                <button id="wishlist" class="tablinks" onclick="openTab(event, 'manageshop')">Wishlist</button>
                <a href="history.jsp"><button id="history" class="tablinks" onclick="openTab(event, 'history')">Transaction History</button></a>
            <%
                }
            }   
            %>
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
                            <table class="table">
                                <tr>
                                    <td>
                                        Email
                                    </td>
                                    <td>
                                        <%=temp.getEmail()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Rekening
                                    </td>
                                    <td>
                                        <%=temp.getNoRekening()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Saldo
                                    </td>
                                    <td>
                                        <%=temp.getSaldo()%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>
                        <div class="col-12">
                            <h2>Edit Your Profile</h2>
                            <form action="editProfileServlet" method="post">
                                
                                <div class="form-group">
                                    <input class="form-control" id="password" name="password" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" placeholder="Password" required>
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" id="password_two" name="password_two" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Verify Password" required>
                                </div>
                                
<!--                                <div class="form-group">
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
                                </div>-->

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
                <center><h1>Wishlist</h1></center><hr>
                <div class="row">               
                    <%if (temp.getType().equals("Pembeli")) {
                            Wishlist wishlist = da.getWishlist(temp.getIdPengguna());
                            ArrayList<Wishlistentry> wishlistE = da.getWishlistentryByID(wishlist.getIdWishlist());
                            if (wishlistE != null) {
                                if (wishlist != null && wishlistE.size() != 0) {
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
                                <form action="removeWishlistServlet" method="POST">
                                    <button class="btn btn-primary" style="margin-left: 220px" type="submit">Remove</button>
                                    <input type="hidden" name="idBarang" class="form-control" value="<%=tempbarang.get(j).getIdBarang()%>">
                                    <input type="hidden" name="idPengguna" class="form-control" value="<%=temp.getIdPengguna()%>">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                                }
                            }
                        }
                    }
                } else {
                %> <center><img class="" src="res/wishlist-empty.jpg" alt="empty cart"></center> 
                    <%
                            }
                            //                    <!--check wishlist size, keluarin button/tulisan u dont have any, your last shopping cart-->    
                        }
                    %>

            </div>
        </div>

        <br>

        <jsp:include  page="footer.jsp"/>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script type="text/javascript">
                function openTab(evt, tabName) {
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