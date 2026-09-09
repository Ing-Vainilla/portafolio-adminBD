CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(100) NOT NULL
);

CREATE TABLE Libros (
    id_libro INT PRIMARY KEY,
    titulo_libro VARCHAR(150) NOT NULL,
    autor_libro VARCHAR(100) NOT NULL
);

CREATE TABLE Prestamos (
    id_prestamo INT PRIMARY KEY,
    fecha_prestamo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT NULL,
    id_libro INT NULL,
    CONSTRAINT fk_prestamos_usuario FOREIGN KEY (id_usuario) 
        REFERENCES Usuarios(id_usuario) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    CONSTRAINT fk_prestamos_libro FOREIGN KEY (id_libro) 
        REFERENCES Libros(id_libro) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

INSERT INTO Usuarios (id_usuario, nombre_usuario, email_usuario) VALUES
(1, 'Larissa', 'larissa@gmail.com'),
(2, 'Mafer', 'mafer@gmail.com'),
(3, 'Rodin', 'rodin@gmail.com');

INSERT INTO Libros (id_libro, titulo_libro, autor_libro) VALUES
(0, 'Katabasis', 'F. Kuang'),
(1, 'Don Quijote de la Mancha', 'Miguel de Cervantes'),
(2, 'Cien años de soledad', 'Gabriel García Márquez');

INSERT INTO Prestamos (id_prestamo, fecha_prestamo) VALUES
(0, '2026-01-01 00:00:00'),
(1, '2026-02-28 00:00:00'),
(2, '2026-03-14 00:00:00');




SELECT * FROM Libros;

SELECT nombre_usuario, email_usuario FROM Usuarios;

SELECT * FROM Libros WHERE titulo_libro = 'Katabasis';

SELECT * FROM Libros ORDER BY titulo_libro ASC;

SELECT COUNT(*) FROM Usuarios;

SELECT * FROM Libros LIMIT 2;

SELECT 
    titulo_libro AS Titulo, 
    autor_libro AS Escritor 
FROM Libros;

SELECT * FROM Prestamos 
WHERE fecha_prestamo >= '2026-02-01';