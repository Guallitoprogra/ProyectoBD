INSERT INTO categorias (nombre, descripcion)
SELECT 'Categoria ' || n, 'Linea de productos numero ' || n
FROM generate_series(1, 25) AS n;

INSERT INTO proveedores (nombre, telefono, email, ciudad)
SELECT
    'Proveedor ' || n,
    '5555-' || LPAD(n::text, 4, '0'),
    'proveedor' || n || '@tienda.test',
    CASE WHEN n % 4 = 0 THEN 'Guatemala'
         WHEN n % 4 = 1 THEN 'Mixco'
         WHEN n % 4 = 2 THEN 'Villa Nueva'
         ELSE 'Antigua Guatemala' END
FROM generate_series(1, 25) AS n;

INSERT INTO clientes (nombre, nit, telefono, email)
SELECT
    'Cliente ' || n,
    'CF-' || LPAD(n::text, 5, '0'),
    '4000-' || LPAD(n::text, 4, '0'),
    'cliente' || n || '@correo.test'
FROM generate_series(1, 25) AS n;

INSERT INTO empleados (nombre, puesto, fecha_contratacion)
SELECT
    'Empleado ' || n,
    CASE WHEN n % 3 = 0 THEN 'Cajero'
         WHEN n % 3 = 1 THEN 'Vendedor'
         ELSE 'Supervisor' END,
    DATE '2025-01-01' + (n * INTERVAL '7 days')
FROM generate_series(1, 25) AS n;

INSERT INTO productos (id_categoria, id_proveedor, nombre, sku, precio, costo, stock, activo)
SELECT
    ((n - 1) % 25) + 1,
    ((n - 1) % 25) + 1,
    CASE WHEN n % 5 = 0 THEN 'Audifonos modelo ' || n
         WHEN n % 5 = 1 THEN 'Teclado mecanico ' || n
         WHEN n % 5 = 2 THEN 'Mouse inalambrico ' || n
         WHEN n % 5 = 3 THEN 'Monitor LED ' || n
         ELSE 'Memoria USB ' || n END,
    'SKU-' || LPAD(n::text, 4, '0'),
    (35 + n * 4.75)::NUMERIC(10,2),
    (20 + n * 2.30)::NUMERIC(10,2),
    30 + (n % 20),
    TRUE
FROM generate_series(1, 30) AS n;

INSERT INTO ventas (id_cliente, id_empleado, fecha, total, estado)
SELECT
    ((n - 1) % 25) + 1,
    ((n + 4) % 25) + 1,
    TIMESTAMP '2026-03-01 09:00:00' + (n * INTERVAL '1 day'),
    0,
    'PAGADA'
FROM generate_series(1, 25) AS n;

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT
    v.id_venta,
    ((v.id_venta + x.n - 2) % 30) + 1 AS id_producto,
    x.n AS cantidad,
    p.precio,
    x.n * p.precio
FROM ventas v
CROSS JOIN generate_series(1, 3) AS x(n)
JOIN productos p ON p.id_producto = ((v.id_venta + x.n - 2) % 30) + 1;

UPDATE ventas v
SET total = resumen.total
FROM (
    SELECT id_venta, SUM(subtotal) AS total
    FROM detalle_venta
    GROUP BY id_venta
) resumen
WHERE resumen.id_venta = v.id_venta;

UPDATE productos p
SET stock = stock - vendido.unidades
FROM (
    SELECT id_producto, SUM(cantidad) AS unidades
    FROM detalle_venta
    GROUP BY id_producto
) vendido
WHERE vendido.id_producto = p.id_producto;
