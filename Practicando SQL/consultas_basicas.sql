---------------------------- Funciones Numéricas y Matemáticas ----------------------------

-- MOD() : Nos brinda el residuo de una division inexacta
SELECT mod(15,4);

-- ROUND() : Realiza el redondeo por defecto si no se especifica los decimales
SELECT ROUND(12.486);
SELECT ROUND(12.786);
SELECT ROUND(11.5648361,2);

-- SQRT() : Nos brinda la raiz cuadrada de un número
-- PI() : Nos brinda el resultado de pi = 3.1415....
SELECT SQRT(49);
SELECT SQRT(12);
SELECT PI();

-- RANDOM() : Nos brinda un resultado aleatorio en cada ejecución
SELECT RANDOM();

-- ABS() : Nos brinda el valor absoluto de un numero
SELECT ABS(-25.54);


-- EJEMPLO PRÁCTICO CON LAS TABLAS YA CREADAS --
SELECT * FROM tb_categorias;

SELECT count(codigo_ca) FROM tb_categorias; -- nos da un valor numerico
SELECT count(*)	FROM tb_categorias; -- otra forma de contar todas las filas


-- SUM() : Suma de todos los valores
SELECT sum(codigo_ca) FROM tb_categorias;

-- MIN() : Valor minimo de una columna o conjunto de datos
-- MAX() : Valor máximo de un conjunto de datos
SELECT MIN(codigo_ca) FROM tb_categorias;
SELECT MAX(codigo_ca) FROM tb_categorias;


---------------------------- Funciones Fecha y Hora ----------------------------
SELECT CURRENT_DATE;  -- FECHA
SELECT CURRENT_TIME;  -- HORA
SELECT CURRENT_TIMESTAMP; -- FECHA Y HORA


-- EXTRACT: Nos extrae un valor especifico de fecha y hora
-- Sintaxis: EXTRACT(valor FROM TIMESTAMP)
SELECT EXTRACT(year FROM CURRENT_DATE);		-- EXTRAE EL AÑO
SELECT EXTRACT(month FROM CURRENT_DATE);	-- EXTRAE EL MES
SELECT EXTRACT(day FROM CURRENT_DATE);		-- EXTRAE EL DÍA

SELECT EXTRACT(hour FROM CURRENT_TIME);		-- EXTRAE LA HORA
SELECT EXTRACT(minute FROM CURRENT_TIME);	-- EXTRAE LOS MINUTOS
SELECT EXTRACT(second FROM CURRENT_TIME);	-- EXTRAE LOS SEGUNDOS
















