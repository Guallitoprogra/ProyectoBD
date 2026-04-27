# Scripts SQL

Los scripts estan separados para que cada parte de la rubrica sea facil de revisar.

## Orden de ejecucion

Opcion recomendada:

```bash
psql -U proy2 -d tienda_db -f sql/00_ejecutar_todo.sql
```

Ejecucion manual:

1. `01_ddl.sql`: crea las tablas con `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL` y restricciones `CHECK`.
2. `02_datos_prueba.sql`: inserta datos realistas con minimo 25 registros por tabla.
3. `03_indices.sql`: define indices explicitos con `CREATE INDEX`.
4. `04_verificacion.sql`: muestra conteos por tabla y confirma los indices creados.

## DBMS usado

Los scripts estan escritos para PostgreSQL.

## Justificacion de indices

- `idx_productos_nombre`: acelera busquedas de productos por nombre en catalogos o pantallas de inventario.
- `idx_ventas_fecha`: acelera filtros y reportes ordenados por fecha de venta.
- `idx_detalle_producto`: acelera consultas de productos vendidos y reportes de ventas por producto.

## Registros de prueba esperados

- `categorias`: 25 registros.
- `proveedores`: 25 registros.
- `clientes`: 25 registros.
- `empleados`: 25 registros.
- `productos`: 30 registros.
- `ventas`: 25 registros.
- `detalle_venta`: 75 registros.
