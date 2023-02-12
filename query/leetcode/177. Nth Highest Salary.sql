/*
Table: Employee
id es la columna de clave principal para esta tabla.
Cada fila de esta tabla contiene información sobre el salario de un empleado.
*/

Create table If Not Exists Employee (
Id int, 
Salary int,
primary key (id));

insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

/*
Escriba una consulta SQL para informar el enésimo salario más alto de la tabla Empleado. 
Si no hay un enésimo salario más alto, la consulta debe informar nulo.

*/

DELIMITER $$
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
	with
	cte as(select salary, dense_rank() over(order by salary desc) as top_n from employee)
    select ifnull((select salary from cte where top_n = N limit 1), NULL)
  );
END
DELIMITER ;

# Solución personal
select salary
from (
	select dense_rank() over(order by salary desc) as top_n, salary 
	from employee) a
where top_n = 1
limit 1;

# La mejor solución (SET N=N-1;)
select distinct salary
from employee
order by salary desc
limit 1 offset 2;