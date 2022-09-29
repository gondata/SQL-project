-- Vamos a seleccionar la segunda colegiatura mas alta

--1era forma: Con subquery en el WHERE

SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos AS a2
	WHERE a1.colegiatura <= a2.colegiatura
);

--2nda forma:con LIMIT y OFFSET
SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

-- Seleccionando alumnos con la segunda colegiatura más alta

--1era forma: Con subquery e INNER JOIN
SELECT *
FROM platzi.alumnos AS datos_alumnos
  INNER JOIN (
    SELECT DISTINCT colegiatura
    FROM platzi.alumnos
    WHERE tutor_id = 20
    ORDER BY colegiatura DESC
    LIMIT 1 OFFSET 1
  ) AS segunda_mayor_colegiatura
  ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;
  
--2nda forma: Con subquery en el WHERE
SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
    SELECT DISTINCT colegiatura
    FROM platzi.alumnos
    WHERE tutor_id = 20
    ORDER BY colegiatura DESC
    LIMIT 1 OFFSET 1);
	
-- Seleccionando la segunda mitad de los alumnos
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos 
OFFSET (
    SELECT COUNT(*) / 2
    FROM platzi.alumnos
);