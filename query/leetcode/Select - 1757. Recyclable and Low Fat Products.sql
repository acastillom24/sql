Create table If Not Exists Products (
product_id int, 
low_fats ENUM('Y', 'N'), 
recyclable ENUM('Y','N'),
primary key (product_id));

insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N');

/*
product_id es la clave principal para esta tabla.
low_fats es un ENUM de tipo ('Y', 'N') donde 'Y' significa que este producto es bajo en grasa y 'N' significa que no lo es.
reciclable es un ENUM de tipos ('Y', 'N') donde 'Y' significa que este producto es reciclable y 'N' significa que no lo es.

Escriba una consulta SQL para encontrar los identificadores de productos que son bajos en grasa y reciclables.
Devuelve la tabla de resultados en cualquier orden.
*/

select product_id from products where low_fats = 'Y' and recyclable = 'Y';