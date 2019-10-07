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
            if (action == null) {
            } else {
                if (action.equalsIgnoreCase("logout")) {
                    session.removeAttribute("userid");
                    session.removeAttribute("userType");
                    response.sendRedirect("http://localhost:8080/Lab1Distro/");
                } else if (session.getAttribute("userid") != null && action.equals("order")) {
                    response.sendRedirect("http://localhost:8080/Lab1Distro/UI/order.jsp");
                } else if (session.getAttribute("userid") != null && action.equals("menu")) {
                    if (session.getAttribute("userType").equals("Customer")) {
                        response.sendRedirect("http://localhost:8080/Lab1Distro/UI/customerPanel.jsp");
                    } else if (session.getAttribute("userType").equals("Admin")) {
                        response.sendRedirect("http://localhost:8080/Lab1Distro/UI/adminPanel.jsp");
                    } else if (session.getAttribute("userType").equals("Personal")) {
                        response.sendRedirect("http://localhost:8080/Lab1Distro/UI/personalPanel.jsp");
                    }
                    
                } else {
                    Login loginID = login.validate(request.getParameter("username"), request.getParameter("password"));
                    
                    if (loginID != null) {
                        session.setAttribute("userid", loginID.getUID());
                        session.setAttribute("userType", loginID.getUsertype());
                        if (session.getAttribute("userid") != null && action.equals("order")) {                            
                            response.sendRedirect("http://localhost:8080/Lab1Distro/UI/order.jsp");
                        } else if (session.getAttribute("userid") != null && action.equals("menu")) {
                            if (session.getAttribute("userType").equals("Customer")) {
                                response.sendRedirect("http://localhost:8080/Lab1Distro/UI/customerPanel.jsp");
                            } else if (session.getAttribute("userType").equals("Admin")) {
                                response.sendRedirect("http://localhost:8080/Lab1Distro/UI/adminPanel.jsp");
                            } else if (session.getAttribute("userType").equals("Personal")) {
                                response.sendRedirect("http://localhost:8080/Lab1Distro/UI/personalPanel.jsp");
                            }
                            
                        }
                    }
        %>
        <div id="login">
            <h4 class="text-center pt-5">Du behöver logga in först!</h4>
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" method="post" action="http://localhost:8080/Lab1Distro/UI/login.jsp?&action=<%=action%>">
                                <h3 class="text-center text-info">Login</h3>
                                <div class="form-group">
                                    <label for="username" class="text-info">Username:</label><br>
                                    <input type="text" name="username" id="username" class="form-control" required="">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Password:</label><br>
                                    <input type="password" name="password" id="password" class="form-control" required="">
                                </div>
                                <div class="form-group">
                                    <br>
                                    <input type="submit" class="">Logga in</button>                                
                                </div>
                                <div id="register-link" class="text-right">
                                    <a href="http://localhost:8080/Lab1Distro/UI/register.jsp?&action=<%=request.getParameter("action")%>" class="text-info">Har du inte konto? Registrera här</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}
            }%>
    </body>
</html>
