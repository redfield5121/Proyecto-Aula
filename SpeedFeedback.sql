drop database if exists SpeedFeedback;
create database SpeedFeedback;
use SpeedFeedback;

DROP TABLE IF EXISTS administrador;
CREATE TABLE administrador (
  idadministrador int(11) NOT NULL,
  ap_paterno varchar(45) NOT NULL,
  nombre varchar(45) NOT NULL,
  ap_materno varchar(45) NOT NULL,
  correo varchar(45) NOT NULL,
  celular int(10) NOT NULL,
  contrasena varchar(45) NOT NULL,
  PRIMARY KEY (idadministrador)
); 
LOCK TABLES administrador WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS carros;
CREATE TABLE carros (
  placas varchar(6) NOT NULL,
  modelo varchar(45) NOT NULL,
  marca varchar(45) NOT NULL,
  no_de_poliza varchar(45) NOT NULL,
  no_de_tarjeta varchar(45) NOT NULL,
  fechaV nvarchar(30) NOT NULL,
  PRIMARY KEY (placas)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES carros WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS eventos;
CREATE TABLE eventos (
  ideventos int(11) NOT NULL,
  nombre varchar(100) NOT NULL,
  descripcion varchar(45) NOT NULL,
  fecha date NOT NULL,
  PRIMARY KEY (ideventos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES eventos WRITE;
UNLOCK TABLES;

drop table if exists gastos;
create table gastos(
idGasto int not null primary key,
nombreG nvarchar(50) not null,
servicio nvarchar(50) not null,
prestador nvarchar(50) not null,
fechaG nvarchar(50) not null, 
cantidad float not null
);

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  idusuarios int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  estado int(11) NOT NULL,
  ap_paterno varchar(45) NOT NULL,
  ap_materno varchar(45) NOT NULL,
  correo varchar(45) NOT NULL,
  celular varchar(10) DEFAULT NULL,
  contrasena varchar(45) NOT NULL,
  PRIMARY KEY (idusuarios)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES usuarios WRITE;
UNLOCK TABLES;

/*CREAMOS LAS RELACIONES*/

DROP TABLE IF EXISTS relcarrocliente;
CREATE TABLE relcarrocliente (
  idrelCarroCliente int(11) NOT NULL,
  idCliente int(11) DEFAULT NULL,
  idCarro varchar(6) DEFAULT NULL,
  PRIMARY KEY (idrelCarroCliente),
  KEY idCiente_idx (idCliente),
  KEY idCarro_idx (idCarro),
  CONSTRAINT idCarro FOREIGN KEY (idCarro) REFERENCES carros (placas) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT idCiente FOREIGN KEY (idCliente) REFERENCES usuarios (idusuarios) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES relcarrocliente WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS relclientegastos;
CREATE TABLE relclientegastos (
  idrelClienteGastos int(11) NOT NULL,
  idCliente int(6) DEFAULT NULL,
  idGasto int(11) DEFAULT NULL,
  PRIMARY KEY (idrelClienteGastos),
  KEY idCliente_idx (idCliente),
  KEY idGasto_idx (idGasto),
  CONSTRAINT idCliente FOREIGN KEY (idCliente) REFERENCES usuarios (idusuarios) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT idGasto FOREIGN KEY (idGasto) REFERENCES gastos (idGasto) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES relclientegastos WRITE;
UNLOCK TABLES;

 /*
 PROCEDURES DE AUTOS
 */

DROP PROCEDURE IF EXISTS AltasCarro;
delimiter **
CREATE PROCEDURE AltasCarro(
  in iplacas varchar(6),
  in imodelo varchar(45),
  in imarca varchar(45),
  in ino_de_poliza varchar(45),
  in ino_de_tarjeta varchar(45),
  in fecha nvarchar(30)
)
begin 
declare existe int;
declare msj nvarchar(100);
  set existe= (select count(*) from carros where placas = iplacas);
  if(existe = 0) then
   insert into carros(placas, modelo, marca, no_de_poliza,no_de_tarjeta, fechaV)
				values(iplacas, imodelo, imarca,ino_de_poliza,ino_de_tarjeta, fecha);
                set msj = 'Carro registrado';
else 
         set iplacas = -1;
         set msj = 'Carro ya ingresado previamente';
end if;
      select * from carros;
   end; **


drop procedure if exists ConsultaCarro;
delimiter **
create procedure ConsultaCarro(
  in iplacas varchar(6)
  )
begin
declare msj nvarchar (100);
declare existe int;

	set existe = (select count(*) from carros where placas = iplacas);
    if(existe = 0) then
	set msj = 'El auto no está registrado';	
    end if;
    select * from carros where iplacas=carros.placas;
	end;**

drop procedure if exists BajaCarro;
delimiter **
create procedure BajaCarro(
  in iplacas varchar(6)
  )
begin
declare msj nvarchar (100);
declare existe int;

	set existe = (select count(*) from carros where placas = iplacas);
    if(existe = 0) then
	set msj = 'El auto no está registrado';
else
		delete from carros where iplacas=carros.placas;
		set msj = 'Automovil elminado con exito!!!';
    end if;
	end;**
    
   drop procedure if exists ModificaCarro;
delimiter **	
create procedure ModificaCarro (
  in iplacas varchar(6),
  in imodelo varchar(45),
  in imarca varchar(45),
  in ino_de_poliza varchar(45),
  in ino_de_tarjeta varchar(45),
  in fecha nvarchar(30)
  )
begin								
	update carros set modelo = imodelo, marca = imarca, no_de_poliza = ino_de_poliza, no_de_tarjeta = ino_de_tarjeta, fechaV = fecha where iplacas= carros.placas;
end;**
delimiter ;

/* 
PROCEDURES DE GASTOS
*/

drop procedure if exists spInsertaGasto;
 delimiter $$
 create procedure spInsertaGasto(
 in nombre nvarchar(50),
in service nvarchar(50),
in presta nvarchar(50),
in fecha nvarchar(50), 
in cantidad float) 
begin

declare ec int;
declare idG int;
declare mensaje nvarchar(100);

set ec =(select count(*)from gastos where nombreG = nombre);
if (ec = 0) then
		set idG = (select ifnull(max(idGasto), 0) + 1 from gastos);
        insert into gastos(idGasto, nombreG, servicio, prestador, fechaG, cantidad)
				values(idG, nombre, service, presta , fecha, cantidad);
		set mensaje = 'Gasto insertado';
else 
         set idG = -1;
         set mensaje = 'Gasto ya ingresado';
end if;
      select * from gastos;
   end; $$

  
drop procedure if exists spGraficaServicio;
delimiter ** 
create procedure spGraficaServicio()

begin
select count(*) as total, servicio, 
 case 
		when (count(*)>1 and count(*)<5) then '00ffaa' 			
		when (count(*)>5 and count(*)<10) then 'b012fa' 
		when (count(*)>10 and count(*)<50) then 'd35400' 
		else 'ccbb55'  end
		as color 
from gastos 
	group by servicio;
end; **
delimiter ;

drop procedure if exists spGraficaCantidad;
delimiter //
create procedure spGraficaCantidad()

begin
select sum(cantidad) as total, cantidad, servicio,
 case 
		when (sum(cantidad)>10 and sum(cantidad)<500) then '00ffaa' 			
		when (sum(cantidad)>500 and sum(cantidad)<1000) then 'daea31' 
		when (sum(cantidad)>1000 and sum(cantidad)<5000) then '45ed36' 
		else 'ccbb55'  end
		as color 
from gastos 
	group by servicio;
end; //
delimiter ;
            
   
   
drop procedure if exists spGraficaPresta;
delimiter //
create procedure spGraficaPresta()

begin
select count(*) as total, prestador,
 case 
		when (count(*)>1 and count(*)<5) then 'a0ffaa' 			
		when (count(*)>5 and count(*)<10) then 'daea31' 
		when (count(*)>10 and count(*)<50) then '45ed36' 
		else 'ccbb55'  end
		as color 
from gastos 
	group by prestador;
end; //
delimiter ;


/*
 PROCEDURES USUARIOS 
*/

drop procedure if exists cambiaEstado;
                    delimiter **
                        create procedure cambiaEstado(in corr nvarchar(500))

                    begin 
		

                   declare mensaje nvarchar(500);

                   update usuarios set estado=1 where correo=corr;

                   
                   select mensaje as confirmacion;

end;**

delimiter ;

DROP PROCEDURE IF EXISTS sp_altas;
delimiter **
CREATE PROCEDURE sp_altas (in idusr int(9), nombre varchar(45),apellidopat VARCHAR(45),
apellidomat VARCHAR(45),correo VARCHAR(45),celular varchar(10), contrasena varchar(45))
BEGIN

declare xIdAlumno int;
declare existe int;

if(idusr = 0) then 
set existe = (select count(*) from usuarios where idusr = idusuarios);

if(existe = 0) then

set xIdAlumno = (select ifnull(max(idusuarios), 0) + 1 from usuarios);

insert into usuarios
values (xIdAlumno, nombre,0,apellidopat,apellidomat,correo,celular,md5(contrasena));

end if;
end if;

END ;**

DELIMITER ; 


DELIMITER ;;
CREATE FUNCTION fc_validarcorreo(mail nvarchar(45)) RETURNS int
BEGIN
declare existe int;

set existe = (select count(*) from usuarios where mail = correo);



return existe;

END ;;
DELIMITER ;
select * from usuarios;
