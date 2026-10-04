# Estado de recuperación — PrivilegeFans v32.10-RC7

Última versión validada: **v32.10-RC7 — SOPORTE**

Frontend SHA-256:
`1771cabdadd7cbfb1f2614c99215b42548fcace4b8c8d3fc821bc6fb68458a8a`

ONECLICK SHA-256:
`e46b0743d267249ebe83179dd4178bd3255e8d2975a27c59552876972ea529b0`

## Diagnóstico confirmado

```text
PRIVILEGEFANS v32.10-RC7 - SOPORTE
SHA=OK
APP_JS_NODE_CHECK=OK
SOPORTE_RESPONSIVE=OK
AVATAR_1_1=OK
OPERACIONES_DEMO=IDENTIFICADAS
ENDPOINTS_NUEVOS=NINGUNO
BACKEND=NO_MODIFICADO
NEXO_CONTROL=NO_MODIFICADO
DESPLIEGUE=NINGUNO
RESULTADO=OK
```

## Contratos conservados en incrementos recientes

### Suscripciones
- `GET /v1/billing/subscriptions?limit=50`
- `POST /v1/billing/checkout`

### Directos
- `/v1/live/now`
- `/v1/live/streams`

### Monedero / Diamantes
- `/v1/diamonds`
- `/v1/diamonds/ledger?limit=50`
- `/v1/diamonds/redeem`
- `/v1/wallet`
- `/v1/wallet/payout-method`
- `/v1/wallet/payouts`
- `/v1/wallet/payouts?limit=20`
- `/v1/wallet/transactions?limit=50`

### Tienda / Subastas
- `/v1/shop/products`
- `/v1/shop/orders`
- `/v1/shop/auctions`
- `/v1/billing/checkout`

### Reals
- `/v1/reals/discover?limit=20`
- `/v1/reals/feature`
- `/v1/reals/feature/`
- `/v1/reals/feature/mine`
- `/v1/reals/ranking?limit=10`
- `/v1/reals/rates`

### Soporte
- `/v1/notifications/ws-ticket`
- `POST /v1/contact` fue verificado en una revisión anterior y debe reconfirmarse contra el backend exacto cuando se recupere.

No añadir endpoints nuevos sin verificar antes backend/auditoría.
