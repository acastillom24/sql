CREATE TABLE world (
  name varchar(50) NOT NULL,
  continent varchar(50),
  area MediumInt,
  population BigInt,
  gdp BigInt,
  primary key (name));

insert into world(name, continent, area, population, gdp)
values
('Afghanistan','Asia','652230','25500100','20343000000'),
('Albania','Europe','28748','2831741','12960000000'),
('Algeria','Africa','2381741','37100000','188681000000'),
('Andorra','Europe','468','78115','3712000000'),
('Angola','Africa','1246700','20609294','100990000000');

/*
Un país es grande si:

tiene un área de al menos tres millones (es decir, 3000000 km2), o
tiene una población de al menos veinticinco millones (es decir, 25000000).
Escriba una consulta SQL para informar el nombre, la población y el área de los países grandes.

Devuelve la tabla de resultados en cualquier orden.
*/

select name, population, area from world where area >= 3000000 or population >= 25000000;