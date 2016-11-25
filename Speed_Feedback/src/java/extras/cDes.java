/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package extras;

/**
 *
 * @author Ger
 */
public class cDes {
    private String txtCifrado="";
    
    public  cDes()
    {
        
    }
    public  void texto(String txt)
    {
        this.txtCifrado = txt;
    }
    public String Cifrado(String txt)
    {
        return this.txtCifrado;
    }
    
    public String deCifrado(String txt)
    {
        return this.txtCifrado;
    }
    
}
