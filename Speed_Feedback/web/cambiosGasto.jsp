<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javascript/Validaciones.js" type="text/javascript"></script>
        <title>Cambio información de gastos</title>
    </head>
    <body>
    <center>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand">Proyecto</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="PaginadeBienvenida.jsp">Página de Bienvenida</a></li>

                    <li><a href="RegistroSesion.html">Registrate</a></li>
                    <li class="active"><a href="menuGastos.html">Gastos</a></li>
                </ul>
        </nav>
        <h1>Cambia información</h1>
        <hr>
        <br>
        <br>
        <form method="POST">
            <label for="nombreGasto">Nombre del gasto:</label><input type="text" id="nombreG" name="nombreG" onkeypress="return SoloLetras(event)" autocomplete="off"/>
            <label for="fechaGasto">Fecha del gasto:</label><select id="fecha2" name="Mes" onchange="cambia_colonia3();
                    date(dia, año, campo)" class="select">
                <option value="0" selected disabled> Mes </option>
                <option value="1"> Enero</option>
                <option value="2"> Febrero </option>
                <option value="3"> Marzo </option>
                <option value="4"> Abril </option>
                <option value="5"> Mayo </option>
                <option value="6"> Junio </option>
                <option value="7"> Julio </option>
                <option value="8"> Agosto </option>
                <option value="9"> Septiembre </option>
                <option value="10"> Octubre </option>
                <option value="11"> Noviembre </option>
                <option value="12"> Diciembre </option>
            </select>

            <select id="fecha" name="dia" class="select" onchange="date(dia, año, campo);">
                <option selected disabled > Día </option>
            </select>
            <input type="text" class="textbox" name="anio" id="año" onkeypress="return soloNumero(event);" onkeyup="
                    date(dia, año, campo)"  maxlength="4" placeholder="Año">

            <input type="text" hidden="hidden"  name="campo" id="campo"  required/> <br><br>

        </form>
    </center>
</body>
</html>

