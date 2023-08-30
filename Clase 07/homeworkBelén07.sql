use henry;

select count(*) from carrera;
-- 1) henry tiene dos carreras

select count(idAlumno) from alumno;
-- 2) henry tiene 180 alumnos

select idcohorte, count(*)from alumno
group by idcohorte;
-- 3) cada cohorte tiene 20 alumnos

-- 4) Confecciona un listado de los alumnos ordenado por los últimos 
-- alumnos que ingresaron, con nombre y apellido en un solo campo.
select concat(nombre, ' ',apellido) as Nombre_Apellido, fechaingreso from alumno
order by fechaingreso desc;

-- 5)¿Cual es el nombre del primer alumno que ingreso a Henry? --Beverly
select nombre, fechaingreso from alumno 
order by fechaingreso asc;

-- 6) En que fecha ingreso? 2019-12-04

-- 7) ¿Cual es el nombre del ultimo alumno que ingreso a Henry? Jason
select nombre, fechaingreso from alumno 
order by fechaingreso desc;

-- 8) La función YEAR le permite extraer el año de un campo date, utilice 
-- esta función y especifique cuantos alumnos ingresarona a Henry por año.
-- 2022:68 alumnos, 2021:72 alumnos, 2020:27 alumnos, 2019: 13 alumnos
select count(*),Year(fechaingreso)from alumno
group by Year(fechaingreso)
order by year(fechaingreso) desc;

-- 9)¿Cuantos alumnos ingresaron por semana a henry?, indique también el año. WEEKOFYEAR()
select WEEKOFYEAR(fechaingreso) as Semana, COUNT(*) as Cantidad_Ingresos, Year(fechaingreso) as Año_Ingreso
from alumno
group by WEEKOFYEAR(fechaingreso), Year(fechaingreso)
order by WEEKOFYEAR(fechaingreso) desc;

-- 10)¿En que años ingresaron más de 20 alumnos?
-- en el año 2020 ingresaron 27 alumnos;
-- en el año 2021 ingresaron 72 alumnos;
-- en el año 2022 ingresaron 68 alumnos;
select count(*) as Cantidad_Ingresos, Year(fechaingreso) as Año_Ingreso
from alumno
group by Year(fechaingreso)
having count(*) > 20;

-- 11) Investigue las funciones TIMESTAMPDIFF() y CURDATE(). 
-- ¿Podría utilizarlas para saber cual es la edad de los instructores?. 
-- ¿Como podrías verificar si la función cálcula años completos? Utiliza DATE_ADD().
select nombre, apellido, TIMESTAMPDIFF(year, fechanacimiento, CURDATE()) AS Edad
from instructor;

SELECT TIMESTAMPDIFF(YEAR, '2020-01-01', '2023-01-01') AS Anios_Diferencia,
       DATE_ADD('2020-01-01', INTERVAL Anios_Diferencia YEAR) AS Fecha_Agregada;

-- 12) La edad de cada alumno.
-- La edad promedio de los alumnos de henry. Rta: 32.46 años
-- La edad promedio de los alumnos de cada cohorte.
select nombre, apellido, TIMESTAMPDIFF(year, fechanacimiento, CURDATE()) AS Edad
from alumno;

select avg(TIMESTAMPDIFF(year, fechanacimiento, CURDATE())) AS Edad
from alumno;

select avg(TIMESTAMPDIFF(year, fechanacimiento, CURDATE())) AS Edad, idcohorte
from alumno
group by idcohorte
order by avg(TIMESTAMPDIFF(year, fechanacimiento, CURDATE())) desc;

select fechanacimiento from alumno;

-- 13) Elabora un listado de los alumnos que superan la edad promedio de Henry.
SELECT nombre, apellido, TIMESTAMPDIFF(year, fechanacimiento, CURDATE()) AS Edad
FROM alumno
WHERE TIMESTAMPDIFF(year, fechanacimiento, CURDATE()) > (SELECT AVG(TIMESTAMPDIFF(year, fechanacimiento, CURDATE())) FROM alumno);