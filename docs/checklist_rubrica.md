# Checklist de rubrica - Diseño de base de datos

| Criterio | Puntos | Estado | Evidencia |
| --- | ---: | --- | --- |
| Diagrama ER correcto: entidades, atributos, relaciones y cardinalidades | 8 | Completo | `assets/diagrama_er_chen.svg`, `diagramas/diagrama_er_chen.drawio` |
| Modelo relacional documentado | 7 | Completo | `docs/diseno_base_datos.md` |
| Normalizacion justificada hasta 3FN | 10 | Completo | `docs/diseno_base_datos.md` |
| DDL completo con `PRIMARY KEY`, `FOREIGN KEY` y `NOT NULL` | 5 | Completo | `sql/01_ddl.sql` |
| Script de datos de prueba realistas con al menos 25 registros por tabla | 5 | Completo | `sql/02_datos_prueba.sql`, `sql/04_verificacion.sql` |
| Indices definidos explicitamente con `CREATE INDEX` en al menos 2 columnas justificadas | 5 | Completo | `sql/03_indices.sql`, `sql/README.md` |

Subtotal cubierto: 40 / 40 puntos posibles en la seccion de diseño.

## Comando sugerido de verificacion

```bash
psql -U proy2 -d tienda_db -f sql/00_ejecutar_todo.sql
```

El script final ejecuta DDL, datos de prueba, indices y consultas de verificacion.
