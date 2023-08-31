use henry;
select * from cohorte;
select * from carrera;
select * from alumno;

-- 1 
SELECT count(*) FROM carrera;

-- 2
select count(*) from alumno;

-- 3
select idCohorte, count(*) from alumno
group by idCohorte;

select count(*) from alumno
where idcohorte = 1238;

-- 4 Confecciona un listado de los alumnos ordenado por los últimos alumnos que ingresaron, con nombre y apellido en un solo campo.

select concat( nombre,' ' ,apellido) as Nombre ,fechaIngreso from alumno
order by fechaingreso desc;

-- 5 ¿Cual es el nombre del primer alumno que ingreso a Henry?

select apellido,nombre, min(fechaIngreso) from alumno
group by fechaingreso, apellido, nombre
order by fechaIngreso 
limit 1;
-- 6. fecha ingreso

-- 7. ¿Cual es el nombre del ultimo alumno que ingreso a Henry?

select apellido,nombre, min(fechaIngreso) from alumno
group by fechaingreso, apellido, nombre
order by fechaIngreso desc
limit 1;

-- 8. La función YEAR le permite extraer el año de un campo date, utilice esta función y especifique cuantos alumnos ingresarona a Henry por año.

select year(fechaingreso), count(*) from alumno
group by year(fechaingreso);

-- 9. ¿Cuantos alumnos ingresaron por semana a henry?, indique también el año. WEEKOFYEAR()

select year(fechaingreso), weekofyear(fechaingreso), count(*) from alumno
group by weekofyear(fechaingreso),year(fechaingreso) 
order by year(fechaingreso), weekofyear(fechaingreso);

-- 10. ¿En que años ingresaron más de 20 alumnos?

select year(fechaingreso) as f , count(*) as cantidad from alumno
group by year(fechaingreso) 
having cantidad > 20
order by year(fechaingreso) desc;

-- 11. 	Investigue las funciones TIMESTAMPDIFF() y CURDATE(). 
-- 		¿Podría utilizarlas para saber cual es la edad de los instructores?. 
-- 		¿Como podrías verificar si la función cálcula años completos? Utiliza DATE_ADD().

select * from alumno;

select *, TIMESTAMPDIFF(year,fechanacimiento, curdate()) as edad_alumno , curdate()  from alumno;

select *, TIMESTAMPDIFF(year,fechanacimiento, curdate()) as edad_alumno , curdate()  from instructor;

select *, date_add(fechaingreso , interval 3  day) from alumno;

/* 12. Cálcula:<br>
            - La edad de cada alumno.<br>
            - La edad promedio de los alumnos de henry.<br>
            - La edad promedio de los alumnos de cada cohorte.<br> */ 
            

select *, TIMESTAMPDIFF(year,fechanacimiento, curdate()) as edad_alumno , curdate()  from alumno;		
update alumno
set fechanacimiento = '2002-01-02'
where idalumno = 127;

select *, TIMESTAMPDIFF(year,fechanacimiento, curdate()) as edad_alumno , curdate()  from alumno;		

select avg(TIMESTAMPDIFF(year,fechanacimiento, curdate())) as edad_alumno  from alumno;	

	

select sum(TIMESTAMPDIFF(year,fechanacimiento, curdate())) as edad_alumno , curdate()  from alumno;		

select idcohorte, round(avg(TIMESTAMPDIFF(year,fechanacimiento, curdate())),1) as edad_alumno from alumno
group by idCohorte;

-- 13. Elabora un listado de los alumnos que superan la edad promedio de Henry.

select nombre, TIMESTAMPDIFF(year,fechanacimiento, curdate()) as edad_alumno from alumno
where TIMESTAMPDIFF(year,fechanacimiento, curdate()) > 22.55;

select nombre, TIMESTAMPDIFF(year,fechanacimiento, curdate()) as edad_alumno from alumno
where TIMESTAMPDIFF(year,fechanacimiento, curdate()) > (select avg(TIMESTAMPDIFF(year,fechanacimiento, curdate())) as edad_alumno  from alumno);





