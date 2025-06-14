# payment-validator-ms

Este microservicio escrito en Go lee un archivo `payment_records.json` que contiene los pagos de los clientes y envía una notificación por Telegram cuando un pago ha sido validado. También envía la póliza correspondiente al cliente.

## Uso

1. Reemplaza `YOUR_TELEGRAM_BOT_TOKEN` en `telegram/notifier.go` por el token real de tu bot.
2. Compila y ejecuta el microservicio:

```bash
go get -d
go build -o payment-validator-ms
./payment-validator-ms
```

En un entorno Docker, el contenedor expondrá el puerto `8004`.
