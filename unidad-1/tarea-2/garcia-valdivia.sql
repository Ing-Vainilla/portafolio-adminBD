CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY,
  rut_dni VARCHAR(20) UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  correo VARCHAR(100)
);

CREATE TABLE Mascota (
  id_mascota INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especie VARCHAR(50) NOT NULL,
  raza VARCHAR(50),
  fecha_nac DATE,
  id_cliente INT,
  CONSTRAINT fk_mascota_cliente 
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Veterinario (
  id_veterinario INT,
  rut_dni VARCHAR(20) UNIQUE NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(100),
  telefono VARCHAR(20),
  PRIMARY KEY (id_veterinario, rut_dni)
);

CREATE TABLE Consulta (
  id_consulta INT PRIMARY KEY,
  fecha_hora DATETIME NOT NULL,
  diagnostico TEXT,
  costo DECIMAL(10, 2) NOT NULL,
  id_mascota INT,
  id_veterinario INT,
  id_cliente INT,
  CONSTRAINT fk_consulta_mascota 
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
  CONSTRAINT fk_consulta_veterinario 
    FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario),
  CONSTRAINT fk_consulta_cliente 
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Medicamento (
  id_medicamento INT PRIMARY KEY,
  codigo INT UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  laboratorio VARCHAR(100),
  precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Prescripcion (
  id_prescripcion INT PRIMARY KEY,
  id_consulta INT,
  id_medicamento INT,
  cantidad INT NOT NULL,
  indicaciones VARCHAR(255) NOT NULL,
  CONSTRAINT fk_prescripcion_consulta 
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta),
  CONSTRAINT fk_prescripcion_medicamento 
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);



INSERT INTO Cliente (id_cliente, rut_dni, nombre, telefono, correo) VALUES
  (1, '12345678-9', 'Carlos Mendoza', '+56911223344', 'carlos.mendoza@email.com'),
  (2, '98765432-1', 'Ana Morales', '+56988776655', 'ana.morales@email.com'),
  (3, '11223344-5', 'Sofía Valenzuela', '+56955443322', 'sofia.v@email.com'),
  (4, '13445566-7', 'Diego Paredes', '+56944332211', 'diego.paredes@email.com'),
  (5, '15667788-9', 'Camila Soto', '+56977889900', 'camila.soto@email.com');


INSERT INTO Mascota (id_mascota, nombre, especie, raza, fecha_nac, id_cliente) VALUES
  (1, 'Milo', 'Canino', 'Golden Retriever', '2021-05-10', 1),
  (2, 'Luna', 'Felino', 'Siamés', '2022-08-15', 1),
  (3, 'Rocky', 'Canino', 'Bulldog Francés', '2023-01-20', 2),
  (4, 'Pelusa', 'Conejo', 'Cabeza de León', '2023-11-02', 3),
  (5, 'Thor', 'Canino', 'Pastor Alemán', '2020-03-12', 4);


INSERT INTO Veterinario (id_veterinario, rut_dni, nombre, especialidad, telefono) VALUES
  (1, '15678901-2', 'Dr. Roberto Gómez', 'Medicina General y Cirugía', '+56922334455'),
  (2, '17890123-4', 'Dra. Patricia Reyes', 'Dermatología Veterinaria', '+56966778899'),
  (3, '16789012-3', 'Dr. Felipe Navarro', 'Oftalmología', '+56933445566'),
  (4, '18901234-5', 'Dra. Marcela Silva', 'Cardiología', '+56977881122'),
  (5, '19012345-6', 'Dr. Andrés Castro', 'Traumatología y Ortopedia', '+56999887766');


INSERT INTO Medicamento (id_medicamento, codigo, nombre, laboratorio, precio) VALUES
  (1, 1001, 'Amoxicilina 500mg', 'Zoetis', 12.50),
  (2, 1002, 'Meloxicam Gotas 10ml', 'Bayer Animal Health', 18.00),
  (3, 1003, 'Apoquel 16mg', 'Zoetis', 45.00),
  (4, 1004, 'Bravecto 10-20kg', 'MSD Salud Animal', 32.00),
  (5, 1005, 'Omeprazol 10mg', 'Drag Pharma', 9.50);


INSERT INTO Consulta (id_consulta, fecha_hora, diagnostico, costo, id_mascota, id_veterinario, id_cliente) VALUES
  (1, '2026-03-01 10:30:00', 'Gastroenteritis leve por ingesta indebida', 35.00, 1, 1, 1),
  (2, '2026-03-02 11:15:00', 'Dermatitis alérgica por picadura de pulgas', 40.00, 3, 2, 2),
  (3, '2026-03-05 16:00:00', 'Control general y vacunación anual', 25.00, 2, 1, 1),
  (4, '2026-03-06 09:00:00', 'Revisión dental y limpieza de incisivos', 30.00, 4, 3, 3),
  (5, '2026-03-07 14:30:00', 'Cojera en pata trasera izquierda por esguince', 50.00, 5, 5, 4);


INSERT INTO Prescripcion (id_prescripcion, id_consulta, id_medicamento, cantidad, indicaciones) VALUES
  (1, 1, 1, 10, '1 pastilla cada 12 horas por 5 días vía oral'),
  (2, 1, 2, 1, '5 gotas cada 24 horas por 3 días junto con comida'),
  (3, 2, 3, 20, '1 tableta diaria en ayunas durante 14 días'),
  (4, 2, 4, 1, '1 comprimido masticable dosis única'),
  (5, 5, 2, 1, '10 gotas cada 24 horas por 5 días tras alimento');