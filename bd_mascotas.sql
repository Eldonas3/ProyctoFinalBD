-- Script para crear la base de datos
create database FurFamilyFinder;
use FurFamilyFinder;
-- drop database FurFamilyFinder;

create table perfiles(
id_perfil int not null auto_increment,
perfil varchar(30) not null,
descripcion text,
status boolean default true,
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
primary key(id_perfil)
);

create table especie(
id_especie int not null auto_increment,
nombre_especie varchar(100),
primary key(id_especie)
);

-- ------------------------------------
create table cliente(
id_cliente int not null auto_increment,
nombre_cliente varchar(100) not null,
apellido_materno varchar(100) not null,
apellido_paterno varchar(100) not null,
telefono varchar(10) null,
direccion varchar(150),
correo_electronico varchar(100),
edad int not null,
sexo char not null,
foto varchar(200),
perfil int not null,
nombre_usuario varchar(100) not null unique,
contrasena varchar(20),
status bool default true,
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
foreign key(perfil) references perfiles(id_perfil),
primary key(id_cliente)
);

create table empleado(
id_empleado int not null auto_increment,
nombre_empleado varchar(100) not null,
apellido_materno varchar(100) not null,
apellido_paterno varchar(100) not null,
telefono varchar(10),
direccion varchar(150),
correo_electronico varchar(100),
RFC varchar(10),
cuenta_bancaria varchar(18),
edad int,
sexo char,
foto varchar(200),
perfil int not null,
nombre_usuario varchar(100) not null unique,
contrasena varchar(20),
status bool,
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
foreign key(perfil) references perfiles(id_perfil),
primary key(id_empleado)
);

create table raza(
id_raza int not null auto_increment,
especie int not null,
nombre_raza varchar(100),
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
foreign key(especie) references especie(id_especie),
primary key(id_raza)
);

create table cuidado(
id_cuidado int not null auto_increment,
dieta text,
raza int not null,
cuidados text not null,
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
foreign key(raza) references raza(id_raza),
primary key(id_cuidado)
);

create table mascota(
id_mascota int not null auto_increment,
nombre varchar(100),
peso float,
edad int,
sexo char,
descripcion text,
raza int not null,
imagen varchar(200),
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
foreign key(raza) references raza(id_raza),
primary key(id_mascota)
);

create table adopcion(
id_adopcion int not null auto_increment,
cliente int not null,
empleado int not null,
mascota int not null,
fecha_adopcion datetime not null,
status_adopcion bool not null,
created_at datetime null,
updated_at datetime null,
deleted_at datetime null,
foreign key(cliente) references cliente(id_cliente),
foreign key(empleado) references empleado(id_empleado),
foreign key(mascota) references mascota(id_mascota),
primary key(id_adopcion)
);
-- Script para poner informacion
insert into perfiles(perfil,descripcion) values('Dependiente de refugio','Encargado de administrar las adopciones');
insert into perfiles(perfil,descripcion) values('Administrador Web','Admnistra el sitio web');
insert into perfiles(perfil,descripcion) values('Administrador de base de datos','Administra la base de datos de la apliacacion web');
insert into perfiles(perfil,descripcion) values('Cliente','Cliente interesado en adoptar');

insert into especie(nombre_especie) values('Perro');
insert into especie(nombre_especie) values('Gato');
insert into especie(nombre_especie) values('Serpiente');
insert into especie(nombre_especie) values('Pajaro');
insert into especie(nombre_especie) values('Pez');

insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Juan','Perez','Prado','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',25,'M',4,'Juancho','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Lucas','pradera','Anastacio','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',36,'F',4,'Lucario','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Alberto','Aguilar','Martinez','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',18,'M',4,'Beto','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Jose','Cien Fuegos','Hernandez','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',64,'M',4,'pepe','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Mauricio','Arcos','Cruz','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',32,'M',4,'Mau','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Guadalupe','Roque','Roman','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',41,'F',4,'Lupita','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Panfilo','Casimiro','Roma','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',31,'M',4,'Pepe2','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Jose Jose','Buenavista','Arcos','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',90,'M',4,'pepealcuadrado','1234');
insert into cliente(nombre_cliente,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,edad,sexo,perfil,nombre_usuario,contrasena)
values('Gabriel','Alatriste','Audirac','2138527141','Enrique Segoviano #12','correolegitimo@soylegitimo.com',25,'F',4,'Gabi','1234');

insert into empleado(nombre_empleado,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,RFC,cuenta_bancaria,edad,sexo,perfil,nombre_usuario,contrasena,status)
values('Jeronimo','Aguilar','Gutierrez','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','ABC4567890','123456789012345678',35,'M',1,'JerAgu123','secreto',true);
insert into empleado(nombre_empleado,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,RFC,cuenta_bancaria,edad,sexo,perfil,nombre_usuario,contrasena,status)
values('Juan Gabriel','Sanchez','Cordero','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','DEF4567890','123456789012345678',35,'M',1,'Aguacatito','secreto2',true);
insert into empleado(nombre_empleado,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,RFC,cuenta_bancaria,edad,sexo,perfil,nombre_usuario,contrasena,status)
values('Cuahutemoc','Blanco','Arcos','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','POL4567890','123456789012345678',35,'F',1,'Americanista','secreto3',true);
insert into empleado(nombre_empleado,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,RFC,cuenta_bancaria,edad,sexo,perfil,nombre_usuario,contrasena,status)
values('Alberto','Aguilar','Gutierrez','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','LOK4567890','123456789012345678',35,'M',2,'ElYucateco','admin1234',true);
insert into empleado(nombre_empleado,apellido_materno,apellido_paterno,telefono,direccion,correo_electronico,RFC,cuenta_bancaria,edad,sexo,perfil,nombre_usuario,contrasena,status)
values('Luisa','Flores','Torres','1234567890','Enrique Segoviano #12','correolegitimo@soylegitimo.com','ERT4567890','123456789012345678',35,'F',3,'AdminDB','adminDB1234',true);

insert into raza(especie,nombre_raza) values(1,'Pastor Aleman');
insert into raza(especie,nombre_raza) values(1,'Pastor Belga');
insert into raza(especie,nombre_raza) values(1,'San Bernardo');
insert into raza(especie,nombre_raza) values(1,'Pitbull');
insert into raza(especie,nombre_raza) values(2,'Siames');
insert into raza(especie,nombre_raza) values(2,'Egipcio');
insert into raza(especie,nombre_raza) values(2,'Gris');
insert into raza(especie,nombre_raza) values(3,'Python');
insert into raza(especie,nombre_raza) values(3,'Coralillo');
insert into raza(especie,nombre_raza) values(4,'Cacatuha');
insert into raza(especie,nombre_raza) values(4,'Cotorro');
insert into raza(especie,nombre_raza) values(5,'Beta');
insert into raza(especie,nombre_raza) values(5,'Mojarra');

insert into cuidado(dieta,raza,cuidados) values('Croquetas y tortilla',1,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Croquetas y tortilla',2,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Croquetas y tortilla',3,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Croquetas y tortilla',4,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Croquetas y ratones',5,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Croquetas y ratones',6,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Croquetas y ratones',7,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Otros lenguajes de programacion',8,'Un entorno virtual para cada proyecto');
insert into cuidado(dieta,raza,cuidados) values('Ratones',9,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Fruta y semillas',10,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Fruta y semillas',11,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Alimento para peces',12,'Muchos besos y apapachos');
insert into cuidado(dieta,raza,cuidados) values('Alimento para peces',13,'Muchos besos y apapachos');

insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Max',12,3,'M','Perro pastor aleman Bonito',1);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso',12,3,'H','Perro pastor aleman Bonito',1);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso2',12,3,'M','Perro pastor Belga Bonito',2);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso3',12,3,'H','Perro pastor Belga Bonito',2);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso4',12,3,'M','Perro San Bernardo Bonito',3);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso5',12,3,'H','Perro San Bernardo Bonito',3);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso6',12,3,'M','Perro Pitbull Bonito',4);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Milaneso7',12,3,'H','Perro Pitbull Bonito',4);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Bicho1',12,3,'M','Gato Siames Bonito',5);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Bicho2',12,3,'H','Gato Siames Bonito',5);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Bicho3',12,3,'M','Gato Egipcio Bonito',6);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Bicho4',12,3,'H','Gato Egipcio Bonito',6);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Bicho5',12,3,'M','Gato Gris Bonito',7);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Bicho6',12,3,'H','Gato Gris Bonito',7);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Python',12,3,'M','Muy facil de aprender pero necesita que le des librerias constantemente',8);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Python2',12,3,'H','Muy facil de aprender pero necesita que le des librerias constantemente',8);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Piquin',12,3,'M','Se arrastra y es venenosa',9);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('picon',12,3,'H','Se arrastra y es venenosa',9);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('periquin',12,3,'M','De los que vuelan',10);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('periquin2',12,3,'H','De los que vuelan',10);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('periquin3',12,3,'M','De los que vuelan',11);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('periquin3',12,3,'H','De los que vuelan',11);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Betito',12,3,'M','Aguas esos se mueren con agua fría',12);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Betito2',12,3,'H','De los que vuelan',12);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Mojarrin',12,3,'M','Solo pueden ser adoptadas por un veracruzano',13);
insert into mascota(nombre,peso,edad,sexo,descripcion,raza) values('Mojarron',12,3,'H','Solo pueden ser adoptadas por un veracruzano',13);

insert into adopcion(cliente,empleado,mascota,fecha_adopcion,status_adopcion) values(1,1,1,'2023/03/20',true);
insert into adopcion(cliente,empleado,mascota,fecha_adopcion,status_adopcion) values(2,2,3,'2023/03/20',false);
insert into adopcion(cliente,empleado,mascota,fecha_adopcion,status_adopcion) values(3,3,5,'2023/03/20',true);
insert into adopcion(cliente,empleado,mascota,fecha_adopcion,status_adopcion) values(4,1,7,'2023/03/20',false);
insert into adopcion(cliente,empleado,mascota,fecha_adopcion,status_adopcion) values(5,2,1,'2023/03/20',true);
insert into adopcion(cliente,empleado,mascota,fecha_adopcion,status_adopcion) values(6,3,1,'2023/03/20',false);

-- Consultas
select * from perfiles;
select * from especie;
select * from cliente;
select * from empleado;
select * from raza;
select * from cuidado;
select * from mascota;
select * from adopcion;

-- Credenciales de acceso de empleados y clientes
select e.nombre_usuario,e.contrasena,e.correo_electronico,c.nombre_usuario,c.contrasena,c.correo_electronico  
from empleado as e left join perfiles as p
on e.perfil = p.id_perfil left join cliente as c
on p.id_perfil = c.perfil;

-- adopciones en proceso y el empleado encargado
select a.id_adopcion,e.nombre_empleado  from adopcion as a left join empleado as e
on a.empleado = e.id_empleado where a.status_adopcion = 0;

-- adopciones aceptadas, el empleado que la aprobo y el cliente y las mascota de esa adopcion
select a.id_adopcion,e.nombre_empleado,c.nombre_cliente,m.nombre 
from adopcion as a left join empleado as e
on a.empleado = e.id_empleado left join cliente as c
on a.cliente = c.id_cliente left join mascota as m
on a.mascota = m.id_mascota where a.status_adopcion = 1;

-- nombre real de las personas adoptantes
select a.id_adopcion,c.nombre_cliente,c.apellido_materno,c.apellido_paterno from adopcion as a left join cliente as c
on a.cliente = c.id_cliente; 

-- contacto de las personas que no se les ha autorizado su adopcion
select c.nombre_cliente ,c.telefono,c.correo_electronico,a.status_adopcion from adopcion as a left join cliente as c
on a.cliente = c.id_cliente where status_adopcion = 0;

-- vista de Credenciales de acceso de empleados y clientes
CREATE VIEW access_credential AS
SELECT
    e.nombre_usuario AS empleado_nombre_usuario,
    e.contrasena AS empleado_contrasena,
    e.correo_electronico AS empleado_correo,
    c.nombre_usuario AS cliente_nombre_usuario,
    c.contrasena AS cliente_contrasena,
    c.correo_electronico AS cliente_correo
FROM
    empleado AS e
LEFT JOIN
    perfiles AS p ON e.perfil = p.id_perfil
LEFT JOIN
    cliente AS c ON p.id_perfil = c.perfil;


-- vista de adopciones en proceso y el empleado encargado
create view adoptions_in_process as
select a.id_adopcion,e.nombre_empleado  from adopcion as a left join empleado as e
on a.empleado = e.id_empleado where a.status_adopcion = 0;

-- vista de adopciones aceptadas, el empleado que la aprobo y el cliente y las mascota de esa adopcion
create view adoption_acepted as
select a.id_adopcion,e.nombre_empleado,c.nombre_cliente,m.nombre 
from adopcion as a left join empleado as e
on a.empleado = e.id_empleado left join cliente as c
on a.cliente = c.id_cliente left join mascota as m
on a.mascota = m.id_mascota where a.status_adopcion = 1;

-- vista de nombre real de las personas adoptantes
create view real_name as
select a.id_adopcion,c.nombre_cliente,c.apellido_materno,c.apellido_paterno from adopcion as a left join cliente as c
on a.cliente = c.id_cliente;

-- vista de contacto de las personas que no se les ha autorizado su adopcion
create view cliente_contact as
select c.nombre_cliente ,c.telefono,c.correo_electronico,a.status_adopcion from adopcion as a left join cliente as c
on a.cliente = c.id_cliente where status_adopcion = 0;

select * from adoption_acepted;
SELECT * FROM adoptions_in_process;








