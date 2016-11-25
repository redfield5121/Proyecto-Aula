<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    BD.cMail objMail = new BD.cMail();
    extras.cDes objDes = new extras.cDes();
    String urlRegistroValido = "?idUsuario=" + objDes.Cifrado("idUsr");
    String contenido = "<h1>Gracias</h1> por registrate, haga click en el siguiente link para validar su correo: <br> <a href=\"http://localhost:8080/sistemaLogin/validaUsr" + urlRegistroValido + "\">aqui</a>para confirmar ";

    if (objMail.mandaMAil("speed.feedback.contacto@hotmail.com", "valida tu cta para ingresar", contenido)) {
        out.println("envio exitoso revisa el spam o b de en ");
    } else {
        out.println(objMail._error);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

