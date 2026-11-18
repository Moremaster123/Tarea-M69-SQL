USE AdventureWorks2022;
GO

-- 1. Crear la tabla Ventas en el esquema dbo
CREATE TABLE dbo.Ventas (
    NumeroOrden INT NOT NULL PRIMARY KEY,
    FechaOrden DATETIME NOT NULL,
    FechaEntrega DATE NULL,
    EstatusOrden VARCHAR(20) NOT NULL,
    NombreCliente NVARCHAR(100) NOT NULL,
    DomicilioEntrega NVARCHAR(200) NOT NULL,
    CompraOnline CHAR(1) NOT NULL,
    MetodoPago VARCHAR(30) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    Observaciones NVARCHAR(500) NULL
);
GO

-- 2. Insertar ordenes de ejemplo
INSERT INTO dbo.Ventas (NumeroOrden, FechaOrden, FechaEntrega, EstatusOrden, NombreCliente, DomicilioEntrega, CompraOnline, MetodoPago, Subtotal, Observaciones)
VALUES
    (12345, '2022-08-05 18:58:46.867', '2022-08-15', 'Pendiente', N'Juan Pérez', N'Avenida Siempre Viva 742 Springfield', 'S', 'Tarjeta de Crédito', 20565.62, N'El cliente indica que solo puede recibir el envío entre semana.'),
    (12346, '2022-08-06 10:15:20.000', '2022-08-12', 'Completada', N'María López', N'Calle Reforma 120 Ciudad de México', 'N', 'Efectivo', 1520.00, NULL),
    (12347, '2022-08-07 14:30:05.500', '2022-08-17', 'Cancelada', N'Carlos Ramírez', N'Av. Juárez 45 Guadalajara', 'S', 'Tarjeta de Débito', 8750.40, N'El cliente canceló por demora en el pago.'),
    (12348, '2022-08-08 09:45:00.000', '2022-08-18', 'En Proceso', N'Ana Torres', N'Calle Hidalgo 300 Monterrey', 'S', 'Tarjeta de Crédito', 3299.99, N'Entregar en recepción del edificio.'),
    (12349, '2022-08-09 17:20:33.120', '2022-08-19', 'Cancelada', N'Luis Hernández', N'Blvd. Kukulcán 15 Cancún', 'N', 'Efectivo', 450.75, NULL),
    (12350, '2022-08-10 12:05:10.000', '2022-08-20', 'Completada', N'Sofía Martínez', N'Calle Morelos 88 Puebla', 'S', 'Tarjeta de Débito', 12340.00, N'Llamar antes de entregar.');
GO

SELECT * FROM dbo.Ventas;
GO

-- 3. Cambiar el nombre de la tabla de Ventas a Ordenes
EXEC sp_rename 'dbo.Ventas', 'Ordenes';
GO

SELECT * FROM dbo.Ordenes;
GO

-- 4. Agregar la columna FechaEnvio
ALTER TABLE dbo.Ordenes
ADD FechaEnvio DATETIME NULL DEFAULT GETDATE() WITH VALUES;
GO

SELECT NumeroOrden, FechaOrden, FechaEnvio FROM dbo.Ordenes;
GO

-- 5. Cambiar el nombre de la columna CompraOnline a BanderaCompraOnline
EXEC sp_rename 'dbo.Ordenes.CompraOnline', 'BanderaCompraOnline', 'COLUMN';
GO

SELECT NumeroOrden, NombreCliente, BanderaCompraOnline FROM dbo.Ordenes;
GO

-- 6. Crear la tabla Prueba con una columna e insertar 5 registros
CREATE TABLE dbo.Prueba (
    Valor INT
);
GO

INSERT INTO dbo.Prueba (Valor)
VALUES (ABS(CHECKSUM(NEWID())) % 1000),
       (ABS(CHECKSUM(NEWID())) % 1000),
       (ABS(CHECKSUM(NEWID())) % 1000),
       (ABS(CHECKSUM(NEWID())) % 1000),
       (ABS(CHECKSUM(NEWID())) % 1000);
GO

SELECT * FROM dbo.Prueba;
GO

-- 7. UPDATE sobre la tabla Prueba
UPDATE dbo.Prueba
SET Valor = Valor + 1000;
GO

SELECT * FROM dbo.Prueba;
GO

-- 8. TRUNCATE y DROP TABLE sobre la tabla Prueba
TRUNCATE TABLE dbo.Prueba;
GO

SELECT * FROM dbo.Prueba;
GO

DROP TABLE dbo.Prueba;
GO

SELECT name FROM sys.tables WHERE name = 'Prueba';
GO

-- 9. DELETE de las ordenes canceladas
DELETE FROM dbo.Ordenes
WHERE EstatusOrden = 'Cancelada';
GO

SELECT * FROM dbo.Ordenes;
GO
