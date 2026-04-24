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
