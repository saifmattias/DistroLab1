<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.*"%>
<%
    boolean statusFromInput = false;
    Date date = new Date();
    String action = request.getParameter("action");
    float total = 0;
    OrderHandler order = new OrderHandler();
    if (action == null) {
    } else {
        if (action.equalsIgnoreCase("order")) {
            boolean status = true;
            if (session.getAttribute("cart") == null) {
                status = false;
            }
            if (status == false) {
                response.sendRedirect("http://localhost:8080/Lab1Distro/");
            }
            statusFromInput = order.orderInsert((List<Item>) session.getAttribute("cart"), new Order(null, request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("address"), request.getParameter("city"), request.getParameter("zip"), date.toString(), Float.parseFloat((String) session.getAttribute("TotalPrice")), null, (Integer) session.getAttribute("userid")));
            System.out.println("statusfominput ger " + statusFromInput);
            if (statusFromInput == true) {
                session.removeAttribute("cart");
                response.sendRedirect("http://localhost:8080/Lab1Distro/UI/afterOrder.jsp");
            }
        }
    }

%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="style/style2.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </head>
    <body>
        <%            CustomerHandler customer = new CustomerHandler();
            Customer custom = null;
            if (session.getAttribute("userid") != null && session.getAttribute("userType").equals("Customer")) {
                custom = customer.searchCustomer(String.valueOf(session.getAttribute("userid")));
        %>
        <div class="row  justify-content-center">
            <div class="col-md-4" style="margin: 40px 5px;">
                <div class="card" style="width: 18rem; margin-left:30px;">
                    <div class="card-body">
                        <h5 class="card-title">Leveransadress</h5>
                        <form method="post" action="http://localhost:8080/Lab1Distro/UI/order.jsp?&action=order">

                            <div class="form-row">
                                <div class="col form-group">
                                    <label>First name </label>   
                                    <input type="text" name="firstname" class="form-control" placeholder="" value="<%=custom.getName()%>" required="">
                                </div>
                                <div class="col form-group">
                                    <label>Last name</label>
                                    <input type="text" name="lastname" class="form-control" value="<%=custom.getLastname()%>" placeholder=" " required="">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col form-group">
                                    <label>Address </label>   
                                    <input type="text" name="address" value="<%=custom.getAddress()%>" class="form-control" placeholder="" required="">
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>City</label>
                                    <input type="text" name="city" value="<%=custom.getCity()%>" class="form-control" required="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Zip</label>
                                    <input type="text" name="zip" value="<%=custom.getZip()%>" class="form-control" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <button href="" type="submit" class="btn btn-primary btn-block">Order now</button>
                            </div>     
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="margin: 40px 0px;">
                <div class="card" style="width: 18rem; height: auto; margin-left:80px;">
                    <div class="card-body">
                        <h5 class="card-title">Produkter</h5>

                        <%
                            List<Item> cart = (List<Item>) session.getAttribute("cart");
                            int size = 0;
                            if (session.getAttribute("cart") != null) {
                                size = cart.size();
                            }
                            for (int i = 0; i < size; i++) {
                                total += cart.get(i).getprice() * cart.get(i).getQuantity();
                        %>
                        <p><a href="#"><%=cart.get(i).getname()%></a> <span class="price"><%=cart.get(i).getprice()%></span></p>
                            <%}%>
                            <%
                                session.setAttribute("TotalPrice", String.valueOf(total));

                            %>

                        <hr>
                        <p>Total <span class="price" style="color:black"><b><%=total%></b></span></p>
                    </div>
                </div>
            </div>
        </div>
        <%} else {%>
        <h1>Du är inte behörig för denna sida!!!</h1>  
        <%}%>
    </body>
</html>
