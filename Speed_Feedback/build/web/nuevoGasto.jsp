<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo gasto</title>
        <script src="javascript/Validaciones.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                background:url("Imagenes/imagen1.jpg")fixed;
            }
            p{color:floralwhite}
        </style>

    </head>
    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand">Proyecto</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="PaginadeBienvenida.jsp">Página de Bienvenida</a></li>
                    <li class="active"><a href="menuGastos.html">Gastos</a></li>
                    <li><a href=carros.html>Autos</a></li>
                </ul>
        </nav>
        <div style="height: 50px"></div>
        <div class="container" style="position: fixed">
            <div class="col-md-offset-5 col-md-3">
                <div class="loginGastos">

                    <h1 style="color: white">Nuevo gasto</h1>
                    <p>Registra el gasto introduciendo los datos que se te piden</p>
                    <hr>


                    <form method="POST" name="f1" action="nuevoGasto.jsp">
                        <p>  Nombre del gasto: </p><input onkeypress="return SoloLetras(event)"  class="form-control input-sm chat-input" type="text" id="nombreG" autocomplete="off" name="nombreG" placeholder="Nombre del gasto"   required/> <br>


                        <p>Concepto del gasto:</p> <input type="text" id="servicio"  name="servicio" class="form-control input-sm chat-input" autocomplete="off" placeholder="Servicio" required>

                        <p>Prestador de servicios:</p> <input type="text" placeholder="Prestador"  name="pestador" class="form-control input-sm chat-input" autocomplete="off" id="prestador"  /><br>



                        <p>Cantidad invertida:</p> <input type="text" name="cantidadInv" class="form-control input-sm chat-input" autocomplete="off" onkeypress="return SoloNumeros(event)" id="cantidadInv"  required /> 

                        <p>Fecha del gasto:</p>
                        <select id="fecha2" name="Mes" onchange="cambia_colonia3();
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
                        <input type="text" name="anio" class="form-control input-sm chat-input" id="año" onkeypress="return soloNumero(event);" onkeyup="
                                date(dia, año, campo)"  maxlength="4" placeholder="Año">

                        <input type="text" hidden="hidden" name="campo" id="campo"  required> 

                        <input type="submit" value="Ingresar gasto"  class="btn btn-success" id="Ingresargasto" onclick="validaGasto()"/>
                        <input type="reset" value="Reiniciar" class="btn btn-success" /> 


                        <input type="button" value="Atrás" name="Atras" class="btn btn-success" onclick="location.href = 'menuGastos.html'"/>
                    </form>
                </div>
            </div>
        </div>

        <%

            try {
                String nombreG = request.getParameter("nombreG");
                String servicio = request.getParameter("servicio");
                String prestador = request.getParameter("pestador");
                String fechaG = request.getParameter("campo");
                String cantidad = request.getParameter("cantidadInv");
                float gasto = Integer.parseInt(cantidad);

                //VARIABLE DE EXISTENCIA
                out.print("<script>alert('" + " El nombre de tu gasto: " + nombreG + " El servicio es: " + servicio + " El prestador de servicios es: " + prestador + " FECHADO: " + fechaG + " $ " + gasto + "')</SCRIPT>");
                //java.sql.Date sqlDate = new java.sql.Date(dt.getTime()); 
                BD.cDatos objBD = new BD.cDatos();
                objBD.conectar();
                objBD.insertar("call spInsertaGasto('" + nombreG + "','" + servicio + "', '" + prestador + "','" + fechaG + "','" + gasto + "')");

            } catch (Exception x) {
                System.out.println("tu error es: " + x);
            }
        %>



    </body>
</html>
