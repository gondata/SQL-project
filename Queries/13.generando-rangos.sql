-- Generando rangos

--Generando serie del 1 al 4
SELECT *
FROM generate_series(1, 4);

--Generando serie del 5 al 1 con un paso de -2
SELECT *
FROM generate_series(5, 1, -2);

--Generando serie del 1.1 al 4 con un paso del 1.3
SELECT *
FROM generate_series(1.1, 4, 1.3);

--Sumamos dias a la fecha actual. Generamos serie del 0 al 14 con paso de 7. 's(a)' es tabla 's' columna 'a'
SELECT current_date + s.a AS dates
FROM generate_series(0, 14, 7) AS s(a);

--Serie entre esas fechas, con un paso de 10 horas.
SELECT *
FROM generate_series('2020-09-01 00:00:00'::timestamp,
					'2020-09-04 12:00:00', '10 hours');
					
--INNER JOIN con una serie generada del 0 al 10 ordenado por carrera_id
SELECT  a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a
FROM platzi.alumnos AS a
	INNER JOIN generate_series(0, 10) AS s(a)
	ON s.a = a.carrera_id
ORDER BY a.carrera_id;

--Ejercicio: generar triangulo con generate_series

--Forma 1
SELECT lpad('*', a, '*')
FROM generate_series(1, 10) as a;

--Forma 2. Ordinality nos agrega un indice adicional en orden.
SELECT lpad('*', CAST(ordinality AS int), '*')
FROM generate_series(10, 2, -2) WITH ordinality;
		