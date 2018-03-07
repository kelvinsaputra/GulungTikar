<%-- 
    Document   : nav
    Created on : Mar 4, 2018, 4:13:27 PM
    Author     : fsury
--%>

<%@page import="model.Pengguna"%>
<%@page import="model.Session"%>
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
                    <form class="form-inline" action="#" method="GET">
                        <input type="text" class="input-group-text col-10"/>
                        <input type="submit" class="btn btn-primary col-2" value="Search"/>
                    </form>
                </div>
            </div>

            <div>
                <ul class="navbar-nav ml-auto">
                    <%
                        Session current = new Session();
                        System.out.print("=========================================="+ Session.getInstance());
                        System.out.print("=========================================="+ current.getPengguna());
                       
                        if(current.getPengguna()==null){
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
                    <li class="nav-item">
                        <a class="nav-link text-white" href="logoutServlet">Logout</a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
</nav>
