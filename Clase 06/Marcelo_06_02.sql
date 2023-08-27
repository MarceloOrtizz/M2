use henry;

-- 2.	No se sabe con certeza el lanzamiento de las cohortes N° 1245 y N° 1246, se solicita que las elimine de la tabla.
delete from cohorte 
where idCohorte=1245 or idCohorte=1246;

INSERT INTO cohorte 
VALUES (1245,'FT-1245',1,2,'2022-5-2',null),
(1246,'DS-1246',2,7,'2022-7-4',null);

delete from cohorte where idCohorte in (1245,1246);
select * from cohorte; 

-- 3.	Se ha decidido retrasar el comienzo de la cohorte N°1243, por lo que la nueva fecha de inicio será el 16/05. Se le solicita modificar la fecha de inicio de esos alumnos.<br>
update cohorte set fechaInicio='2023-5-16' where idCohorte=1243;

-- 4.	El alumno N° 165 solicito el cambio de su Apellido por “Ramirez”. <br>
update alumno set apellido='Ramirez' where idAlumno=165;
select * from alumno where idAlumno=165;

-- 5.	El área de Learning le solicita un listado de alumnos de la Cohorte N°1243 que incluya la fecha de ingreso.<br>
select nombre Nombre, apellido Apellido, fechaIngreso Ingreso, idCohorte Cohorte from alumno where idCohorte=1243;

-- 6.	Como parte de un programa de actualización, el área de People le solicita 
-- un listado de los instructores que dictan la carrera de Full Stack Developer.
select distinct i.nombre Nombre, i.apellido Apellido, c.nombre Carrera from instructor i
join cohorte co on i.idInstructor=co.idInstructor
join carrera c on co.idCarrera=c.idCarrera
where c.nombre='Full Stack Developer';

select distinct co.idInstructor from cohorte co;

-- 7. Se desea saber que alumnos formaron parte de la cohorte N° 1235. Elabore un listado.
select * from alumno where idCohorte=1235;

-- 8. Del listado anterior se desea saber quienes ingresaron en el año 2019.<br>
select * from alumno where idCohorte=1235 and year(fechaIngreso)=2019;

-- 9. La siguiente consulta permite acceder a datos de otras tablas y devolver un listado con la carrera a la cual pertenece cada alumno:
/*
SELECT alumnos.nombre, apellido, fechaNacimiento, carreras.nombre
FROM alumnos
INNER JOIN cohortes
ON cohorte=idCohorte
INNER JOIN carreras
ON carrera = idCarrera
*/

select a.nombre, a.apellido, a.fechaNacimiento, c.nombre
from alumno a
join cohorte co on a.idCohorte=co.idCohorte
join carrera c on co.idCarrera=c.idCarrera;

-- Conteste la siguientes interrogantes: 
-- a. ¿Que campos permiten que se puedan acceder al nombre de la carrera? 
-- En la tabla 'carrera' el campo 'nombre'

-- b. ¿Que tipo de ralación existe entre la tabla cohortes y alumnos? 
-- uno a muchos (al mismo idCohorte le corresponden muchos idAlumno)

-- c. ¿Proponga dos opciones para filtrar el listado solo por los alumnos que pertenecen a 'Full Stack Developer',
--  utilizando LIKE y NOT LIKE?, ¿Cual de las dos opciones es la manera correcta de hacerlo?, ¿Por que? 
-- LIKE es mejor, porque estoy buscando algo que coincida, de lo contrario tendria que poner algo que tengan
-- en comun todos los que no coincidan con lo buscado.
select a.nombre, a.apellido, a.fechaNacimiento, c.nombre from alumno a
join cohorte co on a.idCohorte=co.idCohorte
join carrera c on co.idCarrera=c.idCarrera
where c.nombre like ('%Full%');

select a.nombre, a.apellido, a.fechaNacimiento, c.nombre from alumno a
join cohorte co on a.idCohorte=co.idCohorte
join carrera c on co.idCarrera=c.idCarrera
where c.nombre not like ('%Data%');

select * from carrera;

-- d. ¿Proponga dos opciones para filtrar el listado solo por los alumnos que pertenecen a 'Full Stack Developer', 
-- utilizando " = " y " != "? ¿Cual de las dos opciones es la manera correcta de hacerlo?, ¿Por que? 
-- similar al anterior, es mejor usar "=" para buscar exactamente algo.
select a.nombre, a.apellido, a.fechaNacimiento, c.nombre from alumno a
join cohorte co on a.idCohorte=co.idCohorte
join carrera c on co.idCarrera=c.idCarrera
where c.nombre='Full Stack Developer';

select a.nombre, a.apellido, a.fechaNacimiento, c.nombre from alumno a
join cohorte co on a.idCohorte=co.idCohorte
join carrera c on co.idCarrera=c.idCarrera
where c.nombre!='Data Science';

-- e. ¿Como emplearía el filtrado utilizando el campo idCarrera?
select a.nombre, a.apellido, a.fechaNacimiento, c.nombre from alumno a
join cohorte co on a.idCohorte=co.idCohorte
join carrera c on co.idCarrera=c.idCarrera
where c.idCarrera=1;

