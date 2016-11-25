package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;;
import java.sql.ResultSet;;

public final class Carros3_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=UTF-8\">\n");
      out.write("        <script type=\"text/javascript\" src=\"js/Validaciones.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background:url(\"Imagenes/imagen1.jpg\")fixed;\n");
      out.write("            }\n");
      out.write("            p{color:floralwhite}\n");
      out.write("        </style>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        ");


            //VARIABLE DE EXISTENCIA
            //java.sql.Date sqlDate = new java.sql.Date(dt.getTime()); 
            BD.cDatos objBD = new BD.cDatos();
            objBD.conectar();
            String Placas = request.getParameter("Placas") == null ? "" : request.getParameter("Placas");
            String valor = request.getParameter("valor") == null ? "" : request.getParameter("valor");

            if (!Placas.equals("")) {

                out.print("<script>alert('No existen')</SCRIPT>");

            }


        
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\">Proyecto</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li><a href=\"PaginadeBienvenida.jsp\">Página de Bienvenida</a></li>\n");
      out.write("\n");
      out.write("                    <li><a href=\"menuGastos.html\">Gastos</a></li>\n");
      out.write("                    <li><a href=\"carros.html\" class=\"active\">Autos</a></li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("        </nav>\n");
      out.write("        <div style=\"height: 50px\"></div>\n");
      out.write("        <div class=\"container\" style=\"position: fixed\">\n");
      out.write("            <div class=\"col-md-offset-5 col-md-3\">\n");
      out.write("                <div class=\"loginCarros\">\n");
      out.write("                    <h1>Actualizar datos</h1>\n");
      out.write("                    <p><label>Actualice solo los datos que crea necesarios</label></p>\n");
      out.write("                    <form action=\"Carros3.jsp\" method=\"post\" name=\"f1\" >\n");
      out.write("\n");
      out.write("                        <p><label>Placas:</label>\n");
      out.write("                            <input name=\"Placas\" type=\"text\" class=\"form-control input-sm chat-input\" id=\"Placas\" value =\"");
      out.print(Placas);
      out.write("\" placeholder=\"Ingresa la placa\" maxlength=\"6\"  required>\n");
      out.write("                            <input type=\"submit\" id=\"Modificar\" name=\"Buscar\" value=\"Buscar\" onclick=\"location.href = 'Carros3.jsp'\" class=\"btn btn-success\"/>\n");
      out.write("\n");
      out.write("                            ");

                                ResultSet SteMen = objBD.consulta("call ConsultaCarro('" + Placas + "')");

                                while (SteMen.next()) {
                                    String NumPolSeg = SteMen.getString("no_de_poliza");
                                    String Marca = SteMen.getString("marca");
                                    String fechaV = SteMen.getString("fechaV");
                                    String ModeloAnio = SteMen.getString("modelo");
                                    String NumTarCir = SteMen.getString("no_de_tarjeta");

                            
      out.write("\n");
      out.write("                        <p><label >Marca: </label>\n");
      out.write("                            <input name=\"marca\" type=\"text\" id=\"marca\" value =\"");
      out.print(Marca);
      out.write("\" readonly=”readonly” required></p>\n");
      out.write("                        <label >Cambiar marca: </label>\n");
      out.write("                        <select id=\"Marca\" name=\"Marca\" onclick=\"validaModufuca()\">\n");
      out.write("                            <option value=\"0\" selected=\"selected\">- Selecciona -</option>\n");
      out.write("                            <option value=\"Nissan\">Nissan</option>\n");
      out.write("                            <option value=\"Chevrolet\">Chevrolet</option>\n");
      out.write("                            <option value=\"Volkswagen\">Volkswagen</option>\n");
      out.write("                            <option value=\"Honda\">Honda</option>\n");
      out.write("                            <option value=\"Toyota\">Toyota</option>\n");
      out.write("                            <option value=\"Mazda\">Mazda</option>\n");
      out.write("                            <option value=\"Ford\">Ford</option>\n");
      out.write("                            <option value=\"General Motors\">General Motors</option>\n");
      out.write("                            <option value=\"Audi\">Audi</option>\n");
      out.write("                            <option value=\"Suzuki\">Suzuki</option>\n");
      out.write("                            <option value=\"FCA México\">FCA México</option>\n");
      out.write("                            <option value=\"KIA\">KIA</option>\n");
      out.write("                            <option value=\"Hyundai\">Hyundai</option>\n");
      out.write("                            <option value=\"Renault \">Renault </option>\n");
      out.write("                            <option value=\"SEAT\">SEAT</option>\n");
      out.write("                            <option value=\"BMW\">BMW</option>\n");
      out.write("                            <option value=\"Mercedes-Benz\">Mercedes-Benz</option>\n");
      out.write("                            <option value=\"Peugeot\">Peugeot</option>\n");
      out.write("                            <option value=\"MINI\">MINI</option>\n");
      out.write("                            <option value=\"Lincoln\">Lincoln</option>\n");
      out.write("                            <option value=\"Infiniti\">Infiniti</option>\n");
      out.write("                            <option value=\"Acura\">Acura</option>\n");
      out.write("                            <option value=\"Volvo\">Volvo</option>\n");
      out.write("                            <option value=\"Porsche\">Porsche</option>\n");
      out.write("                            <option value=\"Subaru\">Subaru</option>\n");
      out.write("                            <option value=\"Isuzu\">Isuzu</option>\n");
      out.write("                            <option value=\"Land Rover\">Land Rover</option>\n");
      out.write("                            <option value=\"Smart\">Smart</option>\n");
      out.write("                            <option value=\"Jaguar\">Jaguar</option>\n");
      out.write("                            <option value=\"Otro\">Otro</option>\n");
      out.write("                        </select>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <p><label >Modelo-Año:</label>\n");
      out.write("                            <input name=\"modeloanio\" type=\"text\" id=\"modeloanio\" value =\"");
      out.print(ModeloAnio);
      out.write("\" readonly=”readonly” required></p>\n");
      out.write("                        <label >Cambiar Modelo-Año:</label>\n");
      out.write("                        <input name=\"Modelo\" type=\"text\" id=\"Modelo\" placeholder=\"Ingresa el modelo\" class=\"form-control input-sm chat-input\" maxlength=\"15\" > - \n");
      out.write("                        <input name=\"Anio\" type=\"text\" id=\"Anio\" placeholder=\"Ingresa el año\" class=\"form-control input-sm chat-input\" onkeypress=\"return SoloNumeros(event)\" maxlength=\"4\" ></p>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <p><label>Número de póliza de seguro:</label>\n");
      out.write("                            <input name=\"poliza\" type=\"text\" id=\"poliza\" value =\"");
      out.print(NumPolSeg);
      out.write("\" class=\"form-control input-sm chat-input\" readonly=”readonly” required></p>\n");
      out.write("                        <label>Cambiar número de póliza de seguro: </label>\n");
      out.write("                        <input name=\"Poliza\" type=\"text\" id=\"Poliza\" placeholder=\"Ingresa la póliza de seguro\" onkeypress=\"return SoloNumeros(event)\" maxlength=\"9\" ></p>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <p><label>Cambiar número de tarjeta de circulación:</label>\n");
      out.write("                            <input name=\"tarjeta\" type=\"text\" id=\"tarjeta\" class=\"form-control input-sm chat-input\" value =\"");
      out.print(NumTarCir);
      out.write("\" readonly=”readonly” </p>\n");
      out.write("                        <label>Nuevo número de tarjeta de circulación:</label>\n");
      out.write("                        <input name=\"Tarjeta\" type=\"text\" id=\"Tarjeta\" placeholder=\"Ingresa la póliza de seguro\" onkeypress=\"return SoloNumeros(event)\" maxlength=\"9\"></p>\n");
      out.write("\n");
      out.write("                        <p><label>Fecha de verificación: </label>\n");
      out.write("                            <input name=\"FechaV\" type=\"text\" id=\"FechaV\" class=\"form-control input-sm chat-input\" value =\"");
      out.print(fechaV);
      out.write("\" readonly=”readonly” </p>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <label>Cambiar fecha de verificación:</label>\n");
      out.write("                        <select id=\"fecha2\" name=\"Mes\" onchange=\"FechasYMas();\n");
      out.write("                                date(dia, año, campo)\" class=\"select\">\n");
      out.write("                            <option value=\"0\" selected disabled> Mes </option>\n");
      out.write("                            <option value=\"1\"> Enero</option>\n");
      out.write("                            <option value=\"2\"> Febrero </option>\n");
      out.write("                            <option value=\"3\"> Marzo </option>\n");
      out.write("                            <option value=\"4\"> Abril </option>\n");
      out.write("                            <option value=\"5\"> Mayo </option>\n");
      out.write("                            <option value=\"6\"> Junio </option>\n");
      out.write("                            <option value=\"7\"> Julio </option>\n");
      out.write("                            <option value=\"8\"> Agosto </option>\n");
      out.write("                            <option value=\"9\"> Septiembre </option>\n");
      out.write("                            <option value=\"10\"> Octubre </option>\n");
      out.write("                            <option value=\"11\"> Noviembre </option>\n");
      out.write("                            <option value=\"12\"> Diciembre </option>\n");
      out.write("                        </select>\n");
      out.write("\n");
      out.write("                        <select id=\"fecha\" name=\"dia\" class=\"select\" onchange=\"date(dia, año, campo);\">\n");
      out.write("                            <option selected disabled > 01 </option>\n");
      out.write("                        </select>\n");
      out.write("                        <input type=\"text\" class=\"textbox\" class=\"form-control input-sm chat-input\" name=\"anio\" id=\"año\" onkeypress=\"return SoloNumeros(event)\" onkeyup=\"date(dia, año, campo)\"  maxlength=\"4\" placeholder=\"Año\">\n");
      out.write("\n");
      out.write("                        <input type=\"hidden\"  name=\"campo\" id=\"campo\" > <br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                    <form action=\"Carros3.jsp\" method=\"post\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("                        ");


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
                        
      out.write("\n");
      out.write("                        <p><input type=\"submit\" id=\"Guardar\" name=\"Guardar\" value=\"Guardar\" onClick=\"ValidaCarros()\" class=\"btn btn-success\" /></p> <br><br>\n");
      out.write("\n");
      out.write("                        <p><input type=\"button\" id=\"atras\" name=\"atras\" onclick=\"location.href = 'carros.html'\" /></p>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
