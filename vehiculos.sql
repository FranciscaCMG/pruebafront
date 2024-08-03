
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



CREATE TABLE tipos (
	id numeric NOT NULL,
	tipo varchar NOT NULL,
	CONSTRAINT tipos_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.tipo_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;


insert into tipos values(1,'gasolina');
insert into tipos values(2,'diésel');
insert into tipos values(3,'híbrido');
insert into tipos values(4,'eléctrico');

CREATE TABLE marcas (
	id numeric NOT NULL,
	marca varchar NOT NULL,
	CONSTRAINT marcas_pk PRIMARY KEY (id)
);

CREATE SEQUENCE public.marcas_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;

insert into marcas values(1,'Toyota');
insert into marcas values(2,'Kia');
insert into marcas values(3,'Honda');
insert into marcas values(4,'Ford');
insert into marcas values(5,'Chevrolet');
insert into marcas values(6,'Hyundai');


CREATE TABLE vehiculo (
	id numeric NOT NULL,
	n_patente varchar NOT NULL,
	id_marca numeric NOT NULL,
	id_modelo numeric NOT NULL,
	id_tipo_auto numeric NOT null,
	anio_fabricacion varchar NULL,
	n_asientos int NOT null,
	kilometraje int NOT NULL,
	CONSTRAINT vehiculo_pk PRIMARY KEY (id)
);

ALTER TABLE public.vehiculo 
ADD CONSTRAINT id_marca_fk 
FOREIGN KEY (id_marca) REFERENCES public.tipos(id);

ALTER TABLE public.vehiculo 
ADD CONSTRAINT id_modelo_fk 
FOREIGN KEY (id_modelo) REFERENCES public.modelos(id);

ALTER TABLE public.vehiculo 
ADD CONSTRAINT id_tipo_auto_fk 
FOREIGN KEY (id_tipo_auto) REFERENCES public.tipos(id);

CREATE SEQUENCE public.vehiculo_sequence
AS SMALLINT
INCREMENT 1
MAXVALUE 2000
START 1;
insert into vehiculo 
values(1, 'p8084', 1, 2, 3, 2020, 4, 3455);

insert into vehiculo 
values(2, 'p8045', 3, 4, 2, 2020, 4, 345534);

select * from vehiculo v 
inner join marcas m on m.id = v.id_marca 
inner join modelos o on o.id = v.id_modelo 
inner join tipos t on t.id = v.id_tipo_auto 