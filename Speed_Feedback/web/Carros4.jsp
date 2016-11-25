<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.Date;"%>
<%@page import = "java.sql.ResultSet;"%>

<html>
    <head>
        <meta charset=UTF-8">
        <script type="text/javascript" src="js/Validaciones.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                background:url("Imagenes/imagen1.jpg")fixed;
            }
            p{color:floralwhite}
        </style>
        <title>JSP Page</title>
        <%
            BD.cDatos objBD = new BD.cDatos();
            objBD.conectar();
            String Placas = request.getParameter("Placas") == null ? "" : request.getParameter("Placas");

            String valor = request.getParameter("valor") == null ? "" : request.getParameter("valor");

            if (!valor.equals("")) {

                ResultSet SteMen2 = objBD.borrar("call BajaCarro('" + valor + "')");

                out.print("<script>alert('Eliminación Exitosa')</SCRIPT>");

            }


        %>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand">Proyecto</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="PaginadeBienvenida.jsp">Página de Bienvenida</a></li>

                    <li><a href="menuGastos.html">Gastos</a></li>
                    <li><a href="carros.html" class="active">Autos</a></li>

                </ul>
        </nav>
        <div style="height: 50px"></div>
        <div class="container" style="position: fixed">
            <div class="col-md-offset-5 col-md-3">
                <div class="loginCarros">
                    <h1>Eliminar auto</h1>

                    <form action="Carros4.jsp" method="post" >

                        <p><label>Placas:</label></p>
                        <input name="Placas" type="text" id="Placas" value ="<%=Placas%>" class="form-control input-sm chat-input" placeholder="Ingresa la placa" maxlength="6" required></p>
                        <%

                            ResultSet SteMen = objBD.consulta("call ConsultaCarro('" + Placas + "')");
                            while (SteMen.next()) {
                                String NumPolSeg = SteMen.getString("no_de_poliza");
                                String Marca = SteMen.getString("marca");
                                String fechaV = SteMen.getString("fechaV");
                                String ModeloAnio = SteMen.getString("modelo");
                                String NumTarCir = SteMen.getString("no_de_tarjeta");
                                String placasX = SteMen.getString("placas");


                        %>
                        <p><label >Marca: <%=Marca%></label> </p>

                        <p><label >Modelo-Año: <%=ModeloAnio%></label></p>

                        <p><label>Número de póliza de seguro: <%=NumPolSeg%></label></p>

                        <p><label>Número de tarjeta de circulación: <%=NumTarCir%></label></p>

                        <p><label>Fecha de verificación: <%=fechaV%></label></p>


                    </form>
                    <form action="Carros4.jsp" method="POST">

                        <p>
                            <input type="hidden" id="valor" name="valor" value="<%=placasX%>"/> 
                            <input type="submit" id="Eliminar" name="Eliminar" value="Eliminar" onclick="return confirm('¿esta seguro placas: <%=placasX%>?')" class="btn btn-success" />
                            <input class="btn btn-success" value="Atras" type="button" id="atras" name="atras" onclick="location.href = 'carros.html'" />
                        </p>
                        <%
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>