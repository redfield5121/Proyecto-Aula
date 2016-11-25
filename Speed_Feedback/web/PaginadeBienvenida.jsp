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
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand">Proyecto</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="PaginadeBienvenida.jsp">Página de Bienvenida</a></li>
                    <li><a href="menuGastos.html">Gastos</a></li>
                    <li><a href="carros.html">Autos</a></li>
                </ul>
        </nav>
        <div style="height: 30px" class="container"></div>
        <div style="color: white" class="container">
            <br><br><br>
            <%
                HttpSession sesion = request.getSession();
                String nombre = (String) sesion.getAttribute("nombreusr");
                out.println("<h1>Bievenido a Speed&Feedback " + nombre +"</h1>");
                
            %>
            <br>
            <br>
            <form action="Cambios.jsp" method="post">
                <button type="submit" name="Salir" class="btn btn-success" value="Salir">Cambios</button>
            </form>
            <br><br>
            <form action="Sesiones.jsp" method="post">
                <center>
                    <button type="submit" name="Salir" class="btn btn-success" value="Salir">Cerrar Sesion</button>
                </center>
            </form>
        </div>
    </body>
</html>

