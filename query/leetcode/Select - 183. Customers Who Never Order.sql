Create table If Not Exists Customers (
id int, 
name varchar(255),
primary key (id));

Create table If Not Exists Orders (
id int, 
customerId int,
primary key (id),
foreign key (customerId) references customers(id));

insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');
insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

/*
id es la columna de clave principal para esta tabla.
Cada fila de esta tabla indica el ID y el nombre de un cliente.

id es la columna de clave principal para esta tabla.
customerId es una clave foránea del ID de la tabla Clientes.
Cada fila de esta tabla indica el ID de un pedido y el ID del cliente que lo ordenó.

Escriba una consulta SQL para informar a todos los clientes que nunca piden nada.
Devuelve la tabla de resultados en cualquier orden.
*/

select a.name as customers from customers a left join orders b on a.id = b.customerId where customerId is null;
