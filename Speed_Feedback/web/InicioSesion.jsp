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
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="InicioSesion.jsp">Iniciar Sesion</a></li>
                    <li><a href="RegistroSesion.html">Registrate</a></li>
                </ul>
        </nav>

        <div style="height: 50px"></div>
        <div class="container" style="position: fixed;color: white">
            <div class="col-md-offset-5 col-md-3">

                <form action='Sesiones.jsp' method="POST">
                    <h1>Bienvenido</h1>
                    <input autocomplete="off" type="email" name="Correo" id="usuarioNombre" class="form-control input-sm chat-input" placeholder="Correo" required/>
                    <br/>
                    <input autocomplete="off" name="contra" type="password" id="password" class="form-control input-sm chat-input" placeholder="contraseña" required/>
                    <br/>
                    <input type="submit" name="Entrar" class="btn btn-info" id="registro" value="Registrate" /> 

                </form>

            </div>
        </div>
    </body>
</html>