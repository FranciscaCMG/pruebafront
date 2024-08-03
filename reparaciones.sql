drop table reparacion;

CREATE TABLE reparacion (
	id numeric NOT NULL,
	fecha_ingreso date NULL,
	hora_ingreso time NULL,
	monto_total_reparaciones numeric(20,2) NULL,
	monto_total_recargos numeric(20,2) NULL,
	monto_iva numeric(20,2) NULL,
	total numeric(20,2) NULL,
	fecha_salida date NULL,
	hora_salida time NULL,
	fecha_entrega_cliente date NULL,
	hora_entrega_cliente time NULL,
	CONSTRAINT reparacion_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.reparacion_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;


insert into reparacion 
values(1, '2024-04-04', '12:34:56', 345.45, 12.34, 
34.9, 2345.43, '2024-04-20','12:34:56', '2024-04-20','12:34:56');



CREATE TABLE tipo_reparaciones (
	id numeric NOT NULL,
	tipo varchar NOT NULL,
	CONSTRAINT tiporeparacion_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.tipo_reparaciones_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;



insert into tipo_reparaciones values(1,'Reparaciones del sistema de frenos');

insert into tipo_reparaciones values(2,'Servicio del sistema de refrigeracion');

insert into tipo_reparaciones values(3,'Reparaciones del motor');

insert into tipo_reparaciones values(4,'Reparaciones de la transmision');

insert into tipo_reparaciones values(5,'Reparacion del sistema electrico');

insert into tipo_reparaciones values(6,'Reparacion del sistema de escape');

insert into tipo_reparaciones values(7,'Reparación de Neumáticos y Ruedas');

insert into tipo_reparaciones values(8,'Reparaciones de la Suspensión y la Dirección');

insert into tipo_reparaciones values(9,'Reparación del Sistema de Aire Acondicionado y Calefacción:');

insert into tipo_reparaciones values(10,'Reparaciones del Sistema de Combustible');

insert into tipo_reparaciones values(11,'Reparación y Reemplazo del Parabrisas y Cristales');


CREATE TABLE reparacion_incluye (
	id numeric NOT NULL,
	id_tipo_reparacion numeric NOT NULL,
	reparacion varchar NOT NULL,
	CONSTRAINT reparacion_incluye_pk PRIMARY KEY (id)
);

ALTER TABLE public.reparacion_incluye 
ADD CONSTRAINT reparacion_incluye_fk 
FOREIGN KEY (id_tipo_reparacion) REFERENCES public.tipo_reparaciones(id);


CREATE SEQUENCE public.reparacion_incluye_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

insert into reparacion_incluye values(1,1,'reemplazo de pastillas de freno');
insert into reparacion_incluye values(2,1,'discos');
insert into reparacion_incluye values(3,1,'tambores');
insert into reparacion_incluye values(4,1,'líneas de freno');
insert into reparacion_incluye values(5,1,'reparación o reemplazo del cilindro maestro de frenos');


insert into reparacion_incluye values(6,2,'Reparación o reemplazo de radiadores');
insert into reparacion_incluye values(7,2,'bombas de agua');
insert into reparacion_incluye values(8,2,'termostatos y mangueras');
insert into reparacion_incluye values(9,2,'solución de problemas de sobrecalentamiento');


insert into reparacion_incluye values(10,3,'reemplazo de bujías y cables');
insert into reparacion_incluye values(11,3,'reconstrucción del motor');
insert into reparacion_incluye values(12,3,'eparación de la junta de la culata');


insert into reparacion_incluye values(13,4,'reparación o reemplazo de componentes de la transmisión manual o automática');
insert into reparacion_incluye values(14,4,'cambios de líquido');
insert into reparacion_incluye values(15,4,'solución de problemas de cambios de marcha');


insert into reparacion_incluye values(16,5,'reparación de alternadores');
insert into reparacion_incluye values(17,5,'arrancadores');
insert into reparacion_incluye values(18,5,'baterías y sistemas de cableado');
insert into reparacion_incluye values(19,5,'eparación de componentes eléctricos como faros e intermitentes');
insert into reparacion_incluye values(20,5,'sistemas de entretenimiento');


insert into reparacion_incluye values(21,6,'reemplazo del silenciador');
insert into reparacion_incluye values(22,6,'tubos de escape');
insert into reparacion_incluye values(23,6,'catalizador');
insert into reparacion_incluye values(24,6,'solución de problemas relacionados con las emisiones');

insert into reparacion_incluye values(25,7,'Reparación de pinchazos');
insert into reparacion_incluye values(26,7,'reemplazo de neumáticos');
insert into reparacion_incluye values(27,7,'alineación y balanceo de ruedas');


insert into reparacion_incluye values(28,8,'Reemplazo de amortiguadores');
insert into reparacion_incluye values(29,8,'brazos de control');
insert into reparacion_incluye values(30,8,'rótulas');
insert into reparacion_incluye values(31,8,'reparación del sistema de dirección asistida');


insert into reparacion_incluye values(32,9,'recarga de refrigerante');
insert into reparacion_incluye values(33,9,'reparación o reemplazo del compresor');
insert into reparacion_incluye values(34,9,'solución de problemas del sistema de calefacción');


insert into reparacion_incluye values(35,10,'Limpieza o reemplazo de inyectores de combustible');
insert into reparacion_incluye values(36,10,'reparación o reemplazo de la bomba de combustible');
insert into reparacion_incluye values(37,10,'solución de problemas de suministro de combustible');

insert into reparacion_incluye values(38,11,'Reparación de pequeñas grietas en el parabrisas');
insert into reparacion_incluye values(39,11,'reemplazo completo de parabrisas y ventanas dañadas');


drop table reparacion_detalle;

CREATE TABLE reparacion_detalle (
	id numeric NOT NULL,
	id_reparacion numeric NOT NULL,
	patente varchar NOT NULL,
	id_precio int8 NOT NULL,
	fecha_reparacion date NULL,
	hora_reparacion time NULL,
	monto_reparacion numeric(20,2) NOT NULL,
	CONSTRAINT reparacion_detalle_pk PRIMARY KEY (id)
);

ALTER TABLE public.reparacion_detalle 
ADD CONSTRAINT id_reparacion_fk 
FOREIGN KEY (id_reparacion) REFERENCES public.reparacion(id);

ALTER TABLE public.reparacion_detalle 
ADD CONSTRAINT id_precio_fk 
FOREIGN KEY (id_precio) REFERENCES public.precios(id);

insert into reparacion_detalle values(1, 1, 'p2343', 20, '2024-04-04', '12:34:56', 23.23);


CREATE TABLE reparacion_settings (
	id numeric NOT NULL,
	nombre varchar NOT NULL,
	valor varchar NOT NULL,
	descripcion varchar NOT NULL,
	CONSTRAINT reparacion_settings_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.reparacion_settings_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

insert into reparacion_settings values(1, 'IVA', '0.13', 'iva');
insert into reparacion_settings values(2, 'DESCUENTO_DIA_ATENCION', 'lu-ma-mi-ju,9-12,10', 'lunes a jueves, de 9 horas a 12 horas, 10% de descuento');
insert into reparacion_settings values(3, 'RECARGO_RETRASO_RECOGIDA', '5,total,dia', '5% del total por dia de retraso en recogida');

CREATE TABLE precios (
	id numeric NOT NULL,
	id_tipo_reparacion numeric NOT NULL,
	id_tipo_vehiculo numeric NOT NULL,
	precio numeric(20,2) NOT NULL,
	CONSTRAINT precios_pk PRIMARY KEY (id)
);

ALTER TABLE public.precios 
ADD CONSTRAINT reparacion_incluye_fk 
FOREIGN KEY (id_tipo_reparacion) REFERENCES public.tipo_reparaciones(id);


CREATE SEQUENCE public.precios_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

delete from precios;

select * from precios;

insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(1,1,1,120000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(2,1,2,120000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(3,1,3,180000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(4,1,4,220000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(5,2,1,130000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(6,2,2,130000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(7,2,3,190000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(8,2,4,230000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(9,3,1,350000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(10,3,2,450000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(11,3,3,700000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(12,3,4,800000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(13,4,1,210000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(14,4,2,210000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(15,4,3,300000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(16,4,4,300000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(17,5,1,150000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(18,5,2,150000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(19,5,3,200000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(20,5,4,250000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(21,6,1,100000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(22,6,2,120000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(23,6,3,450000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(24,6,4,0);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(25,7,1,100000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(26,7,2,100000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(27,7,3,100000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(28,7,4,100000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(29,8,1,180000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(30,8,2,180000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(31,8,3,210000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(32,8,4,250000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(33,9,1,150000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(34,9,2,150000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(35,9,3,180000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(36,9,4,180000);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(37,10,1,130000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(38,10,2,140000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(39,10,3,220000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(40,10,4,0);


insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(41,11,1,80000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(42,11,2,80000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(43,11,3,80000);
insert into precios (id,id_tipo_reparacion,id_tipo_vehiculo,precio) 
values(44,11,4,80000);


drop table reparacion_descuentos
CREATE TABLE reparacion_descuentos (
	id numeric NOT NULL,
	numero_reparaciones_ultimo_anio varchar NOT NULL,
	id_tipo_vehiculo int4 NOT NULL,
	descuento_porcentaje numeric(20,2) NOT NULL,
	CONSTRAINT reparacion_descuentos_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.reparacion_descuentos_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

select * from reparacion_descuentos r;

delete from reparacion_descuentos;

insert into reparacion_descuentos values(1, '1 – 2', 1, 5);
insert into reparacion_descuentos values(2, '1 – 2', 2, 7);
insert into reparacion_descuentos values(3, '1 – 2', 3, 10);
insert into reparacion_descuentos values(4, '1 – 2', 4, 8);


insert into reparacion_descuentos values(5, '3 – 5', 1, 10);
insert into reparacion_descuentos values(6, '3 – 5', 2, 12);
insert into reparacion_descuentos values(7, '3 – 5', 3, 15);
insert into reparacion_descuentos values(8, '3 – 5', 4, 13);

insert into reparacion_descuentos values(9, '6 – 9', 1, 15);
insert into reparacion_descuentos values(10, '6 – 9', 2, 17);
insert into reparacion_descuentos values(11, '6 – 9', 3, 20);
insert into reparacion_descuentos values(12, '6 – 9', 4, 18);

insert into reparacion_descuentos values(13, '10 – Mas', 1, 20);
insert into reparacion_descuentos values(14, '10 – Mas', 2, 22);
insert into reparacion_descuentos values(15, '10 – Mas', 3, 25);
insert into reparacion_descuentos values(16, '10 – Mas', 4, 23);



CREATE TABLE descuentos_por_bonos (
	id numeric NOT NULL,
	marca varchar NOT NULL,
	numero_bono numeric NOT NULL,
	dinero_bono numeric(20,2) NOT NULL,
	CONSTRAINT descuentos_por_bonos_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.descuentos_por_bonos_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;


select * from descuentos_por_bonos;


insert into descuentos_por_bonos values(1, 'Toyota', 5 , 70000);
insert into descuentos_por_bonos values(2, 'Ford', 2 , 50000);
insert into descuentos_por_bonos values(3, 'Hyundai', 1 , 30000);
insert into descuentos_por_bonos values(4, 'Honda', 7 , 40000);

drop table recargo_kilometraje;
CREATE TABLE recargo_kilometraje (
	id numeric NOT NULL,
	intervalo varchar NOT NULL,
	id_modelo numeric NOT NULL,
	descuento_porcentaje numeric(20,2) NOT NULL,
	CONSTRAINT recargo_kilometraje_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.recargo_kilometraje_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

 delete from recargo_kilometraje;

insert into recargo_kilometraje values(1, '0 – 5000', 1, 0);
insert into recargo_kilometraje values(2, '0 – 5000', 2, 0);
insert into recargo_kilometraje values(3, '0 – 5000', 3, 0);
insert into recargo_kilometraje values(4, '0 – 5000', 4, 0);
insert into recargo_kilometraje values(5, '0 – 5000', 5, 0);

insert into recargo_kilometraje values(6, '5001 – 12000', 1, 3);
insert into recargo_kilometraje values(7, '5001 – 12000', 2, 3);
insert into recargo_kilometraje values(8, '5001 – 12000', 3, 5);
insert into recargo_kilometraje values(9, '5001 – 12000', 4, 5);
insert into recargo_kilometraje values(10, '5001 – 12000', 5, 5);

insert into recargo_kilometraje values(11, '12001 – 25000', 1, 7);
insert into recargo_kilometraje values(12, '12001 – 25000', 2, 7);
insert into recargo_kilometraje values(13, '12001 – 25000', 3, 9);
insert into recargo_kilometraje values(14, '12001 – 25000', 4, 9);
insert into recargo_kilometraje values(15, '12001 – 25000', 5, 9);


insert into recargo_kilometraje values(16, '25001 – 40000', 1, 12);
insert into recargo_kilometraje values(17, '25001 – 40000', 2, 12);
insert into recargo_kilometraje values(18, '25001 – 40000', 3, 12);
insert into recargo_kilometraje values(19, '25001 – 40000', 4, 12);
insert into recargo_kilometraje values(20, '25001 – 40000', 5, 12);


insert into recargo_kilometraje values(21, '40001 – mas', 1, 20);
insert into recargo_kilometraje values(22, '40001 – mas', 2, 20);
insert into recargo_kilometraje values(23, '40001 – mas', 3, 20);
insert into recargo_kilometraje values(24, '40001 – mas', 4, 20);
insert into recargo_kilometraje values(25, '40001 – mas', 5, 20);



CREATE TABLE recargo_antiguedad (
	id numeric NOT NULL,
	intervalo_anios varchar NOT NULL,
	id_modelo numeric NOT NULL,
	descuento_porcentaje numeric(20,2) NOT NULL,
	CONSTRAINT recargo_antiguedad_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.recargo_antiguedad_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;


select * from recargo_antiguedad r;

insert into recargo_antiguedad values(1, '0 – 5', 1, 0);
insert into recargo_antiguedad values(2, '0 – 5', 2, 0);
insert into recargo_antiguedad values(3, '0 – 5', 3, 0);
insert into recargo_antiguedad values(4, '0 – 5', 4, 0);
insert into recargo_antiguedad values(5, '0 – 5', 5, 0);


insert into recargo_antiguedad values(6, '6 – 10', 1, 5);
insert into recargo_antiguedad values(7, '6 – 10', 2, 5);
insert into recargo_antiguedad values(8, '6 – 10', 3, 7);
insert into recargo_antiguedad values(9, '6 – 10', 4, 7);
insert into recargo_antiguedad values(10, '6 – 10', 5, 7);

insert into recargo_antiguedad values(11, '11 – 15', 1, 9);
insert into recargo_antiguedad values(12, '11 – 15', 2, 9);
insert into recargo_antiguedad values(13, '11 – 15', 3, 11);
insert into recargo_antiguedad values(14, '11 – 15', 4, 11);
insert into recargo_antiguedad values(15, '11 – 15', 5, 11);


insert into recargo_antiguedad values(16, '16 – mas', 1, 15);
insert into recargo_antiguedad values(17, '16 – mas', 2, 15);
insert into recargo_antiguedad values(18, '16 – mas', 3, 20);
insert into recargo_antiguedad values(19, '16 – mas', 4, 20);
insert into recargo_antiguedad values(20, '16 – mas', 5, 20);


--actualizacion 29 jul de 2024

CREATE TABLE modelos (
	id numeric NOT NULL,
	modelos varchar NOT NULL,
	CONSTRAINT modelos_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.modelos_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

insert into modelos values(1,'Sedan');
insert into modelos values(2,'Hatchback');
insert into modelos values(3,'SUV');
insert into modelos values(4,'Pickup');
insert into modelos values(5,'Furgoneta');



ALTER TABLE public.reparacion_detalle ADD id_modelo numeric NULL;
ALTER TABLE public.reparacion_detalle ADD CONSTRAINT reparacion_detalle_fk FOREIGN KEY (id_modelo) REFERENCES public.modelos(id);

--actualizacion 29 jul de 2024

--reporte 1
select tr.tipo, m.modelos, 

(select count(*)  
from reparacion_detalle rda
inner join precios pre on pre.id =  rda.id_precio 
where rda.id_modelo = rd.id_modelo 
and pre.id_tipo_reparacion = p.id_tipo_reparacion
group by rda.id_reparacion) as cantidad,

(select sum(rda.monto_reparacion)  
from reparacion_detalle rda
inner join precios pre on pre.id =  rda.id_precio 
where rda.id_modelo = rd.id_modelo 
and pre.id_tipo_reparacion = p.id_tipo_reparacion
group by rda.id_reparacion) as monto

from reparacion r
inner join reparacion_detalle rd on r.id = rd.id_reparacion 
inner join precios p on rd.id_precio  = p.id 
inner join tipo_reparaciones tr on tr.id  = p.id_tipo_reparacion  
inner join reparacion_incluye ri on tr.id  = ri.id_tipo_reparacion 
inner join modelos m on m.id = rd.id_modelo  
WHERE r.fecha_salida  BETWEEN SYMMETRIC '2023-04-04' AND '2024-05-04'
group by tr.tipo, m.modelos, rd.id_modelo, p.id_tipo_reparacion
--reporte 1



--reporte 2

select tr.tipo, 

(select count(rda.id)  
from reparacion ra
inner join reparacion_detalle rda on ra.id = rda.id_reparacion 
inner join precios pa on rda.id_precio  = pa.id 
inner join tipo_reparaciones tra on tra.id  = pa.id_tipo_reparacion 
WHERE ra.fecha_salida  BETWEEN SYMMETRIC '2024-04-01' AND '2024-04-30'  
and tra.tipo = tr.tipo) as cantidadmes, 

(select sum(rda.monto_reparacion)  
from reparacion ra
inner join reparacion_detalle rda on ra.id = rda.id_reparacion 
inner join precios pa on rda.id_precio  = pa.id 
inner join tipo_reparaciones tra on tra.id  = pa.id_tipo_reparacion 
WHERE ra.fecha_salida  BETWEEN SYMMETRIC '2024-04-01' AND '2024-04-30'  
and tra.tipo = tr.tipo) as cantidadmes 

from reparacion r
inner join reparacion_detalle rd on r.id = rd.id_reparacion 
inner join precios p on rd.id_precio  = p.id 
inner join tipo_reparaciones tr on tr.id  = p.id_tipo_reparacion  
inner join reparacion_incluye ri on tr.id  = ri.id_tipo_reparacion 
WHERE r.fecha_salida  BETWEEN SYMMETRIC '2024-04-01' AND '2024-04-30'
group by tr.tipo, p.id_tipo_reparacion 


--reporte 2

