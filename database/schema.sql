-- name data base
db_matricula

-- creacion de la tabla persona
create table if not exists registro_persona (
	id_registro_persona serial not null,
	rut integer unique not null,
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
	fecha_modificacion timestamp without time zone,
	primary key (id_registro_persona)
);

-- creación de la tabla privilegios
create table if not exists regostro_privilegio (
	id_registro_privilegio serial not null,
	privilegio character varying(50) unique not null,
	descripcion_privilegio character varying(255),
	fecha_registro_privilegio timestamp without time zone default now(),
	fecha_modificacion_privilegio timestamp without time zone,
	primary key (id_registro_privilegio)
);

 -- creación de la tabla estados
 create table if not exists registro_estado (
	id_registro_estado serial not null,
	estado character varying(120) unique not null,
	fecha_registro_estado timestamp without time zone default now(),
	fecha_modificacion_estado timestamp without time zone,
	primary key (id_registro_estado)
);

-- creación de la tabla tipo_funcionario
create table if not exists registro_tipo_funcionario (
	id_registro_tipo_funcionario serial not null,
	tipo_funcionario character varying(120) unique not null,
	fecha_registro_tipo_funcionario timestamp without time zone default now(),
	fecha_modificacion_tipo_funcionario timestamp without time zone,
	primary key (id_registro_tipo_funcionario)
);

-- creación tabla departamentos
create table if not exists registro_departamento (
	id_registro_departamento serial not null,
	departamento character varying(120) unique not null,
	fecha_creacion_departamento timestamp without time zone default now(),
	fecha_modificacion_departamento timestamp without time zone,
	primary key (id_registro_departamento)
);

-- creación tabla funcionarios
create table if not exists registro_funcionario (
	id_registro_funcionario serial not null,
	id_registro_persona integer unique not null,
	id_registro_tipo_funcionario integer not null,
	id_registro_estado integer not null,
	id_registro_departamento integer not null,
	correo_institucional character varying(120) not null,
	fecha_registro_funcionario timestamp without time zone default now(),
	fecha_modificacion_funcionario timestamp without time zone,
	primary key (id_registro_funcionario),
	foreign key (id_registro_persona) references registro_persona(id_registro_persona) match simple on update cascade on delete cascade,
	foreign key (id_registro_tipo_funcionario) references registro_tipo_funcionario(id_registro_tipo_funcionario) match simple on update cascade on delete cascade,
	foreign key (id_registro_estado) references registro_estado(id_registro_estado) match simple on update cascade on delete cascade,
	foreign key (id_registro_departamento) references registro_departamento(id_registro_departamento) match simple on update cascade on delete cascade
);

create index if not exists fk_id_registro_persona on registro_persona(id_registro_persona);
create index if not exists fk_id_registro_tipo_funcionario on registro_tipo_funcionario(id_registro_tipo_funcionario);
create index if not exists fk_id_registro_estado on registro_estado(id_registro_estado);
create index if not exists fk_id_registro_departamento on registro_departamento(id_registro_departamento);
