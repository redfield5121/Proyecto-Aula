package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Microsoft Windows
 */
@WebServlet(name = "ServletCantidad", urlPatterns = {"/ServletCantidad"})
public class ServletCantidad extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n"
                    + "        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n"
                    + "        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>");
            String strDatosGraf = "";
            try {
                BD.cDatos objSql = new BD.cDatos();
                objSql.conectar();
                ResultSet rsDatos = objSql.consulta("call spGraficaCantidad();");
                while (rsDatos.next()) {
                    strDatosGraf += "[\"" + rsDatos.getString("servicio") + "\", " + rsDatos.getString("total") + ", \"#" + rsDatos.getString("color") + "\"],\n";
                }

            } catch (Exception xxxD) {
                out.println("<script>alert('Tienes un error' " + xxxD + "));");
            }
            out.println("<title>Grafica de cantidades</title>"
                    + "<script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>\n"
                    + "  <script type=\"text/javascript\">\n"
                    + "    google.charts.load(\"current\", {packages:[\"corechart\"]});\n"
                    + "    google.charts.setOnLoadCallback(drawChart);\n"
                    + "    function drawChart() {\n"
                    + "      var data = google.visualization.arrayToDataTable([\n"
                    + "        [\"Element\", \"Pesos\", { role: \"style\" } ],\n"
                    + strDatosGraf
                    + "      ]);\n"
                    + "\n"
                    + "      var view = new google.visualization.DataView(data);\n"
                    + "      view.setColumns([0, 1,\n"
                    + "                       { calc: \"stringify\",\n"
                    + "                         sourceColumn: 1,\n"
                    + "                         type: \"string\",\n"
                    + "                         role: \"annotation\" },\n"
                    + "                       2]);\n"
                    + "\n"
                    + "      var options = {\n"
                    + "        title: \"gastos\",\n"
                    + "        width: 600,\n"
                    + "        height: 400,\n"
                    + "        bar: {groupWidth: \"95%\"},\n"
                    + "        legend: { position: \"none\" },\n"
                    + "      };\n"
                    + "      var chart = new google.visualization.BarChart(document.getElementById(\"barchart_value\"));\n"
                    + "      chart.draw(view, options);\n"
                    + "  }\n"
                    + "  </script>"
                    + ""
                    + "");
            out.println("</head>");
            out.println("<body>");
            out.println("<center>");
            out.println(" <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n"
                    + "            <div class=\"container-fluid\">\n"
                    + "                <div class=\"navbar-header\">\n"
                    + "                    <a class=\"navbar-brand\">Proyecto</a>\n"
                    + "                </div>\n"
                    + "                <ul class=\"nav navbar-nav\">\n"
                    + "                    <li><a href=\"PaginadeBienvenida.jsp\">Página de Bienvenida</a></li>\n"
                    + "                    <li class=\"active\"><a href=\"menuGastos.html\">Gastos</a></li> "
                    + "<li><a href=\"carros.html\">Autos</a></li>"
                    + "                </ul>\n"
                    + "        </nav>");
            out.println("<style>\n"
                    + "            body{\n"
                    + "                background:url(\"Imagenes/imagen1.jpg\")fixed;\n"
                    + "            }\n"
                    + "\n"
                    + "        </style>");
            out.print("<br><br><br>" + "<h1 style=\"color: white\">Gráfica de cantidad gastada</h1>");
            out.println("<div id=\"Atras\"> " + "<input type=\"button\" value=\"Atrás\" name=\"atras\" class=\"btn btn-success\" onclick=\"location.href='menuGastos.html'\"/>" + "</div>");
            out.println("<br><br><br>");
            out.println("<div id=\"barchart_value\" style=\"width: 900px; height: 300px;\"></div>");

            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
