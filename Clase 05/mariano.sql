DROP DATABASE henry;
CREATE DATABASE henry;

USE henry;

CREATE TABLE carrera (
	idCarrera INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    PRIMARY KEY (idCarrera)
    );

-- Query para ver la estructura de la tabla
DESC carrera;

/* Esto es un comentario
de varias líneas */

CREATE TABLE instructor (
	idInstructor INT NOT NULL AUTO_INCREMENT,
	cedulaIdentidad VARCHAR(30) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	fechaIncorporacion DATE,
	PRIMARY KEY (idInstructor)
);

CREATE TABLE cohorte(
	idCohorte INT NOT NULL AUTO_INCREMENT,
	codigo VARCHAR (30) NOT NULL,
	idCarrera INT NOT NULL,
	idInstructor INT NOT NULL,
	fechaInicio DATE,
	fechaFinalizacion DATE,
	PRIMARY KEY (idCohorte),
	FOREIGN KEY (idCarrera) REFERENCES carrera(idCarrera),
	FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor)
);

CREATE TABLE alumno (
	idAlumno INT NOT NULL AUTO_INCREMENT,
    cedulaIdentidad VARCHAR (30) NOT NULL,
    nombre VARCHAR (40) NOT NULL,
    apellido VARCHAR (40) NOT NULL,
   	fechaNacimiento DATE NOT NULL,
	fechaIngreso DATE,
    idCohorte INT,
    PRIMARY KEY (idAlumno),
    FOREIGN KEY (idCohorte) REFERENCES cohorte(idCohorte)
);



-- Inserción de datos en la tabla "carrera"
INSERT INTO carrera (nombre) VALUES
('Ingeniería de Software'),
('Ingeniería en Informática'),
('Ciencias de la Computación');

-- Inserción de datos en la tabla "instructor"
INSERT INTO instructor (cedulaIdentidad, nombre, apellido, fechaNacimiento, fechaIncorporacion) VALUES
('1234567890', 'Juan', 'Pérez', '1980-05-15', '2010-09-01'),
('9876543210', 'María', 'Gómez', '1975-12-10', '2015-03-20'),
('4567891230', 'Carlos', 'López', '1990-02-25', '2018-06-10');

-- Inserción de datos en la tabla "cohorte"
INSERT INTO cohorte (codigo, idCarrera, idInstructor, fechaInicio, fechaFinalizacion) VALUES
('Cohorte2023A', 1, 1, '2023-01-15', '2023-12-15'),
('Cohorte2023B', 2, 2, '2023-03-01', '2023-11-30'),
('Cohorte2024A', 3, 3, '2024-02-10', '2024-10-31');

-- Inserción de datos en la tabla "alumno"
INSERT INTO alumno (cedulaIdentidad, nombre, apellido, fechaNacimiento, fechaIngreso, idCohorte) VALUES
('1111111111', 'Pedro', 'Ramírez', '2000-08-20', '2023-01-15', 1),
('2222222222', 'Ana', 'Martínez', '2001-03-10', '2023-03-01', 2),
('3333333333', 'Luis', 'García', '2002-05-05', '2024-02-10', 3);






-- Seleccionar un alumno por su ID (cambia el número por el ID deseado)
SELECT * FROM alumno WHERE idAlumno = 1;




