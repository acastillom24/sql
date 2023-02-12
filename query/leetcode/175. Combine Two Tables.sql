/*
Table: Person
personId es la columna de clave principal para esta tabla.
Esta tabla contiene información sobre el DNI de algunas personas y sus nombres y apellidos.
*/
Create table If Not Exists Person (
personId int, 
firstName varchar(255), 
lastName varchar(255),
primary key (personId));

insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');

/*
Table: Address
addressId es la columna de clave principal para esta tabla.
Cada fila de esta tabla contiene información sobre la ciudad y el estado de una persona con ID = PersonId.
*/
Create table If Not Exists Address (
addressId int, 
personId int, 
city varchar(255), 
state varchar(255),
primary key (addressId));

insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');

/*
Escriba una consulta SQL para informar el nombre, el apellido, la ciudad y el estado de cada persona en la tabla Person. 
Si la dirección de un ID de persona no está presente en la tabla de direcciones, informe nulo en su lugar.

Devuelve la tabla de resultados en cualquier orden.
*/

select
	a.firstName,
    a.lastName,
    b.city,
    b.state
from
	Person a
left join
	Address b
on a.personId = b.personId;

