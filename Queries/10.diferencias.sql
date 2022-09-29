--Resolvemos diferencias

--Vemos que carreras tienen mas personas
SELECT carrera_id, COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;

--Borramos elementos para que aparezcan en un lado y no en el otro
DELETE FROM platzi.carreras
WHERE id BETWEEN 30 and 40;

--Hacemos JOIN entre las dos tablas (Traemos todos los alumnos donde el id de carrera sea nulo, ordenado por carrera_id)
SELECT  a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL
ORDER BY a.carrera_id;

--Ejercicio LEFT JOIN pero sin excluir gente.
SELECT  a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos as a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY a.carrera_id DESC;