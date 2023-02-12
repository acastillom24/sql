Create table If Not Exists Customer (
id int, 
name varchar(25), 
referee_id int,
primary key (id));

insert into Customer (id, name, referee_id) values ('1', 'Will', Null);
insert into Customer (id, name, referee_id) values ('2', 'Jane', Null);
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer (id, name, referee_id) values ('4', 'Bill', Null);
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2');

/*
id es la columna de clave principal para esta tabla.
Cada fila de esta tabla indica la identificación de un cliente, su nombre y la identificación del cliente que los refirió.

Escriba una consulta SQL para informar los nombres de los clientes que no son referidos por el cliente con id = 2.
Devuelve la tabla de resultados en cualquier orden.
*/

select name from customer where referee_id is null or referee_id <> 2;
