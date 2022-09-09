create database ProyectoProductoMensaje

use ProyectoProductoMensaje

create table tipo_Informacion(
cod_Tipo_Informacion int primary key,
nombre nvarchar(50)
);

create table tipo(
cod_tipo int primary key,
nombre nvarchar(50)
);

create table formato_mensaje(
Cod_formato int primary key,
cod_tipo int references tipo(cod_tipo),
cod_tipo_informacion int references tipo_informacion(cod_tipo_informacion),
nombre nvarchar(50),
remitente nvarchar(50),
asunto nvarchar(50)
);

create table proyecto(
proyecto int primary key,
nombre nvarchar(50)
);

create table producto(
producto int primary key,
descripion nvarchar(50),
);

create table producto_proyecto(
proyecto  int,
producto int,
primary key (proyecto, producto),
foreign key (proyecto) references proyecto(proyecto)
,foreign key (producto) references producto(producto)
);

create table mensaje(
cod_mensaje int primary key,
cod_formato int references formato_mensaje(cod_formato),
proyecto int,
producto int,
foreign key  (proyecto,producto) references Producto_proyecto(proyecto,producto),
);


insert into tipo_Informacion values(1, 'mensaje de bienvenida')
insert into tipo_Informacion values(2, 'mensaje de mora')
insert into tipo_Informacion values(3, 'mensaje de promoción')

insert into tipo values(1, 'mensaje de texto')
insert into tipo values(2, 'mail')
insert into tipo values(3, 'mensaje en el estado de cuenta')

insert into formato_mensaje values(1,1,1,'a','a','a')
insert into formato_mensaje values(2,2,2,'a','a','a')
insert into formato_mensaje values(3,3,3,'a','a','a')

insert into proyecto values(1,'Premia')
insert into proyecto values(2, 'Konmi')
insert into proyecto values(3, 'Yujule')

insert into producto values(1, 'Premia Clásica') 
insert into producto values(2, 'Premia Oro')
insert into producto values(3, 'Premia Platinum')

insert into producto_proyecto values(1,1)
insert into producto_proyecto values(1,2)
insert into producto_proyecto values(1,3)
insert into producto_proyecto values(2,2)
insert into producto_proyecto values(2,3)
insert into producto_proyecto values(3,3)

insert into mensaje values(4,1,2,2)
insert into mensaje values(5,1,1,2)
insert into mensaje values(6,1,1,3)
insert into mensaje values(1,1,1,1)
insert into mensaje values(2,2,2,2)
insert into mensaje values(3,3,3,3)

--------Consulta A
select b.nombre as proyecto,a.descripion as producto  from producto a, proyecto b, producto_proyecto c where
c.producto= a.producto and c.proyecto= b.proyecto and c.proyecto=1

--------Consulta B
select a.nombre as TipoMensaje, d.nombre as proyecto, e.descripion as producto from tipo a, mensaje b, formato_mensaje c, proyecto d, producto e, producto_proyecto f  where
b.cod_formato=b.cod_formato and c.cod_tipo=a.cod_tipo  and b.producto= e.producto and d.proyecto=b.proyecto 
 and f.producto= e.producto and f.proyecto= d.proyecto
 
--------Consulta C
select e.nombre, b.nombre as proyecto ,
case when(select count(*) from producto_proyecto as Pro where pro.proyecto = c.proyecto) = 
(select count(*) from mensaje as men where men.proyecto = c.proyecto and men.cod_formato=d.cod_formato ) then 'TODOS' else a.descripion end as articulo 
from producto a, proyecto b, producto_proyecto c, mensaje d, tipo e, formato_mensaje f where
c.producto= a.producto and c.proyecto= b.proyecto and d.producto=a.producto and d.proyecto= b.proyecto and d.cod_formato=f.Cod_formato and f.cod_tipo= e.cod_tipo 
order by 2


