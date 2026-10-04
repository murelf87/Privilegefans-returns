# PrivilegeFans Returns

Repositorio de recuperación y continuidad de PrivilegeFans.

## Último estado verificable

Última release candidate validada: **v32.10-RC7 — Soporte**.

SHA-256 esperado del frontend maestro RC7:

`1771cabdadd7cbfb1f2614c99215b42548fcace4b8c8d3fc821bc6fb68458a8a`

SHA-256 del paquete ONECLICK RC7:

`e46b0743d267249ebe83179dd4178bd3255e8d2975a27c59552876972ea529b0`

Resultado validado:

- SHA=OK
- APP_JS_NODE_CHECK=OK
- SOPORTE_RESPONSIVE=OK
- AVATAR_1_1=OK
- OPERACIONES_DEMO=IDENTIFICADAS
- ENDPOINTS_NUEVOS=NINGUNO
- BACKEND=NO_MODIFICADO
- NEXO_CONTROL=NO_MODIFICADO
- DESPLIEGUE=NINGUNO
- RESULTADO=OK

## Estado de recuperación

Los ZIP fuente maestros RC6/RC7 no están disponibles actualmente en la copia local revisada ni en Library. Este repositorio conserva únicamente material recuperado y verificable; no se reconstruye código perdido fingiendo que es idéntico al original.

## Reglas de continuidad

- `TODO JUNTO PRIVILEGEFANS.pdf` manda en funcionalidad, flujos, permisos y comportamientos.
- Mantener el frontend visual aprobado.
- No inventar endpoints.
- No modificar NEXO Control.
- No desplegar automáticamente a producción.
- Mantener botón Volver/Atrás donde el usuario pueda quedar atrapado.
- Revisar cabecera completa, navegación no comprimida, avatar 1:1, responsive y distribución de ancho.

## Próximo incremento previsto

**v32.10-RC8 — Cabecera + Responsive global**, únicamente a partir de una copia fuente íntegra y verificable de RC7 o una recuperación equivalente comprobada.
