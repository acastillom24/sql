/*FUNCIONES EN ORACLE*/

 /**{CONCAT}
* Retorna la unión de dos expresiones de cadena 
*
* @param  x1 expresión de cadena 1
* @param  x2 expresión de cadena 2
* @return       unión de x1 y x2
*/

SELECT
    concat(first_name, last_name)
FROM
    employees;

 /**{SUBSTR}
* Extrae una subcadena de una cadena 
*
* @param  x1 cadena
* @param  x2 inicio de la subcadena
* @param  x3 fin de la subcadena
* @return       devuelve la subcadena
*/

SELECT
    substr(first_name, 1, 3)
FROM
    employees;

 /**{INSTR}
* Busca una subcadena en la cadena 
*
* @param  x1 cadena
* @param  x2 subcadena
* @param  x3 poscisión de inicio en la cadena
* @return       devuelve la posición de inicio de la subcadena
*/

SELECT
    instr(first_name, 'l')
FROM
    employees;

 /**{LENGTH}
* Tamaño de una cadena
*
* @param  x1 cadena
* @return       devuelve el npumero de caracteres de una cadena
*/

SELECT
    length(first_name)
FROM
    employees;

 /**{LOWER}
* Convertir una cadena a minusculas
*
* @param  source_string cadena a ser rellenada
* @return       devuelve la cadena en minusculas
*/

SELECT
    lower(first_name)
FROM
    employees;

 /**{LPAD}
* Rellanar una cadena a la izquierda
*
* @param  source_string cadena a ser rellenada desde la izquierda.
* @param  target_length longitud de la cadena de resultado después del relleno.
* @param  pad_string cadena que se va a rellenar.
* @return       devuelve una cadena con caracteres a la izquierda.
*/

SELECT
    lpad(first_name, 8, '*')
FROM
    employees;
    
/**{RPAD}
* Rellanar una cadena a la derecha
*
* @param  source_string cadena a ser rellenada desde la derecha.
* @param  target_length longitud de la cadena de resultado después del relleno.
* @param  pad_string cadena que se va a rellenar.
* @return       devuelve una cadena con caracteres a la derecha.
*/

SELECT /*csv*/
    rpad(first_name, 8, '*')
FROM
    employees;


