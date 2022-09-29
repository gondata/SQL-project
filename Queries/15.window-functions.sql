-- Window Functions

--Colegiatura promedio por carrera
SELECT  *,
		AVG(colegiatura) OVER(PARTITION BY carrera_id)
FROM platzi.alumnos;

--Colegiatura promedio de toda la tabla (no especificamos nada en OVER())
SELECT  *,
		AVG(colegiatura) OVER()
FROM platzi.alumnos;

--Suma agregada acumulativa de colegiatura, ordenadas de menor a mayor
SELECT  *,
		SUM(colegiatura) OVER(ORDER BY colegiatura)
FROM platzi.alumnos;

--Suma de todas las colegiaturas
SELECT  *,
		SUM(colegiatura) OVER()
FROM platzi.alumnos;

--Suma agregada acumulativa de colegiatura, por carrera_id y ordenado de menor a mayor
SELECT  *,
		SUM(colegiatura) OVER(PARTITION BY carrera_id ORDER BY colegiatura)
FROM platzi.alumnos;

--Rank de colegiatura mas cara. Varias puede ocupar el mismo puesto y dejan gaps entre valores.
SELECT  *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC)
FROM platzi.alumnos;

--Idem anterior pero ordeno primero por carrera y luego por brand_rank
SELECT  *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM platzi.alumnos
ORDER BY carrera_id, brand_rank;

--Si queremos usar un WHERE, hay que usar una subquery
SELECT  *
FROM (
		SELECT *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
		FROM platzi.alumnos
) AS ranked_colegiaturas_por_carrera
WHERE brand_rank < 3
ORDER BY brand_rank;
