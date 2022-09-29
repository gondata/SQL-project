-- Triangulando

--Que mida 15 caracteres y los rellene por la izquierda
SELECT lpad('sql', 15, '*');

--Que mida la misma cantidad de caracteres que indique el id.
SELECT lpad('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;

--Generando el triangulo
SELECT lpad('*', id, '*')
FROM platzi.alumnos
WHERE id < 100;

--Ordenamos por carrera_id, pero tenemos el problema de que queda desordenado
SELECT lpad('*', id, '*'), carrera_id
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;

--Lo solucionamos de la siguiente manera
SELECT lpad('*', CAST(row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;