--Sacamos maximo de una tabla. La fecha de incorporacion mas reciente

--1era forma. Con LIMIT, sacas de el maximo de toda la tabla
SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

--2nda forma. Con MAX, podes sacar el maximo agrupado por carrera_id
SELECT carrera_id, 
	MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

--Ejercicio: Sacar el minimo nombre alfabeticamente que existe en la tabla. De toda la tabla y por tutor_id

--1era forma. Minimo nombre de toda la tabla
SELECT nombre
FROM platzi.alumnos
ORDER BY nombre ASC
LIMIT 1;

--2nda forma. Minimo nombre agrupado por tutor_id
SELECT tutor_id, 
	MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;