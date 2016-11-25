<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                background:url("Imagenes/imagen1.jpg")fixed;
            }

        </style>
    </head>
    <body>
        <h1>Cambios</h1>
        <%@page import="java.sql.*,java.io.*" %>
        <%
            HttpSession sesion = request.getSession();
            String correo = (String) sesion.getAttribute("idUsuario");
            out.println("<input type='text' name='Clave' readonly='readonly' value='" + correo + "'>");
        %>
    </body> 
</html>