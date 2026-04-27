SELECT 'categorias' AS tabla, COUNT(*) AS total_registros FROM categorias
UNION ALL
SELECT 'proveedores', COUNT(*) FROM proveedores
UNION ALL
SELECT 'clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'empleados', COUNT(*) FROM empleados
UNION ALL
SELECT 'productos', COUNT(*) FROM productos
UNION ALL
SELECT 'ventas', COUNT(*) FROM ventas
UNION ALL
SELECT 'detalle_venta', COUNT(*) FROM detalle_venta
ORDER BY tabla;

SELECT
    i.relname AS indice,
    t.relname AS tabla
FROM pg_class t
JOIN pg_index ix ON t.oid = ix.indrelid
JOIN pg_class i ON i.oid = ix.indexrelid
WHERE i.relname IN (
    'idx_productos_nombre',
    'idx_ventas_fecha',
    'idx_detalle_producto'
)
ORDER BY i.relname;
