CREATE TABLE ciudad (
	id_ciudad serial PRIMARY KEY,
	ciudad VARCHAR (55)  NOT NULL
);


CREATE TABLE ubicacion(
   
   id_ubicacion serial PRIMARY KEY,
   ubicacion VARCHAR (62) NOT NULL,
   fk_ciudad INT,
   CONSTRAINT fk_ciduad_reference
      FOREIGN KEY(fk_ciudad) 
	  REFERENCES ciudad(id_ciudad)

);

CREATE TABLE empresas(
  id_empresas serial PRIMARY KEY,
  nombre_empresa VARCHAR(50) NOT NULL,
  fk_ubicacion INT,
  CONSTRAINT fk_ubicacion_reference
    FOREIGN KEY(fk_ubicacion)
  REFERENCES ubicacion(id_ubicacion)
);

/* End block empresas , ubicacion , ciudad */

/* Start direcciones and areas */

CREATE TABLE direcciones (
  id_direcciones serial PRIMARY KEY,
  nombre_direccion VARCHAR(55) NOT NULL
);

CREATE TABLE areas(
  id_areas serial PRIMARY KEY,
  nombre_area varchar(50) NOT NULL,
  fk_direcciones INT,
   CONSTRAINT fk_direccion_reference
    FOREIGN KEY(fk_direcciones)
  REFERENCES direcciones(id_direcciones)

);

/* End direcciones and areas */

/* Start puestos*/

CREATE TABLE puestos (
  id_puestos serial PRIMARY KEY,
  nombre_puesto VARCHAR(50) NOT NULL
);
/* End puestos*/

/* Start tipo recursos */

CREATE TABLE tipo_recursos(
  id_tipo_recurso serial PRIMARY KEY,
  tipo_recursos VARCHAR(35) NOT NULL
);
/* End tipo recursos */

/* Start Jerarquia */

CREATE TABLE Jerarquia(
  id_jerarquia serial PRIMARY KEY,
  nombre_jerarquia VARCHAR(45) NOT NULL
);

/* End jerarquia */


/* Start usuarios , domicilio , telefono , email , contraseña , fechas*/


CREATE TABLE usuario(
  idUsuario serial PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  primerApellido(45) NOT NULL,
  segundoApellido(45) NOT NULL,
  fecha_nacimiento DATE,
  FotoPerfil VARCHAR(50) ,
);


CREATE TABLE email(
  id_email serial PRIMARY KEY,
  email VARCHAR(45),
  fk_email_usuario INT,
  CONSTRAINT (fk_email_reference)
   FOREIGN KEY (fk_email_usuario)
  REFERENCES usuario(idUsuario)

);

CREATE TABLE password(
  id_password serial PRIMARY KEY,
  password VARCHAR(64),
  fk_email INT,
  CONSTRAINT fk_password_reference
    FOREIGN KEY(fk_email)
  REFERENCES email(id_email),


);

CREATE TABLE recursos_humanos(
  id_rh serial PRIMARY KEY,
  id_empleado VARCHAR(25),
  no_empleado varchar(25),
  fk_recursos_recursos_humanos INT,
  CONSTRAINT fk_recursos_reference
    FOREIGN KEY(fk_recursos_recursos_humanos)
  REFERENCES recursos(id_recursos)
);