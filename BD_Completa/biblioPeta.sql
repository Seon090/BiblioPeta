/* Crear BD */

CREATE DATABASE biblioPeta;
USE biblioPeta;

/* Crear Tablas Socio - Ejemplar - Prestamo - Reserva  - Bibliotecario - Sancion */

CREATE TABLE Socio (
    idSocio INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    num_carnet VARCHAR(20),
    fecha_alta DATE,
    tieneSancion BOOLEAN DEFAULT FALSE
);



CREATE TABLE Ejemplar (
    idEjemplar INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    editorial VARCHAR(100),
    anioPublicacion INT,
    categoria VARCHAR(50),
    copiasTotales INT,
    copiasDisponibles INT
);

CREATE TABLE Bibliotecario (
    idBibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(9),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(100),
    turno VARCHAR(20)
);


CREATE TABLE Prestamo (
    idPrestamo INT AUTO_INCREMENT PRIMARY KEY,
    idSocio INT,
    idEjemplar INT,
    idBibliotecario INT,
    fechaPrestamo DATE,
    fechaDevolucionPrevista DATE,
    fechaDevolucionReal DATE,
    diasRetraso INT,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (idEjemplar) REFERENCES Ejemplar(idEjemplar),
    FOREIGN KEY (idBibliotecario) REFERENCES Bibliotecario(idBibliotecario)
);


CREATE TABLE Reserva (
    idReserva INT AUTO_INCREMENT PRIMARY KEY,
    idSocio INT,
    idEjemplar INT,
    fechaReserva DATE,
    posicionCola INT,
    activa BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (idEjemplar) REFERENCES Ejemplar(idEjemplar)
);





CREATE TABLE Sancion (
    idSancion INT AUTO_INCREMENT PRIMARY KEY,
    idSocio INT,
    importe DOUBLE,
    pagado BOOLEAN DEFAULT FALSE,
    fecha DATE,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio)
);

/* Insertar datos */

/* Socio */
INSERT INTO Socio (dni, nombre, apellido1, apellido2, direccion, telefono, email, num_carnet, fecha_alta)
VALUES ('12345678A', 'Juan', 'Pérez', 'García', 'Calle Falsa 123', '600123123', 'juan@example.com', 'C001', '2024-01-01');

/* Ejemplar */
INSERT INTO Ejemplar (isbn, titulo, autor, editorial, anioPublicacion, categoria, copiasTotales, copiasDisponibles)
VALUES ('9788499890944', 'El Quijote', 'Miguel de Cervantes', 'Anaya', 2015, 'Novela', 10, 10);

/* Bibliotecario */
INSERT INTO Bibliotecario (dni, nombre, apellido1, apellido2, telefono, email, turno)
VALUES ('11223344B', 'María', 'López', 'Sánchez', '611222333', 'maria@example.com', 'Mañana');

/* Prestamo */
INSERT INTO Prestamo (idSocio, idEjemplar, idBibliotecario, fechaPrestamo, fechaDevolucionPrevista)
VALUES (1, 1, 1, '2024-02-01', '2024-02-15');

/* Reserva */
INSERT INTO Reserva (idSocio, idEjemplar, fechaReserva, posicionCola)
VALUES (1, 1, '2024-03-01', 1);

/* Sancion */
INSERT INTO Sancion (idSocio, importe, pagado, fecha)
VALUES (1, 5.50, FALSE, '2024-03-10');



/* Crear User */


CREATE USER 'usuario'@'%' IDENTIFIED BY '1234';
GRANT SELECT ON biblioPeta.* TO 'usuario'@'%';
FLUSH PRIVILEGES;

