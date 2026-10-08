# PrivilegeFans v32.10-RC9-MOBILE — iOS + Android

Incremento móvil sobre RC8. No modifica `app.js`, contratos API ni backend.

## Hecho
- Safe areas, notch/Dynamic Island y barra inferior.
- UI táctil y teclado móvil.
- PWA instalable.
- Proyecto Capacitor 8 preparado para crear iOS y Android desde la misma base web.
- Sin endpoints nuevos.

## Pendiente para binarios de tienda
- ejecutar `npm install` y generar los proyectos nativos iOS/Android;
- confirmar Bundle ID / Package ID definitivo antes de publicar;
- confirmar transporte HTTPS/CORS del backend desde WebView nativa;
- configurar firma Apple/Google y notificaciones push reales cuando se disponga de credenciales/provisión.

No se toca NEXO Control ni producción.
