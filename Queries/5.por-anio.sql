-- Seleccionando los alumnos incorporados en cierto año

-- con EXTRACT
SELECT * 
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2019;

-- Con DATE_PART
SELECT * 
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

-- Con subquery
SELECT *
FROM (
    SELECT *,
      DATE_PART('YEAR', fecha_incorporacion) AS anho_incorporacion
    FROM platzi.alumnos
) AS alumnos_con_anho
WHERE anho_incorporacion = 2019;

-- Ejercicio: seleccionar alumnos incorporados en mayo del 2018

SELECT *
FROM (
    SELECT *,
      DATE_PART('YEAR', fecha_incorporacion) AS anho_incorporacion,
      DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion
    FROM platzi.alumnos
  ) AS alumnos_con_anho
WHERE anho_incorporacion = 2018
  AND mes_incorporacion = 5;