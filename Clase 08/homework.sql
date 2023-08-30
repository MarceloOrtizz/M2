CREATE DATABASE OfertaGastronomica;

/* 2 - Crear una tabla con los siguientes campos: id_local, nombre, categoria, direccion, barrio, comuna, 
para posteriormente poblarla con los datos bajados, utilzando el conector desde el script de Python.
3 - A partir de tener los datos disponibles, responder a las siguientes preguntas: 
a) ¿Cuál es el barrio con mayor cantidad de Pubs? 
b) Obtener la cantidad de locales por categoría 
c) Obtener la cantidad de restaurantes por comuna*/

use OfertaGastronomica;

CREATE Table Locales (
    id_local int not NULL AUTO_INCREMENT,
    nombre VARCHAR (50),
    categoria VARCHAR (50),
    direccion VARCHAR (50),
    barrio VARCHAR (50),
    comuna VARCHAR (50),
    PRIMARY KEY (id_local)
    );

SELECT * from locales;


-- a) ¿Cuál es el barrio con mayor cantidad de Pubs? 

select count(*), barrio, categoria from locales
WHERE categoria = 'pub'
GROUP BY barrio 
order BY COUNT(*) DESC
;
select count(*) from locales
WHERE CATEGORIA = 'PUB'
-- RECOLETA 

-- b) Obtener la cantidad de locales por categoría 

SELECT COUNT(*), categoria from locales
GROUP BY categoria
ORDER BY count(*) desc
;

select DISTINCT categoria from locales;

-- c) Obtener la cantidad de restaurantes por comuna

SELECT COUNT(*), comuna from locales
where categoria = 'restaurante'
group by comuna
ORDER BY count(*) desc
;






