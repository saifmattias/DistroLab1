<%@page import="BO.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String action = request.getParameter("action");
    String type = request.getParameter("type");
    String priceUpdate = request.getParameter("price");
    ItemHandler handler = new ItemHandler();
    OrderHandler orders = new OrderHandler();
    if (action == null) {
    } else {
        if (action.equalsIgnoreCase("update") && type.equalsIgnoreCase("item")) {
            handler.updateItem("price", new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(priceUpdate), Integer.parseInt(request.getParameter("Quantity"))));
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/adminPanel.jsp");
        } else if (action.equalsIgnoreCase("remove") && type.equalsIgnoreCase("item")) {
            handler.removeItem(new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(request.getParameter("Price")), Integer.parseInt(request.getParameter("Quantity"))));
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/adminPanel.jsp");
        } else if (action.equalsIgnoreCase("insert") && type.equalsIgnoreCase("item")) {
            handler.insertItem(new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(request.getParameter("Price")), Integer.parseInt(request.getParameter("Quantity"))));
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/adminPanel.jsp");
        } else if (action.equalsIgnoreCase("remove") && type.equalsIgnoreCase("order")) {
            orders.removeOrder(Integer.parseInt(request.getParameter("OID")));
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/adminPanel.jsp");
        }
    }

%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Välkommen till KM-Game</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </head>
    <body>
        <%                    if (session.getAttribute("userid") != null && session.getAttribute("userType").equals("Admin")) {
        %>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="http://localhost:8080/Lab1Distro/index.jsp">
                KM-Game
            </a>
            <a href="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=logout" class="navbar-right">Logga ut</a>
        </nav>
        <div class="container" style="margin-left: 0px; padding-left: 0px;">
            <div class="vertical-tabs">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#pag1" role="tab" aria-controls="home">Produkt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#pag2" role="tab" aria-controls="profile">Order</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="pag1" role="tabpanel">
                        <div class="sv-tab-panel">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                Lägg till Produkt
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Lägg till produkt</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form" role="form" action="http://localhost:8080/Lab1Distro/UI/adminPanel.jsp?&action=insert&type=item" method="post" >
                                                <div class="form-group">
                                                    <input name="artNr" placeholder="Artikelnummer"  class="form-control form-control-sm" type="text" required="">
                                                </div>
                                                <div class="form-group">
                                                    <input name="Name" placeholder="Produktnamn"  class="form-control form-control-sm" type="text" required="">
                                                </div>
                                                <div class="form-group">
                                                    <textarea name="Description" class="form-control form-control-sm" id="exampleFormControlTextarea1" rows="3" required=""></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <input name="Price" placeholder="Price"  class="form-control form-control-sm" type="text" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlSelect1">Kategori</label>
                                                    <select name="Category" class="form-control" id="exampleFormControlSelect1">
                                                        <option>PS4</option>
                                                        <option>XBOX</option>
                                                        <option>PC</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <input name="Quantity" placeholder="Quantity"  class="form-control form-control-sm" type="text" required="">
                                                </div>
                                                <div class="form-group">
                                                    <input type="submit" value="submit" class="">
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <table class="table table-striped" style="width: 700px;">
                                <thead>
                                    <tr>
                                        <th scope="col">ArtNr</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                        ItemHandler item = new ItemHandler();
                                        List<Item> allItems = item.getItems();
                                        if (allItems.size() != 0) {
                                            for (int i = 0; i < allItems.size(); i++) {
                                    %>

                                    <tr>
                                        <td><%=allItems.get(i).getArtNr()%></td>
                                        <td><%=allItems.get(i).getname()%></td>
                                        <td><%=allItems.get(i).getQuantity()%></td>
                                        <td> <form  action="http://localhost:8080/Lab1Distro/UI/adminPanel.jsp?&action=update&type=item&artNr=<%=allItems.get(i).getArtNr()%>&Name=<%=allItems.get(i).getname()%>&Description=<%=allItems.get(i).getdescription()%>&Category=<%=allItems.get(i).getCategory()%>&Price=<%=allItems.get(i).getprice()%>&Quantity=<%=allItems.get(i).getQuantity()%>" method="POST">

                                                <input var="price" name="price" placeholder="price" 
                                                       type="number" step="0.01" min="0" value="<%=allItems.get(i).getprice()%>" title="price" class="price"
                                                       >                                            
                                            <input type=submit value="Update"/></td>

                                        </form>                                        
                                        <td><a href="http://localhost:8080/Lab1Distro/UI/adminPanel.jsp?action=remove&type=item&artNr=<%=allItems.get(i).getArtNr()%>&Name=<%=allItems.get(i).getname()%>&Description=<%=allItems.get(i).getdescription()%>&Category=<%=allItems.get(i).getCategory()%>&Price=<%=allItems.get(i).getprice()%>&Quantity=<%=allItems.get(i).getQuantity()%>">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                            </a></td>
                                    </tr>

                                    <% }%>
                                </tbody>
                            </table>

                            <% }%>                   


                        </div>
                    </div>
                    <div class="tab-pane" id="pag2" role="tabpanel">
                        <div class="sv-tab-panel">
                            <table class="table table-striped" style="width: 800px;">
                                <thead>
                                    <tr>
                                        <th scope="col">OrderId</th>
                                        <th scope="col">Firstname</th>
                                        <th scope="col">Lastname</th>
                                        <th scope="col">Shippingaddress</th>
                                        <th scope="col">City</th>
                                        <th scope="col">Zip</th>
                                        <th scope="col">Totalprice</th>
                                        <th scope="col">Orderdate</th>
                                        <th scope="col">Orderstatus</th>
                                        <th scope="col">Makulera</th>

                                    </tr>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        List<Order> allOrders = orders.getAllOrder();
                                        if (allOrders.size() != 0) {
                                            for (int i = 0; i < allOrders.size(); i++) {
                                    %>

                                    <tr>
                                        <td><%=allOrders.get(i).getOID()%></td>
                                        <td><%=allOrders.get(i).getFirstname()%></td>
                                        <td><%=allOrders.get(i).getLastname()%></td>
                                        <td><%=allOrders.get(i).getShippingAddress()%></td>
                                        <td><%=allOrders.get(i).getCity()%></td>
                                        <td><%=allOrders.get(i).getZip()%></td>
                                        <td><%=allOrders.get(i).getTotalPrice()%></td>
                                        <td><%=allOrders.get(i).getOrderDate()%></td>
                                        <td><%=allOrders.get(i).getStatus()%></td>                                        
                                        <%
                                            if (allOrders.get(i).getStatus().equals("Waiting")) {
                                        %>
                                        <td><a href="http://localhost:8080/Lab1Distro/UI/adminPanel.jsp?action=remove&type=order&OID=<%=allOrders.get(i).getOID()%>">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                            </a></td> <%}%>
                                    </tr>

                                    <% }%>
                                </tbody>
                            </table>

                            <% }%>                   

                        </div>
                    </div>


                </div>
            </div>
        </div>
        <%} else {%>
        <h1>Du är inte behörig för denna sida!!!</h1>  
        <%}%>
    </body>
</html>
