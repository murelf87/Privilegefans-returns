# PrivilegeFans v32.10-RC8 — Cabecera + responsive global

Incremento seguro sobre v32.10-RC7. No añade endpoints, no modifica backend y no despliega.

- Cabecera consolidada en una capa RC8 separada y reversible.
- Logotipo oficial con ancho propio; buscador y navegación dejan de competir por el mismo espacio.
- Chat, Notificaciones y Diamantes mantienen espacios independientes.
- Rol/cuenta quedan separados del menú principal en escritorio.
- Avatar de cuenta 1:1, circular y con `object-fit: cover`; el avatar de escritorio se sincroniza con el perfil real mostrado en móvil.
- Entre 721 y 1000 px se recuperan acciones de cabecera y Chat.
- En móvil, Chat continúa en la navegación inferior y la búsqueda pasa a mostrarse de forma visible al activarla.
- Se mantiene el diseño aprobado y no se introducen endpoints nuevos.

Backend, NEXO Control y producción no se modifican.
