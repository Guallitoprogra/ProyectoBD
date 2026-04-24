# Proyecto BD - Diseño de base de datos

Repositorio dedicado a la parte de diseño del Proyecto 2 de Bases de Datos. El sistema modelado corresponde a una tienda que administra productos, categorias, proveedores, clientes, empleados, ventas y detalle de ventas.

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
  README.md
```

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
