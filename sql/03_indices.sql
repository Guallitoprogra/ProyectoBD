CREATE INDEX idx_productos_nombre
ON productos(nombre);

CREATE INDEX idx_ventas_fecha
ON ventas(fecha);

CREATE INDEX idx_detalle_producto
ON detalle_venta(id_producto);
