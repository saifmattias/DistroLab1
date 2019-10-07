<%@page import="BO.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String action = request.getParameter("action");
    String type = request.getParameter("type");
    ItemHandler handler = new ItemHandler();
    OrderHandler orders = new OrderHandler();
    if (action == null) {
    } else {
        if (action.equalsIgnoreCase("update") && type.equalsIgnoreCase("item")) {
            handler.updateItem("Quantity", new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(request.getParameter("Price")), Integer.parseInt(request.getParameter("newQuantity"))));
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/personalPanel.jsp");
        } else if (action.equalsIgnoreCase("update") && type.equalsIgnoreCase("order")) {
            orders.updateOrder(request.getParameter("status"), Integer.parseInt(request.getParameter("OID")));
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/personalPanel.jsp");
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
        <%  

            if (session.getAttribute("userid") != null && session.getAttribute("userType").equals("Customer")) {
        %>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="http://localhost:8080/Lab1Distro/index.jsp">
                KM-Game
            </a>
            <a href="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=logout" class="navbar-right">Logga ut</a>
        </nav>

        <table class="table table-striped" style="width: 800px; margin: 10px 250px;">
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

                </tr>
                </tr>
            </thead>
            <tbody>

                <%  
                    List<Order> allOrders = orders.getAllOrderByID((Integer) session.getAttribute("userid"));
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

                </tr>

                <% }%>
            </tbody>
        </table>

        <% }%>                   

    </div>
</div>
<%} else {%>
        <h1>Du är inte behörig för denna sida!!!</h1>  
        <%}%>
</body>
</html>
