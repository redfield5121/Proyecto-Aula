<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*,java.security.*,java.math.*,javax.servlet.http.*"%>
        <%
            if (request.getParameter("Alta") != null) {
                String nombre = request.getParameter("Nombre");
                String Ap_Paterno = request.getParameter("ApellidoPaterno");
                String Ap_Materno = request.getParameter("ApellidoMaterno");
                String Celular = request.getParameter("Celular");
                String Correo = request.getParameter("Correo");
                String Contrasena = request.getParameter("Contrasena");
                BD.cDatos objBASE = new BD.cDatos();
                String mensaj = "";

                int existe = 0;
                try {
                    objBASE.conectar();
                    ResultSet rsChecaMail = objBASE.consulta("select fc_validarcorreo('" + Correo + "') as valido;");

                    if (rsChecaMail.next()) {
                        existe = rsChecaMail.getInt("valido");
                    }

                    if (existe == 0) {

                        BD.cMail objMail = new BD.cMail();

                        objBASE.insertar("call sp_altas('" + 0 + "','" + nombre + "','" + Ap_Paterno + "','" + Ap_Materno + "','" + Correo + "','" + Celular + "','" + Contrasena + "')");

                        String urlRegistroValido = "?correo=" + Correo;
                        String contenido = "<h1>gracias</h1>para registrarte a Speed and Feedback da click  <a href=\"http://localhost:8080/Speed_Feedback/recibirValido.jsp" + urlRegistroValido + "\"> aqui</a> para confirmar ";

                        if (objMail.mandaMAil(Correo, "valida tu cuenta para ingresar", contenido)) {
                            out.println("envio exitoso ");
                        } else {
                            out.println(objMail._error);
                        }

                        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001; URL=http://localhost:8080/Speed_Feedback/InicioSesion.jsp'/>");
                    } else if (existe >= 1) {
                        out.print("<script>alert('El correo ya existe')</script>");
                        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001; URL=http://localhost:8080/Speed_Feedback/RegistroSesion.html'/>");
                    }
                } catch (SQLException error) {
                    out.println(error.toString());

                }

            } else if (request.getParameter("Entrar") != null) {
                HttpSession sesion = request.getSession();
                String Correo = request.getParameter("Correo");
                sesion.setAttribute("correo", Correo);
                String Contrasena = request.getParameter("contra");
                BD.cDatos objBASE = new BD.cDatos();
                MessageDigest m = MessageDigest.getInstance("MD5");
                m.update(Contrasena.getBytes(), 0, Contrasena.length());
                String md5 = new BigInteger(1, m.digest()).toString(16);
                try {
                    objBASE.conectar();
                    ResultSet rs = objBASE.consulta("select*from usuarios where correo='" + Correo + "'" + " and contrasena='" + md5 + "'and estado=1");

                    if (rs.next()) {
                        String nombre = rs.getString("nombre");
                        sesion.setAttribute("idUsuario", rs.getString("idusuarios"));
                        sesion.setAttribute("nombreusr", nombre);
                        out.print("<script>alert('Bienvenido " + nombre + "')</script>");
                        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001; URL=http://localhost:8080/Speed_Feedback/PaginadeBienvenida.jsp'/>");
                    } else {
                        out.print("<script>alert('Datos incorrectos')</script>");
                        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001; URL=http://localhost:8080/Speed_Feedback/InicioSesion.jsp'/>");
                    }

                } catch (SQLException e) {
                    out.println(e.toString());
                }
            } else if (request.getParameter("Salir") != null) {
                HttpSession sesion = request.getSession();
                sesion.invalidate();
                out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/Speed_Feedback/index.html'/>");
            }
        %>
    </body>
</html>
