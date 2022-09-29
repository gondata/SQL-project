-- SELF JOIN

--Cuando el tutor ID es otro alumno
SELECT  a.nombre,
		a.apellido,
		t.nombre,
		t.apellido
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;
	
--Mismo resultado, con mejor sintaxis
SELECT  CONCAT(a.nombre, ' ', a.apellido) AS alumno,
		CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

--Para saber quien es el tutor que tiene mas alumnos a cargo
SELECT  CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC;

-- Mismo enunciado pero queremos saber el top 10
SELECT  CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10;

--Ejercicio promedio general alumnos por tutor
SELECT AVG(alumnos_por_tutor) AS promedio_alumnos_por_tutor
FROM (
	SELECT  CONCAT(t.nombre, ' ', t.apellido) AS tutor,
			COUNT(*) AS alumnos_por_tutor
	FROM	platzi.alumnos AS a
		INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
	GROUP BY tutor
) AS alumnos_tutor;