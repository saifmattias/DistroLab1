<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %> 
<%@page import="BO.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Välkommen till KM-Game</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="UI/style/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="http://localhost:8080/Lab1Distro/index.jsp">
                KM-Game
            </a>
            <a href="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=menu" class="navbar-right">Portal</a>

            <%
                if (session.getAttribute("userid") == null) {
            %>
            <a href="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=menu" class="navbar-right">Logga in</a>
            <%} else {%>
            <a href="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=logout" class="navbar-right">Logga ut</a>

            <%}%>
        </nav>

        <div class="row" style="margin:0px;">
            <div class="col-sm-12" style="padding:40px 40px 0 0; border:0px solid black">
                <a href="http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp" id="cart" class="navbar-right"><i class="fa fa-shopping-cart" style="font-size:30px;"></i> Cart</a>
            </div>
        </div>               

        <div class="container" style="margin-left: 0px; padding-left: 0px;">
            <div class="vertical-tabs">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#pag1" role="tab" aria-controls="home">PS4</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#pag2" role="tab" aria-controls="profile">XBOX</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#pag3" role="tab" aria-controls="messages">PC</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="pag1" role="tabpanel">
                        <div class="sv-tab-panel" style="border:0px solid #000; margin-left: 180px;">
                            <%
                                String group = "PS4";
                                ItemHandler items = new ItemHandler();
                                List<Item> table = items.getItemsWithGroup(group);
                                for (int i = 0; i < table.size(); i++) {
                            %>



                            <div id="col<%=i % 3 + 1%>">
                                <div class="col-md-4" style="margin: 0px;">
                                    <div class="card" style="width: 18rem; margin-left:30px; height: 290px;">
                                        <img src="UI/img.png" class="card-img-top" width="70" height="70" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title"><%=table.get(i).getname()%></h5>
                                            <h5 class="card-title">Quantity: <%=table.get(i).getQuantity()%></h5>
                                            <p class="card-text"><%=table.get(i).getdescription()%></p>
                                            <%
                                                if (table.get(i).getQuantity() == 0) {
                                            %>
                                            <h6>Out of stock</h6>
                                            <%} else {%>
                                            <a href="http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp?&action=buy&artNr=<%=table.get(i).getArtNr()%>&Name=<%=table.get(i).getname()%>&Description=<%=table.get(i).getdescription()%>&Category=<%=table.get(i).getCategory()%>&Price=<%=table.get(i).getprice()%>" class="btn btn-primary">Buy</a>

                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% }%>

                        </div>
                    </div>
                    <div class="tab-pane" id="pag2" role="tabpanel">
                        <div class="sv-tab-panel" style="border:0px solid #000; margin-left: 180px;">
                            <%
                                group = "XBOX";
                                items = new ItemHandler();
                                table = items.getItemsWithGroup(group);
                                for (int i = 0; i < table.size(); i++) {
                            %>



                            <div id="col<%=i % 3 + 1%>">
                                <div class="col-md-4" style="margin: 0px;">
                                    <div class="card" style="width: 18rem; margin-left:30px; height: 290px;">
                                        <img src="UI/img.png" class="card-img-top" width="70" height="70" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title"><%=table.get(i).getname()%></h5>
                                            <h5 class="card-title">Quantity: <%=table.get(i).getQuantity()%></h5>
                                            <p class="card-text"><%=table.get(i).getdescription()%></p>
                                            <%
                                                if (table.get(i).getQuantity() == 0) {
                                            %>
                                            <h6>Out of stock</h6>
                                            <%} else {%>
                                            <a href="http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp?&action=buy&artNr=<%=table.get(i).getArtNr()%>&Name=<%=table.get(i).getname()%>&Description=<%=table.get(i).getdescription()%>&Category=<%=table.get(i).getCategory()%>&Price=<%=table.get(i).getprice()%>" class="btn btn-primary">Buy</a>

                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% }%>

                        </div>
                    </div>
                    <div class="tab-pane" id="pag3" role="tabpanel">
                        <div class="sv-tab-panel" style="border:0px solid #000; margin-left: 180px;">
                            <%
                                group = "PC";
                                items = new ItemHandler();
                                table = items.getItemsWithGroup(group);
                                for (int i = 0; i < table.size(); i++) {
                            %>



                            <div id="col<%=i % 3 + 1%>">
                                <div class="col-md-4" style="margin: 0px;">
                                    <div class="card" style="width: 18rem; margin-left:30px; height: 290px;">
                                        <img src="UI/img.png" class="card-img-top" width="70" height="70" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title"><%=table.get(i).getname()%></h5>
                                            <h5 class="card-title">Quantity: <%=table.get(i).getQuantity()%></h5>
                                            <p class="card-text"><%=table.get(i).getdescription()%></p>
                                            <%
                                                if (table.get(i).getQuantity() == 0) {
                                            %>
                                            <h6>Out of stock</h6>
                                            <%} else {%>
                                            <a href="http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp?&action=buy&artNr=<%=table.get(i).getArtNr()%>&Name=<%=table.get(i).getname()%>&Description=<%=table.get(i).getdescription()%>&Category=<%=table.get(i).getCategory()%>&Price=<%=table.get(i).getprice()%>" class="btn btn-primary">Buy</a>

                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% }%>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
