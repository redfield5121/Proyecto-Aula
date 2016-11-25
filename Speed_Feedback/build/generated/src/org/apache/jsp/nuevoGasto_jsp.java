package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.sql.*;

public final class nuevoGasto_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Nuevo gasto</title>\n");
      out.write("        <script src=\"javascript/Validaciones.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background:url(\"Imagenes/imagen1.jpg\")fixed;\n");
      out.write("            }\n");
      out.write("            p{color:floralwhite}\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    \n");
      out.write("         <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\">Proyecto</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li><a href=\"index.html\">Home</a></li>\n");
      out.write("                    <li><a href=\"InicioSesion.jsp\">Iniciar Sesion</a></li>\n");
      out.write("                    <li ><a href=\"RegistroSesion.html\">Registrate</a></li>\n");
      out.write("                    <li class=\"active\"><a href=\"menuGastos.html\">Gastos</a></li>\n");
      out.write("                    <li><a href=carros.html>Autos</a></li>\n");
      out.write("                </ul>\n");
      out.write("        </nav>\n");
      out.write("        <div style=\"height: 50px\"></div>\n");
      out.write("        <div class=\"container\" style=\"position: fixed\">\n");
      out.write("            <div class=\"col-md-offset-5 col-md-3\">\n");
      out.write("                <div class=\"loginGastos\">\n");
      out.write("        \n");
      out.write("        <h1 style=\"color: white\">Nuevo gasto</h1>\n");
      out.write("        <p>Registra el gasto introduciendo los datos que se te piden</p>\n");
      out.write("        <hr>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form method=\"POST\" name=\"f1\" action=\"nuevoGasto.jsp\">\n");
      out.write("            <p>  Nombre del gasto: </p><input onkeypress=\"return SoloLetras(event)\"  class=\"form-control input-sm chat-input\" type=\"text\" id=\"nombreG\" autocomplete=\"off\" name=\"nombreG\" placeholder=\"Nombre del gasto\"   required/> <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <p>Concepto del gasto:</p> <input type=\"text\" id=\"servicio\"  name=\"servicio\" class=\"form-control input-sm chat-input\" autocomplete=\"off\" placeholder=\"Servicio\" required>\n");
      out.write("\n");
      out.write("            <p>Prestador de servicios:</p> <input type=\"text\" placeholder=\"Prestador\"  name=\"pestador\" class=\"form-control input-sm chat-input\" autocomplete=\"off\" id=\"prestador\"  /><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <p>Cantidad invertida:</p> <input type=\"text\" name=\"cantidadInv\" class=\"form-control input-sm chat-input\" autocomplete=\"off\" onkeypress=\"return SoloNumeros(event)\" id=\"cantidadInv\"  required /> \n");
      out.write("            \n");
      out.write("            <p>Fecha del gasto:</p>\n");
      out.write("            <select id=\"fecha2\" name=\"Mes\" onchange=\"cambia_colonia3();\n");
      out.write("                    date(dia, año, campo)\" class=\"select\">\n");
      out.write("                <option value=\"0\" selected disabled> Mes </option>\n");
      out.write("                <option value=\"1\"> Enero</option>\n");
      out.write("                <option value=\"2\"> Febrero </option>\n");
      out.write("                <option value=\"3\"> Marzo </option>\n");
      out.write("                <option value=\"4\"> Abril </option>\n");
      out.write("                <option value=\"5\"> Mayo </option>\n");
      out.write("                <option value=\"6\"> Junio </option>\n");
      out.write("                <option value=\"7\"> Julio </option>\n");
      out.write("                <option value=\"8\"> Agosto </option>\n");
      out.write("                <option value=\"9\"> Septiembre </option>\n");
      out.write("                <option value=\"10\"> Octubre </option>\n");
      out.write("                <option value=\"11\"> Noviembre </option>\n");
      out.write("                <option value=\"12\"> Diciembre </option>\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <select id=\"fecha\" name=\"dia\" class=\"select\" onchange=\"date(dia, año, campo);\">\n");
      out.write("                <option selected disabled > Día </option>\n");
      out.write("            </select>\n");
      out.write("            <input type=\"text\" name=\"anio\" class=\"form-control input-sm chat-input\" id=\"año\" onkeypress=\"return soloNumero(event);\" onkeyup=\"\n");
      out.write("                    date(dia, año, campo)\"  maxlength=\"4\" placeholder=\"Año\">\n");
      out.write("\n");
      out.write("            <input type=\"text\" hidden=\"hidden\" name=\"campo\" id=\"campo\"  required> \n");
      out.write("\n");
      out.write("            <input type=\"submit\" value=\"Ingresar gasto\"  class=\"btn btn-success\" id=\"Ingresargasto\" onclick=\"validaGasto()\"/>\n");
      out.write("            <input type=\"reset\" value=\"Reiniciar\" class=\"btn btn-success\" /> \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <input type=\"button\" value=\"Atrás\" name=\"Atras\" class=\"btn btn-success\" onclick=\"location.href='menuGastos.html'\"/>\n");
      out.write("        </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        ");


            try {
                String nombreG = request.getParameter("nombreG");
                String servicio = request.getParameter("servicio");
                String prestador = request.getParameter("pestador");
                String fechaG = request.getParameter("campo");
                String cantidad = request.getParameter("cantidadInv");
                float gasto = Integer.parseInt(cantidad);

                //VARIABLE DE EXISTENCIA
                out.print("<script>alert('" +" El nombre de tu gasto: "+ nombreG +" El servicio es: "+ servicio +" El prestador de servicios es: "+ prestador + " FECHADO: "+ fechaG + " $ "+gasto+ "')</SCRIPT>");
                //java.sql.Date sqlDate = new java.sql.Date(dt.getTime()); 
                BD.cDatos objBD = new BD.cDatos();
                objBD.conectar();
                objBD.insertar("call spInsertaGasto('" + nombreG + "','" + servicio + "', '" + prestador + "','" + fechaG + "','" + gasto + "')");

            } catch (Exception x) {
               System.out.println("tu error es: " + x);
            }
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("     \n");
      out.write("</body>\n");
      out.write("</html>\n");
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
