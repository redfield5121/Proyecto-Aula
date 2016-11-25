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

            //VARIABLE DE EXISTENCIA
            //java.sql.Date sqlDate = new java.sql.Date(dt.getTime()); 
            BD.cDatos objBD = new BD.cDatos();
            objBD.conectar();
            String Placas = request.getParameter("Placas") == null ? "" : request.getParameter("Placas");
            String valor = request.getParameter("valor") == null ? "" : request.getParameter("valor");

            if (!Placas.equals("")) {

                out.print("<script>alert('No existen')</SCRIPT>");

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
                    <h1>Actualizar datos</h1>
                    <p><label>Actualice solo los datos que crea necesarios</label></p>
                    <form action="Carros3.jsp" method="post" name="f1" >

                        <p><label>Placas:</label>
                            <input name="Placas" type="text" class="form-control input-sm chat-input" id="Placas" value ="<%=Placas%>" placeholder="Ingresa la placa" maxlength="6"  required>
                            <input type="submit" id="Modificar" name="Buscar" value="Buscar" onclick="location.href = 'Carros3.jsp'" class="btn btn-success"/>

                            <%
                                ResultSet SteMen = objBD.consulta("call ConsultaCarro('" + Placas + "')");

                                while (SteMen.next()) {
                                    String NumPolSeg = SteMen.getString("no_de_poliza");
                                    String Marca = SteMen.getString("marca");
                                    String fechaV = SteMen.getString("fechaV");
                                    String ModeloAnio = SteMen.getString("modelo");
                                    String NumTarCir = SteMen.getString("no_de_tarjeta");

                            %>
                        <p><label >Marca: </label>
                            <input name="marca" type="text" id="marca" value ="<%=Marca%>" readonly=”readonly” required></p>
                        <label >Cambiar marca: </label>
                        <select id="Marca" name="Marca" onclick="validaModufuca()">
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


                        <p><label >Modelo-Año:</label>
                            <input name="modeloanio" type="text" id="modeloanio" value ="<%=ModeloAnio%>" readonly=”readonly” required></p>
                        <label >Cambiar Modelo-Año:</label>
                        <input name="Modelo" type="text" id="Modelo" placeholder="Ingresa el modelo" class="form-control input-sm chat-input" maxlength="15" > - 
                        <input name="Anio" type="text" id="Anio" placeholder="Ingresa el año" class="form-control input-sm chat-input" onkeypress="return SoloNumeros(event)" maxlength="4" ></p>



                        <p><label>Número de póliza de seguro:</label>
                            <input name="poliza" type="text" id="poliza" value ="<%=NumPolSeg%>" class="form-control input-sm chat-input" readonly=”readonly” required></p>
                        <label>Cambiar número de póliza de seguro: </label>
                        <input name="Poliza" type="text" id="Poliza" placeholder="Ingresa la póliza de seguro" onkeypress="return SoloNumeros(event)" maxlength="9" ></p>


                        <p><label>Cambiar número de tarjeta de circulación:</label>
                            <input name="tarjeta" type="text" id="tarjeta" class="form-control input-sm chat-input" value ="<%=NumTarCir%>" readonly=”readonly” </p>
                        <label>Nuevo número de tarjeta de circulación:</label>
                        <input name="Tarjeta" type="text" id="Tarjeta" placeholder="Ingresa la póliza de seguro" onkeypress="return SoloNumeros(event)" maxlength="9"></p>

                        <p><label>Fecha de verificación: </label>
                            <input name="FechaV" type="text" id="FechaV" class="form-control input-sm chat-input" value ="<%=fechaV%>" readonly=”readonly” </p>


                        <label>Cambiar fecha de verificación:</label>
                        <select id="fecha2" name="Mes" onchange="FechasYMas();
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
                            <option selected disabled > 01 </option>
                        </select>
                        <input type="text" class="textbox" class="form-control input-sm chat-input" name="anio" id="año" onkeypress="return SoloNumeros(event)" onkeyup="date(dia, año, campo)"  maxlength="4" placeholder="Año">

                        <input type="hidden"  name="campo" id="campo" > <br><br>


                    </form>

                    <form action="Carros3.jsp" method="post" >


                        <%

                                String oModeloAnio = "";
                                String oNumTarCir = "";
                                int oNumPolSeg = 0;
                                String oMarca = "";
                                String ofechaV = "";

                                String FechaC = request.getParameter("campo") == null ? "" : request.getParameter("campo");
                                String ModeloC = request.getParameter("Modelo") == null ? "" : request.getParameter("Modelo");
                                String NumTarCirC = request.getParameter("Tarjeta") == null ? "" : request.getParameter("Tarjeta");
                                int AnioC = request.getParameter("Anio") == null ? 0 : Integer.parseInt(request.getParameter("Anio"));
                                int NumPolSegC = request.getParameter("Poliza") == null ? 0 : Integer.parseInt(request.getParameter("Poliza"));
                                String MarcaC = request.getParameter("Marca") == null ? "" : request.getParameter("Marca");

                                if (FechaC == "" || FechaC == null) {
                                    ofechaV = fechaV;
                                } else {
                                    ofechaV = FechaC;
                                    if (ModeloC == "" || ModeloC == null) {
                                        oModeloAnio = ModeloAnio;

                                    } else if (AnioC == 0) {
                                        oModeloAnio = ModeloAnio;

                                    } else {
                                        oModeloAnio = ModeloC + "-" + AnioC;

                                        if (NumPolSegC == 0) {

                                            oNumPolSeg = Integer.parseInt(NumPolSeg);

                                        } else {

                                            oNumPolSeg = NumPolSegC;
                                            if (MarcaC == "" || MarcaC == null) {
                                                oMarca = Marca;
                                            } else {
                                                oMarca = MarcaC;
                                                if (NumTarCirC == "" || NumTarCirC == null) {
                                                    oNumTarCir = NumTarCir;
                                                } else {
                                                    oNumTarCir = oNumTarCir;
                                                }
                                            }
                                        }
                                    }
                                }
                                objBD.actualizar("call ModificaCarro('" + Placas + "','" + oModeloAnio + "', '" + oMarca + "','" + oNumPolSeg + "','" + oNumTarCir + "','" + ofechaV + "')");

                            }
                        %>
                        <p><input type="submit" id="Guardar" name="Guardar" value="Guardar" onClick="ValidaCarros()" class="btn btn-success" /></p> <br><br>

                        <p><input type="button" id="atras" name="atras" onclick="location.href = 'carros.html'" /></p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>