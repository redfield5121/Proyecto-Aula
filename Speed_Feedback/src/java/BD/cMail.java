/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import com.sun.mail.handlers.multipart_mixed;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author Ger
 */
public class cMail {
    public String _error = "";
    private String _para = "";
    private String _cuerpoMsj = "";
    private String _de = "speed.feedback.contacto@gmail.com";
    private String _titulo = "";
    
    public cMail()
    {
        
    }
    public boolean mandaMAil(String Para, String Titulo, String Msj)
    {
        boolean envio = false;
        this._titulo = Titulo;
        this._para  = Para;
        this._cuerpoMsj = Msj;
        
        try
        {
            
            // Configuracion de la cuenta de envio de mail
            Properties confMail = new Properties();
            confMail.setProperty("mail.smtp.host", "smtp.gmail.com");
            confMail.setProperty("mail.smtp.starttls.enable", "true");
            confMail.setProperty("mail.smtp.port", "587");
            confMail.setProperty("mail.smtp.user", "speed.feedback.contacto@gmail.com");
            confMail.setProperty("mail.smtp.auth", "true");
            // Sesion
            Session session = Session.getDefaultInstance(confMail);
            // Creamos el MAil
            MimeMessage correo = new MimeMessage(session);
            correo.setFrom(new InternetAddress(this._de));
            correo.addRecipient(Message.RecipientType.TO, new InternetAddress(this._para));
            correo.setSubject(this._titulo);
            
            //solo texto plano
            //correo.setText(this._cuerpoMsj);
            
            
            //cuerpo html
            //correo.setContent(this._cuerpoMsj, "text/html" );
            
            //html 2
            DataHandler dh = new DataHandler(this._cuerpoMsj, "text/html");
            correo.setDataHandler(dh);
            
            // Enviamos MAil .
            Transport t = session.getTransport("smtp");
            t.connect("speed.feedback.contacto@gmail.com", "Blacklabel123..");
            t.sendMessage(correo, correo.getAllRecipients());

            // Cerramos conexion.
            t.close();
            envio = true;
        }
        catch (Exception e)
        {
            
            this._error = e.getMessage();
        }
        return envio;
    }
    
}