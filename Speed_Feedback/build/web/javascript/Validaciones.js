/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var aux3;
var fec_1 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
var fec_2 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29");
var fec_3 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
var fec_4 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30");
var fec_5 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
var fec_6 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30");
var fec_7 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
var fec_8 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
var fec_9 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30");
var fec_10 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");
var fec_11 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30");
var fec_12 = new Array("Día", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "22", "23", "24", "25", "26", "27", "28", "29", "30");
function cambia_colonia3(Mes) {
    var fecha = document.f1.fecha2[document.f1.fecha2.selectedIndex].value;
    if (fecha !== 0) {
        mis_colonias = eval("fec_" + fecha);
        num_colonias = mis_colonias.length;
        document.f1.fecha.length = num_colonias;
        for (i = 0; i < num_colonias; i++) {
            document.f1.fecha.options[i].value = mis_colonias[i];
            document.f1.fecha.options[i].text = mis_colonias[i];
            switch (fecha[i]) {

                case "1":
                    aux3 = "Enero";
                    break;
                case "2":
                    aux3 = "Febrero";
                    break;
                case "3":
                    aux3 = "Marzo";
                    break;
                case "4":
                    aux3 = "Abril";
                    break;
                case "5":
                    aux3 = "Mayo";
                    break;
                case "6":
                    aux3 = "Junio";
                    break;
                case "7":
                    aux3 = "Julio";
                    break;
                case "8":
                    aux3 = "Agosto";
                    break;
                case "9":
                    aux3 = "Septiembre";
                    break;
                case "10":
                    aux3 = "Octubre";
                    break;
                case "11":
                    aux3 = "Noviembre";
                    break;
                case "12":
                    aux3 = "Diciembre";
                    break;
            }
        }
    } else {
        document.f1.fecha.length = 1;
        document.f1.fecha.options[0].value = "-";
        document.f1.fecha.options[0].text = "-";
    }
    document.f1.provincia.options[0].selected = true;

}
function date(dia, anio, campo) {
                campo.value = dia.value + "/" + aux3 + "/" + anio.value;
            }
function validaGasto() {
    var nombre = document.getElementById('nombreG').value;
    var servicio = document.getElementById('servicio').value;
    var presta = document.getElementById('prestador').value;
    var cantidad = document.getElementById('cantidadInv').value;
    var fecha = document.getElementById('campo').value;


    if (nombre == "") {
        alert('Ingresa el nombre del gasto');
        document.getElementById("nombreG").focus();
        document.getElementById('Ingresargasto').disable = true;
        valido = false;
    } else {
        if (servicio == "") {
            alert('Ingresa el concepto del gasto correctamente');
            document.getElementById("servicio").focus();
            document.getElementById('Ingresargasto').disable = true;
            valido = false;
        } else {
            if (presta == "") {

                alert('Ingresa el prestador con quien se efectuo el gasto correctamente');
                document.getElementById("Prestador").focus();
                document.getElementById('Ingresargasto').disable = true;
                valido = false;
            } else {
                if (cantidad == "") {
                    alert('Ingresa una cantidad válida');
                    
                    document.getElementById("cantidadInv").focus();
                    document.getElementById('Ingresargasto').disable = true;
                    valido = false;
                } else {
                    if (cantidad == "") {
                        alert('Ingresa una fecha válida');
                        document.getElementById("cantidadInv").focus();
                        document.getElementById('Ingresargasto').disable = true;
                        valido = false;
                    } else {
                        valido == true;
                        alert('Datos correctos, registrando...');
                        document.forms[0].submit();
                    }
                }
            }
        }
    }

}
	function init () {
				var num1=document.getElementById('num1').value;
				var num2=document.getElementById('num2').value;
				var resultado;
				var pattnum = /[0-9]\d+$/;
                                }
function SoloNumeros(e)
{
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57 || key == 46)
    {
        alert('Solo puede contener números');
        return false;
    }
}

function SoloLetras(e)
{
    var key = window.Event ? e.which : e.keyCode
    return ((key >= 65 && key <= 90) || (key >= 97 && key <= 122) || (key >= 97 && key <= 122) || (key >= 128 && key <= 141))
    {
        alert('Solo puede contener letras');
        return false;
    }
}

function ValidaCarros()
{
    var valido = true;
    var modelo = document.getElementById('Modelo').value;
    var placas = document.getElementById('Placas').value;
    var numtarcir = document.getElementById('Tarjeta').value;
    var anio = document.getElementById('Anio').value;
    var Anio = document.getElementById('año').value;
    var numpolseg = document.getElementById('Poliza').value;
    var marca = document.getElementById('Marca').value;
    var fecha = document.getElementById('campo').value;


    if (2018 < Anio || Anio < 1950) {
        document.getElementById('Guardar').disable = true;
        document.getElementById('año').value = "";
        document.getElementById('año').focus();
        alert('Ingrese una feha válida');
        verificar = false;
    } else {
        if (fecha == "" || fecha == null) {
            document.getElementById('Guardar').disable = true;
            document.getElementById('campo').value = "";
            document.getElementById('campo').focus();
            alert('Falta fecha');
            verificar = false;
        } else {
            if (modelo == "" || modelo == null) {
                document.getElementById('Guardar').disable = true;
                document.getElementById('Modelo').value = "";
                document.getElementById('Modelo').focus();
                alert('Falta Modelo');
                verificar = false;
            } else {
                if (placas == "" || placas == null) {
                    document.getElementById('Guardar').disable = true;
                    document.getElementById('Placas').value = "";
                    document.getElementById('Placas').focus();
                    alert('Falta Placas');
                    verificar = false;
                } else {
                    if (anio == "" || anio == null) {
                        document.getElementById('Guardar').disable = true;
                        document.getElementById('Anio').value = 0;
                        document.getElementById('Anio').focus();
                        alert('Falta el año');
                        verificar = false;

                    } else {
                        if (numpolseg == "" || numpolseg == null) {
                            document.getElementById('Guardar').disable = true;
                            document.getElementById('Poliza').value = 0;
                            document.getElementById('Poliza').focus();
                            alert('Falta la poliza');
                            verificar = false;

                        } else {

                            if (numtarcir == "" || numtarcir == null) {
                                document.getElementById('Guardar').disable = true;
                                document.getElementById('Tarjeta').value = "";
                                document.getElementById('Tarjeta').focus();
                                alert('Falta el número de tarjeta de circulación');
                                verificar = false;
                            } else {
                                if (marca == "0" || marca == null) {
                                    document.getElementById('Guardar').disable = true;
                                    document.getElementById('Modelo').value = "";
                                    document.getElementById('Modelo').focus();
                                    alert('Falta Marca');
                                    verificar = false;
                                } else {
                                    verificar = true;
                                    document.forms[0].submit();
                                    alert('Automovil correctamente guardado :)');
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}





