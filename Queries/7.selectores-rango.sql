--Seleccionamos rangos

--Tutores con id del 1 al 4
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (1, 2, 3, 4);

--Tutores con id entre 1 y 10

--Primera forma
SELECT *
FROM platzi.alumnos
WHERE tutor_id >=1
	AND tutor_id<=10;

--Segunda forma
SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

--Pregunto si 3 se encuentra en el rango de nros enteros entre 10 y 20. Devuelve un booleano
SELECT int4range(10, 20) @> 3;

--Pregunto si hay numeros que se superponen entre estos dos rangos de numeros. Devuelve un booleano
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);

--Valor mas alto
SELECT UPPER(int8range(15, 25));

--Valor mas bajo
SELECT LOWER(int8range(15, 25));

--Buscamos interseccion entre rangos
SELECT int4range(10, 20) * int4range(15, 25);

--Chequeamos si el rango es un rango vacio
SELECT ISEMPTY (numrange(1, 5));

--Preguntamos si tutor id se encuentra en ese rango. Si es asi, se selecciona
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;

--Ejercicio: buscar interseccion entre tutor_id y carrera_id
SELECT numrange(
	(SELECT MIN(tutor_id) FROM platzi.alumnos),
	(SELECT MAX(tutor_id) FROM platzi.alumnos)
) * numrange(
	(SELECT MIN(carrera_id) FROM platzi.alumnos),
	(SELECT MAX(carrera_id) FROM platzi.alumnos)
)