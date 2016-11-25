<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.Date;"%>

<html>
    <head>
        <meta charset="UTF-8"/>
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
            String Modelo = request.getParameter("Modelo") == null ? "" : request.getParameter("Modelo");
            String Placas = request.getParameter("Placas") == null ? "" : request.getParameter("Placas");
            String NumTarCir = request.getParameter("Tarjeta") == null ? "" : request.getParameter("Tarjeta");
            int Anio = request.getParameter("Anio") == null ? 0 : Integer.parseInt(request.getParameter("Anio"));
            int NumPolSeg = request.getParameter("Poliza") == null ? 0 : Integer.parseInt(request.getParameter("Poliza"));
            String Marca = request.getParameter("Marca") == null ? "" : request.getParameter("Marca");
            String fechaV = request.getParameter("campo") == null ? "" : request.getParameter("campo");

            try {
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

                    <li ><a href="menuGastos.html">Gastos</a></li>
                    <li><a href="carros.html" class="active">Autos</a></li>
                </ul>
        </nav>
        <div style="height: 50px"></div>
        <div class="container" style="position: fixed">
            <div class="col-md-offset-5 col-md-3">
                <div class="loginCarros">
                    <h1 >Registrar autos</h1>

                    <form action="Carros1.jsp" method="post" name="f1">
                        <p><label for="Marca">Marca:</label> </p>
                        <select id="Marca" name="Marca">
                            <option value="0" selected="selected">- Selecciona -</option>
                            <option value="Nissan">Nissan</option>
                            <option value="Chevrolet">Chevrolet</option>
                            <option value="Volkswagen">Volkswagen</option>
                            <option value="Honda">Honda</option>
                            <option value="Toyota">Toyota</option>
                            <option value="Mazda">Mazda</option>
                            <option value="Ford">Ford</option>
                            <option value="General Motors">General Motors</option>
                            <option value="Audi">Audi</option>
                            <option value="Suzuki">Suzuki</option>
                            <option value="FCA México">FCA México</option>
                            <option value="KIA">KIA</option>
                            <option value="Hyundai">Hyundai</option>
                            <option value="Renault ">Renault </option>
                            <option value="SEAT">SEAT</option>
                            <option value="BMW">BMW</option>
                            <option value="Mercedes-Benz">Mercedes-Benz</option>
                            <option value="Peugeot">Peugeot</option>
                            <option value="MINI">MINI</option>
                            <option value="Lincoln">Lincoln</option>
                            <option value="Infiniti">Infiniti</option>
                            <option value="Acura">Acura</option>
                            <option value="Volvo">Volvo</option>
                            <option value="Porsche">Porsche</option>
                            <option value="Subaru">Subaru</option>
                            <option value="Isuzu">Isuzu</option>
                            <option value="Land Rover">Land Rover</option>
                            <option value="Smart">Smart</option>
                            <option value="Jaguar">Jaguar</option>
                            <option value="Otro">Otro</option>
                        </select>

                        <p><label >Modelo   -  Año:</label></p>
                        <input name="Modelo" type="text" id="Modelo" class="form-control input-sm chat-input" placeholder="Ingresa el modelo" maxlength="15" required> - 
                        <input name="Anio" type="text" id="Anio" class="form-control input-sm chat-input" placeholder="Ingresa el año" onkeypress="return SoloNumeros(event)" maxlength="4" required></p>


                        <p><label>Placas:</label></p>
                        <input name="Placas" type="text" id="Placas" class="form-control input-sm chat-input" value ="<%=Placas%>" placeholder="Ingresa la placa" maxlength="6" required></p>

                        <p><label>Número de póliza de seguro:</label></p>
                        <input name="Poliza" type="text" id="Poliza" class="form-control input-sm chat-input" placeholder="Ingresa la póliza de seguro" onkeypress="return SoloNumeros(event)" maxlength="9" required></p>

                        <p><label>Número de tarjeta de circulación:</label></p>
                        <input name="Tarjeta" type="text" id="Tarjeta" value ="<%=NumTarCir%>" class="form-control input-sm chat-input" placeholder="Ingresa el número de tarjeta de circulación" maxlength="15" required></p>

                        <p><label>Fecha de verificación:</label></p>
                        <select id="fecha2" name="Mes" onchange="FechasYMas();
                                date(dia, año, campo);" class="select">
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
                            <option selected disabled > 01 </option>
                        </select>
                        <input type="text" class="form-control input-sm chat-input" name="anio" id="año" onkeypress="return SoloNumeros(event)" onkeyup="date(dia, año, campo);"  maxlength="4" placeholder="Año">

                        <input type="hidden"  name="campo" id="campo"  required> <br><br>



                        <%
                                String ModeloAnio = Modelo + "-" + Anio;
                                 //VARIABLE DE EXISTENCIA
                                //java.sql.Date sqlDate = new java.sql.Date(dt.getTime()); 
                                BD.cDatos objBD = new BD.cDatos();
                                objBD.conectar();
                                objBD.insertar("call AltasCarro('" + Placas + "','" + ModeloAnio + "', '" + Marca + "','" + NumPolSeg + "','" + NumTarCir + "','" + fechaV + "')");

                            } catch (Exception x) {
                                System.out.println("Tu error es:" + x);
                            }


                        %>
                        <p><input type="submit" id="Guardar" name="Guardar" value="Guardar" onClick="ValidaCarros()" class="btn btn-success" /></p><br><br>
                        <p>><input type="button" id="atras" name="atras" onclick="location.href = 'carros.html'" /></p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>