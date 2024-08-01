-- name data base
db_matricula

creacion de la tabla persona
create table if not exists registro_persona (
	id_registro_persona serial not null,
	rut integer not null,
	dv_rut character varying(1) not null,
	apellido_paterno character varying(80) not null,
	apellido_materno character varying(80) not null,
	nombres character varying(160) not null,
	fecha_nacimiento date not null,
	direccion character varying(255) not null,
	comuna character varying(60) not null,
	correo character varying(120) not null,
	telefono integer,
	nacionalidad character varying(60) not null,
	sexo character varying(1) not null,
	fecha_registro timestamp without time zone default now(),
	fecha_modificacion timestamp without time zone default now(),
	primary key (id_registro_persona)
)
