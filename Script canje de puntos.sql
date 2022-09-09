create database CanjePuntos

use CanjePuntos

create table tipo(
cod_tipo int primary key,
tipo nvarchar(50)
);

create table subtipo(
cod_subtipo int primary key,
subtipo nvarchar(50)
);

create table articulo(
cod_articulo int primary key,
nombre nvarchar(50),
cod_tipo int references tipo(cod_tipo),
cod_subtipo int references subtipo(cod_subtipo) 
);

create table sucursal(
cod_sucursal int primary key,
sucursal nvarchar(50),
direccion nvarchar(50),
telefono nvarchar(50)
);

create table Stock(
cod_stock int primary key,
cod_articulo int references articulo(cod_articulo),
cod_sucursal int references sucursal(cod_sucursal),
existencia int 
)

create table promocion(
cod_promocion int primary key,
descripcion nvarchar(100),
fecha_inicio date,
fecha_fin date
)

create table articulo_promocion(
cod_articuloPromocion int primary key,
cod_promocion int references promocion(cod_promocion),
cod_articulo int references articulo(cod_articulo),
precio decimal(18,2),
costoPts int
)
;

create table cliente(
cod_cliente int primary key,
nombres nvarchar(50),
apellidos nvarchar(50),
nit nvarchar(13));

create table canje(
cod_canje int primary key,
cod_articuloPromocion int references articulo_promocion(cod_articuloPromocion),
cod_cliente int references cliente (cod_cliente),
cod_sucursal int references sucursal(cod_sucursal),
observacion nvarchar(50),
fecha date
);
