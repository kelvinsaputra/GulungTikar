<%-- 
    Document   : nav
    Created on : Mar 4, 2018, 4:13:27 PM
    Author     : fsury
--%>

<%@page import="model.Session"%>
<%@page import="model.Pengguna"%>
<%@page import="model.Toko"%>
<%@page import="controller.*"%>
<%@page import="java.util.ArrayList"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <div class="mr-auto">
            <a class="navbar-brand" href="index.jsp">Gulung Tikar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <div class="col-7 mr-auto">
                <div class="col-12">
                    <form class="form-inline" action="search.jsp" method="GET">
                        <div class="form-group col-10">
                            <input type="text" name="nama" id="nama" class="form-control col-12"/>
                        </div>
                        <div class="form-group col-2">
                            <input type="submit" class="btn btn-primary" value="Search"/>
                        </div>
                    </form>
                </div>
            </div>

            <div>
                <ul class="navbar-nav ml-auto">
                    <%
                        String statusLogin = (String) request.getSession(false).getAttribute("statusLogin");
                        String username=null;
                        int idPengguna=-1;
                        if(statusLogin!=null){
                            if(statusLogin.equals("1")){ //kalo ada yg login
                                username = (String) request.getSession(false).getAttribute("username");
                                idPengguna = (Integer) request.getSession(false).getAttribute("idPengguna");
                            }
                        }
//                        
//                        if(username!=null && idPengguna!=-1){
//                            System.out.print("=========================================="+ username);
//                            System.out.print("=========================================="+ idPengguna);
//                       
//                        }
                        
                        if(username==null && idPengguna==-1){
                        %>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="register.jsp">Sign up</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="login.jsp">Log in</a>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="userprofile.jsp">My profile</a>
                        </li>
                        <%
                        
                      /* ArrayList<Toko> toko = new ArrayList<Toko>();
                        SystemDA da = new SystemDA();
                        toko = da.getAllToko();
                        boolean ketemu=false;

                        for(int i=0; i<toko.size();i++){
                            if(toko.get(i).getPengguna().getIdPengguna()==idPengguna){
                                ketemu = true; //cek semua toko ada yg dipunyain sama yg lagi login ga, kalo ada oke, kalo belom buttonnya buka Toko!
                            }
                        }
                        
                        
*/
                       Pengguna pengguna = new SystemDA().getUserById(idPengguna);
                       if(pengguna.getType().equals("Penjual")){
                    %>        
                        <li class="nav-item">
                            <a class="nav-link text-white" href="profiletoko.jsp">My Shop</a>
                        </li>  

                            <%}
                            else
                            {%>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="shoppingcart.jsp">Shopping Cart</a>
                        </li>  
                        <%
                            }%>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="logoutServlet">Logout</a>
                        </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
</nav>
