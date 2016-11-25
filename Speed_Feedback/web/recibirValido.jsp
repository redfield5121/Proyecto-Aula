<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String regreso = "";
    String recibido = "";
    try {
        recibido = request.getParameter("correo");//este parametro sera recibido por medio la url

        BD.cDatos ejecuta = new BD.cDatos();

        ejecuta.conectar();
        ResultSet valida = ejecuta.consulta("call cambiaEstado('" + recibido + "');");

    } catch (Exception e) {
        regreso = "Se ha generado un error. Intentalo mas tarde por favor";
    }
    out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001; URL=http://localhost:8080/Speed_Feedback/InicioSesion.jsp'/>");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

