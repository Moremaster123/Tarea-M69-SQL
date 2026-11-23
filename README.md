# Tarea M69: crear y modificar tablas en SQL Server

Tarea de SQL Server de la profesión Full Stack Python de EBAC, hecha sobre la base de datos de ejemplo [AdventureWorks2022](https://learn.microsoft.com/es-es/sql/samples/adventureworks-install-configure).

## Tecnologías

- SQL Server (T-SQL)

## Qué hace el script

1. Crea la tabla `dbo.Ventas` con llave primaria y campos obligatorios.
2. Inserta seis órdenes de ejemplo.
3. Cambia el nombre de la tabla a `Ordenes` con `sp_rename`.
4. Agrega la columna `FechaEnvio`.
5. Cambia el nombre de la columna `CompraOnline` a `BanderaCompraOnline`.
6. Crea la tabla `Prueba` e inserta cinco registros.
7. Hace un `UPDATE` sobre `Prueba`.
8. Usa `TRUNCATE` y `DROP TABLE` sobre `Prueba`.
9. Borra las órdenes canceladas con `DELETE`.

## Cómo ejecutarlo

1. Restaura AdventureWorks2022 en SQL Server.
2. Abre el archivo `.sql` en SQL Server Management Studio o en Azure Data Studio.
3. Ejecuta el script completo o cada consulta por separado.

## Autor

Juan Carlos González Herrera · [LinkedIn](https://www.linkedin.com/in/juan-carlos-desarrollador-web) · [Portafolio](https://moremaster123.github.io)
