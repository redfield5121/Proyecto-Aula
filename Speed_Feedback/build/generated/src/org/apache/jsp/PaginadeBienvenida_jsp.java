package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class PaginadeBienvenida_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background:url(\"Imagenes/imagen1.jpg\")fixed;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\">Proyecto</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li class=\"active\"><a href=\"PaginadeBienvenida.jsp\">Página de Bienvenida</a></li>\n");
      out.write("                    <li><a href=\"menuGastos.html\">Gastos</a></li>\n");
      out.write("                    <li><a href=\"carros.html\">Carros</a></li>\n");
      out.write("                </ul>\n");
      out.write("        </nav>\n");
      out.write("        <div style=\"height: 30px\" class=\"container\"></div>\n");
      out.write("        <div style=\"color: white\" class=\"container\">\n");
      out.write("            <br><br><br>\n");
      out.write("            ");

                HttpSession sesion = request.getSession();
                String nombre = (String) sesion.getAttribute("nombreusr");
                out.println("<h1>Bievenido a Speed&Feedback" + nombre +"</h1>");
                
            
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <form action=\"Cambios.jsp\" method=\"post\">\n");
      out.write("                <button type=\"submit\" name=\"Salir\" class=\"btn btn-success\" value=\"Salir\">Cambios</button>\n");
      out.write("            </form>\n");
      out.write("            <br><br>\n");
      out.write("            <form action=\"Sesiones.jsp\" method=\"post\">\n");
      out.write("                <center>\n");
      out.write("                    <button type=\"submit\" name=\"Salir\" class=\"btn btn-success\" value=\"Salir\">Cerrar Sesion</button>\n");
      out.write("                </center>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
