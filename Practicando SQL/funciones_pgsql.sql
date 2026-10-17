SELECT 'HOLA MUNDO '||'BIENVENIDO';
SELECT upper('hola mundo');
SELECT lower('HOLA MUNDO');
SELECT left('HOLA MUNDO', 4);
SELECT right('HOLA MUNDO', 5);

SELECT 'BIENVENIDOS AL CURSO ' || 'Posgre SQL de Básico a Avanzado';

-- substr() : nos sirve para poder extraer una cadena de letras desde una posición inicial
-- y la longitud de la cadena a partir de esa posición.
SELECT substr('BIENVENIDOS AL CURSO',3,5);

-- lpad() : nos permite crear número con ceros adelante y rellenar espacios.
SELECT lpad('7552',8,'0');
SELECT lpad('POSGRE SQL',15,'*');

-- concat() : Nos permite concatenas cadenas de texto
SELECT CONCAT('Hola Mundo,', ' este es el curso de Posgre SQL');

-- overlay() : nos permite insertar y reemplazar una cadena de texto
-- sintaxis: OVERLAY(string PLACING string FROM int for int)
SELECT OVERLAY('Hola Mundo' PLACING 'Andy' FROM 6 for 10);

-- POSITION() : Nos brinda la posición de una subcadena en una cadena principal
-- sintaxis : POSITION(substring IN string)
SELECT POSITION('do' IN 'Hola Mundo');







