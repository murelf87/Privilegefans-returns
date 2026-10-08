# PrivilegeFans iPhone + Android — RC9 MOBILE

La app móvil usa exactamente el frontend web aprobado y lo envuelve con Capacitor. Así se conserva una sola base visual y funcional para web, iPhone y Android.

## Preparación nativa

1. `npm install`
2. `npm run native:init` (solo la primera vez)
3. `npm run ios` para Xcode / `npm run android` para Android Studio

## Backend

El frontend conserva los contratos existentes. En web usa `/api`. Para un binario nativo empaquetado hay que exponer el mismo backend a la WebView mediante CORS/HTTPS o usar un transporte nativo equivalente; no se ha inventado ningún endpoint.

## Incluido en RC9

- safe areas iPhone/Android
- barra superior compatible con notch/Dynamic Island
- navegación inferior estable
- teclado móvil sin tapar acciones
- formularios a 16 px para evitar zoom involuntario en iOS
- drawers/modales a pantalla completa en móvil
- tamaños táctiles mínimos
- soporte de modo PWA/standalone
- detección básica iOS/Android/WebView
- base de botón Atrás de Android cuando el plugin App está disponible

No se ha desplegado a producción.
