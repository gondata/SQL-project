--Particiones y Agregacion

--Ordenamos por fecha_incorporacion, y el row_id queda ordenado
SELECT ROW_NUMBER() OVER(ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

--Primer valor de una serie de datos, en este caso colegiatura. Lo coloca en la primera columna
SELECT FIRST_VALUE(colegiatura) OVER() AS row_id, *
FROM platzi.alumnos;

--Primer valor de un grupo, particionada por carrera_id
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS primera_colegiatura, *
FROM platzi.alumnos;

--Ultimo valor de un grupo, particionada por carrera_id
SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS ultima_colegiatura, *
FROM platzi.alumnos;

--Valor que quieras de un grupo, particionada por carrera_id
SELECT NTH_VALUE(colegiatura, 3) OVER(PARTITION BY carrera_id) AS tercer_colegiatura, *
FROM platzi.alumnos;

--Ranking por carrera_id, ordenado por colegiatura descendente. Todo ordenado por carrera_id y luego por colegiatura_rank. RANK nos deja gaps
SELECT  *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

--Ranking igual al anterior sin dejar gaps
SELECT  *,
		DENSE_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

--Igual que RANK() pero en porcentaje
SELECT  *,
		PERCENT_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;
