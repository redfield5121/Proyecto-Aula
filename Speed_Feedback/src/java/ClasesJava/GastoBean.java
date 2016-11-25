/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesJava;

import java.sql.ResultSet;

public class GastoBean {
    private int idUsuario;
    private String alerta;
    private int error;
 
    public GastoBean(String nombreG, String servicio, String prestador, String fechaG, float cantidad)
    {
   
        try
        {
            BD.cDatos objBD = new BD.cDatos();
            objBD.conectar();
            
            ResultSet rsUsr = objBD.consulta("call spInsertarGasto('"+nombreG+"', '"+servicio+"', '"+prestador+"','"+ fechaG + "','" + cantidad+ "');");
            if(rsUsr.next())
            {
                if(rsUsr.getInt("idusuario")>0)
                {
                    this.error = 0;
                    this.alerta = rsUsr.getString("msj");
                    this.idUsuario = rsUsr.getInt("idusuario");
                }
                else
                {
                    this.error = 1;
                    this.alerta = rsUsr.getString("msj");
                    this.idUsuario = rsUsr.getInt("idusuario");
                }
            }
        }
        catch(Exception exc)
        {
            this.error = 1;
            this.alerta = exc.getMessage();
            this.idUsuario = 0;
        }
    }
    
    public int ERROR()
    {
        return this.error;
    }
    public String MSJ()
    {
        return this.alerta;
    }
    public int IDUSUARIO()
    {
        return this.idUsuario;
    }
}

