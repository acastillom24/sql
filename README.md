## SQL

Guía desarrollada a partir de los libros: 
- [Oracle PL SQL Best Practices, 2nd Edition](https://www.amazon.com/_/dp/0596514107?tag=oreilly20-20).
- [Oracle PL_SQL Language Pocket Reference, 5th Edition](https://www.amazon.com/_/dp/1491920009?tag=oreilly20-20).

### Crear un nuevo usuario
- Ingresamos con el usuario root
```batch
mysql -u root -p
```
- Creamos un nuevo usuario
```batch
CREATE USER '{USER_NAME}'@'%' IDENTIFIED WITH mysql_native_password BY '{PASSWORD}';
```
- Asignamos privilegios
```batch
GRANT ALL PRIVILEGES ON *.* TO '{USER_NAME}'@'%';
```
- Validamos los privilegios
```batch
FLUSH PRIVILEGES;
```
### Instalar Esquema HR en Oracle 19C

- Ubicación del path del esquema HR
```batch
C:\{FOLDER}\demo\schema\human_resources
```
- Ingresar a SQLPLUS con el usuario sysdba
```batch
sqlplus / as sysdba
show user;
```
- Procedemos con la instalación del esquema HR
```batch
star ?/demo/schema/human_resources/hr_main.sql
```
Configuraciones adicionales:

    specify password for HR as parameter 1: 1234
    specify default tablespeace for HR as parameter 2: USERS
    specify temporary tablespace for HR as parameter 3: TEMP
    specify log path as parameter 4: $ORACLE_HOME/demo/schema/log

- En caso de error: ORA-20000: Schema "HR" does not exist or insufficient privileges
```batch
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
```
Luego repetimos todo el proceso anterior.

- Info from:  
[Codingraph](https://www.youtube.com/watch?v=HD7URcecBOk)  
[tbl HR](srikanthtechnologies.com/oracle/hrtables.gif)