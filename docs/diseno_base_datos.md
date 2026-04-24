# Diseño de base de datos

## Modelo relacional

- CATEGORIAS(id_categoria PK, nombre, descripcion)
- PROVEEDORES(id_proveedor PK, nombre, telefono, email, ciudad)
- CLIENTES(id_cliente PK, nombre, nit, telefono, email)
- EMPLEADOS(id_empleado PK, nombre, puesto, fecha_contratacion)
- PRODUCTOS(id_producto PK, id_categoria FK, id_proveedor FK, nombre, sku, precio, costo, stock, activo)
- VENTAS(id_venta PK, id_cliente FK, id_empleado FK, fecha, total, estado)
- DETALLE_VENTA(id_detalle PK, id_venta FK, id_producto FK, cantidad, precio_unitario, subtotal)

## Cardinalidades

- CLIENTES 1:N VENTAS
- EMPLEADOS 1:N VENTAS
- VENTAS 1:N DETALLE_VENTA
- PRODUCTOS 1:N DETALLE_VENTA
- CATEGORIAS 1:N PRODUCTOS
- PROVEEDORES 1:N PRODUCTOS

## Normalizacion hasta 3FN

### Primera forma normal

Los atributos son atomicos. Una venta con varios productos no guarda una lista dentro de una columna; se representa con varias filas en `DETALLE_VENTA`.

### Segunda forma normal

Cada atributo depende de la llave primaria de su tabla. Por ejemplo, el precio unitario y la cantidad dependen del detalle de venta especifico.

### Tercera forma normal

No se duplican datos que dependen de otra entidad. El nombre del cliente no se guarda dentro de `VENTAS`; se obtiene usando `id_cliente`. Lo mismo ocurre con categorias, proveedores y empleados.

## Dependencias funcionales principales

- id_categoria -> nombre, descripcion
- id_proveedor -> nombre, telefono, email, ciudad
- id_cliente -> nombre, nit, telefono, email
- id_empleado -> nombre, puesto, fecha_contratacion
- id_producto -> id_categoria, id_proveedor, nombre, sku, precio, costo, stock, activo
- id_venta -> id_cliente, id_empleado, fecha, total, estado
- id_detalle -> id_venta, id_producto, cantidad, precio_unitario, subtotal

## DDL

El archivo `sql/01_ddl.sql` contiene la definicion completa de tablas. Incluye:

- `PRIMARY KEY` en todas las entidades.
- `FOREIGN KEY` para representar las relaciones del diagrama.
- `NOT NULL` en los campos obligatorios.
- `UNIQUE` para datos que no deben repetirse, como SKU, NIT y email.
- `CHECK` para validar precios, costos, cantidades, stock y totales.

## Datos de prueba

El archivo `sql/02_datos_prueba.sql` incluye datos realistas para probar el modelo:

- 25 categorias.
- 25 proveedores.
- 25 clientes.
- 25 empleados.
- 30 productos.
- 25 ventas.
- 75 detalles de venta.

Con esto se cumple el requisito de tener al menos 25 registros por tabla.

## Indices

El archivo `sql/03_indices.sql` define indices explicitos:

- `idx_productos_nombre` sobre `productos(nombre)`.
- `idx_ventas_fecha` sobre `ventas(fecha)`.
- `idx_detalle_producto` sobre `detalle_venta(id_producto)`.

Estos indices se justifican porque ayudan en busquedas de inventario y reportes de ventas.
