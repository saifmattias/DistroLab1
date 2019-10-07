<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.ServletException" %> 
<%@page import="BO.*"%>
<%@ page import="java.io.IOException" %> 

<%
    String action = request.getParameter("action");
    String quantityUpdate = request.getParameter("Quantity");
    shoppingcartHandler handler = new shoppingcartHandler();
    if (action == null) {
    } else {
        if (action.equalsIgnoreCase("buy") && quantityUpdate == null) {
            boolean status = true;
            if (session.getAttribute("cart") == null) {
                status = false;
            }
            List<Item> cart = handler.doGet_Buy((List<Item>) session.getAttribute("cart"), new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(request.getParameter("Price")), 1), status);
            session.setAttribute("cart", cart);
            response.sendRedirect("http://localhost:8080/Lab1Distro/");
        } else if (action.equalsIgnoreCase("buy") && quantityUpdate != null) {
            List<Item> cart = handler.doGet_UpdateBuy((List<Item>) session.getAttribute("cart"), new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(request.getParameter("Price")), 1), quantityUpdate);
            session.setAttribute("cart", cart);
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp");
        } else if (action.equalsIgnoreCase("remove")) {
            List<Item> cart = handler.doGet_Remove((List<Item>) session.getAttribute("cart"), new Item(request.getParameter("artNr"), request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Category"), Float.parseFloat(request.getParameter("Price")), 1));
            session.setAttribute("cart", cart);
            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp");
        }
    }

%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart</title>
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </head>
</head>
<body>
    <div class="container">
        <div class="card shopping-cart">
            <div class="card-header bg-dark text-light">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                Shipping cart
                <a href="http://localhost:8080/Lab1Distro/" class="btn btn-outline-info btn-sm pull-right">Continiu shopping</a>
                <div class="clearfix"></div>
            </div>
            <div class="card-body">

                <%  
                    float total = 0;
                    List<Item> cart = (List<Item>) session.getAttribute("cart");
                    int size=0;
                    if(session.getAttribute("cart") != null)
                        size=cart.size();
                    for (int i = 0; i <size; i++) {
                        total += cart.get(i).getprice() * cart.get(i).getQuantity();
                %>

                <div class="row">
                    <div class="col-12 col-sm-12 col-md-2 text-center">
                        <img class="img-responsive" src="http://placehold.it/120x80" alt="prewiew" width="120" height="80">
                    </div>
                    <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                        <h4 class="product-name"><strong><%=cart.get(i).getname()%></strong></h4>
                        <h4>
                            <small>${item.description }</small>
                        </h4>
                    </div>
                    <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                        <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                            <h6><strong><%=cart.get(i).getprice()%><span class="text-muted">x</span></strong></h6>
                        </div>
                        <div class="col-4 col-sm-4 col-md-4">
                            <div class="quantity">
                                <form  action="http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp?&action=buy&artNr=<%=cart.get(i).getArtNr()%>&Name=<%=cart.get(i).getname()%>&Description=<%=cart.get(i).getdescription()%>&Category=<%=cart.get(i).getCategory()%>&Price=<%=cart.get(i).getprice()%>" method="POST">
                                    <input var="qty" name="Quantity" placeholder="Quantity" type="number" step="1" min="1" max="99"  value="<%=cart.get(i).getQuantity()%>" title="Qty" class="qty"
                                           size="4">
                                <input  type=submit value="Update"/>
                                </form>                                        
                            </div>
                        </div>
                        <div class="col-2 col-sm-2 col-md-2 text-right">
                            <a href="http://localhost:8080/Lab1Distro/UI/shoppingcart.jsp?action=remove&artNr=<%=cart.get(i).getArtNr()%>&Name=<%=cart.get(i).getname()%>&Description=<%=cart.get(i).getdescription()%>&Category=<%=cart.get(i).getCategory()%>&Price=<%=cart.get(i).getprice()%>">
                                <i class="fa fa-trash" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </div>                
                <hr>

                <% }%>


            </div>
            <div class="card-footer">

                <div class="pull-right" style="margin: 10px">
                    <a href="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=order" class="btn btn-success pull-right">Checkout</a>
                    <div class="pull-right" style="margin: 5px">
                        Total price: <b><%=total%></b>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
