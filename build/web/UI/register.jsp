<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.*"%>
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
        <%
            LoginHandler login = new LoginHandler();
            String action = request.getParameter("action");
            if (session.getAttribute("userid") != null && action.equals("order")) {
                response.sendRedirect("http://localhost:8080/Lab1Distro/UI/order.jsp");
            } else if (session.getAttribute("userid") != null && action.equals("menu")) {
                response.sendRedirect("http://localhost:8080/Lab1Distro/UI/customerPanel.jsp");
            } else {
                login.createUser(new Login(request.getParameter("username"), request.getParameter("password")), new Customer(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("address"), request.getParameter("city"), request.getParameter("zip")));
                Login loginID = login.validate(request.getParameter("username"), request.getParameter("password"));

                if (loginID != null) {
                    session.setAttribute("userid", loginID.getUID());
                    session.setAttribute("userType", loginID.getUsertype());
                    if (session.getAttribute("userid") != null && action.equals("order")) {
                        response.sendRedirect("http://localhost:8080/Lab1Distro/UI/order.jsp");
                    } else if (session.getAttribute("userid") != null && action.equals("menu")) {
                        response.sendRedirect("http://localhost:8080/Lab1Distro/UI/customerPanel.jsp");
                    }

                }
        %>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <header class="card-header">
                            <h4 class="card-title mt-2">Sign up</h4>
                        </header>
                        <article class="card-body">
                            <form method="post" action="http://localhost:8080/Lab1Distro/UI/register.jsp?&action=<%=action%>">
                                <div class="form-row">
                                    <div class="col form-group">
                                        <label>Username </label>   
                                        <input type="text" name="username" class="form-control" placeholder="" required="">
                                    </div>
                                    <div class="col form-group">
                                        <label>Choose password</label>
                                        <input type="password" name="password" class="form-control" placeholder=" " required="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col form-group">
                                        <label>First name </label>   
                                        <input type="text" name="firstname" class="form-control" placeholder="" required="">
                                    </div>
                                    <div class="col form-group">
                                        <label>Last name</label>
                                        <input type="text" name="lastname" class="form-control" placeholder=" " required="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col form-group">
                                        <label>Address </label>   
                                        <input type="text" name="address" class="form-control" placeholder="" required="">
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>City</label>
                                        <input type="text" name="city" class="form-control" required="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Zip</label>
                                        <input type="text" name="zip" class="form-control" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                                </div>     
                            </form>
                        </article> 
                    </div> 
                </div> 

            </div>
        </div> 
        <%}%>

    </body>
</html>
