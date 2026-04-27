# Proyecto BD - Diseno de base de datos

Repositorio dedicado a la parte de diseno del Proyecto 2 de Bases de Datos. El sistema modelado corresponde a una tienda que administra productos, categorias, proveedores, clientes, empleados, ventas y detalle de ventas.

## Diagrama entidad-relacion

El diagrama usa notacion Chen:

- Entidades en rectangulos.
- Atributos en ovalos.
- Relaciones en rombos.
- Cardinalidades `1` y `N` sobre las lineas.

![Diagrama entidad-relacion estilo Chen](assets/diagrama_er_chen.svg)

## Archivos incluidos

```text
ProyectoBD/
  assets/
    diagrama_er_chen.svg        Imagen visible en GitHub
  diagramas/
    diagrama_er_chen.drawio     Archivo editable en diagrams.net
  docs/
    diseno_base_datos.md        Modelo relacional y normalizacion
    checklist_rubrica.md        Evidencia organizada por criterio
  sql/
    00_ejecutar_todo.sql        Ejecuta todos los scripts en orden
    01_ddl.sql                  DDL con PK, FK, NOT NULL y CHECK
    02_datos_prueba.sql         Datos de prueba con 25+ registros por tabla
    03_indices.sql              Indices explicitos con CREATE INDEX
    04_verificacion.sql         Conteos e indices para revision
  README.md
```

## Checklist de la rubrica

| Requisito | Estado | Evidencia |
| --- | --- | --- |
| Diagrama ER con entidades, atributos, relaciones y cardinalidades | Completo | `assets/diagrama_er_chen.svg` y `diagramas/diagrama_er_chen.drawio` |
| Modelo relacional documentado | Completo | `docs/diseno_base_datos.md` |
| Normalizacion hasta 3FN con dependencias funcionales | Completo | `docs/diseno_base_datos.md` |
| DDL con `PRIMARY KEY`, `FOREIGN KEY` y `NOT NULL` | Completo | `sql/01_ddl.sql` |
| Datos de prueba realistas con al menos 25 registros por tabla | Completo | `sql/02_datos_prueba.sql` |
| Indices explicitos con `CREATE INDEX` y justificacion | Completo | `sql/03_indices.sql` y `sql/README.md` |

Tambien se incluye una version mas detallada en `docs/checklist_rubrica.md`.

## Como editar el diagrama

1. Abrir [diagrams.net](https://app.diagrams.net/).
2. Seleccionar `File > Open From > Device`.
3. Cargar `diagramas/diagrama_er_chen.drawio`.
4. Editar o exportar como PNG/PDF si se necesita para una presentacion.

## Entidades principales

- `Cliente`: persona que realiza compras.
- `Empleado`: persona que atiende ventas.
- `Venta`: encabezado de una compra.
- `Detalle_venta`: productos incluidos en una venta.
- `Producto`: articulo vendido por la tienda.
- `Categoria`: clasificacion de productos.
- `Proveedor`: empresa o persona que suministra productos.

## Relaciones principales

- Un cliente realiza muchas ventas.
- Un empleado atiende muchas ventas.
- Una venta incluye muchos detalles de venta.
- Cada detalle corresponde a un producto.
- Una categoria agrupa muchos productos.
- Un proveedor suministra muchos productos.

## Scripts SQL

Los scripts estan preparados para PostgreSQL y pueden ejecutarse todos juntos:

```bash
psql -U proy2 -d tienda_db -f sql/00_ejecutar_todo.sql
```

Tambien pueden ejecutarse uno por uno:

```bash
psql -U proy2 -d tienda_db -f sql/01_ddl.sql
psql -U proy2 -d tienda_db -f sql/02_datos_prueba.sql
psql -U proy2 -d tienda_db -f sql/03_indices.sql
psql -U proy2 -d tienda_db -f sql/04_verificacion.sql
```
