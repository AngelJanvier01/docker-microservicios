# Docker Microservicios

<!-- [TODO] agregar descripción --> 

## Estructura del proyecto

Este repositorio contiene los siguientes directorios y archivos:

```bash
    ├── cliente                              # componente GUI que funciona como cliente
    ├── gestor-de-clientes                   # microservicio gestor de clientes
    ├── docs                                 # carpeta de documentación
    │  ├── context-view.png                  # vista del contexto del sistema
    │  ├── global-assurance.drawio           # archivo editable de daiagramas del sistema 
    ├── notificador                          # microservicio notificador 
    ├── pagos                                # microservicio pagos
    ├── reporteador                          # microservicio reporteador
    ├── simulador                            # componente que simula los pagos realizados
    ├── tyk                                  # archivos compartidos con el gateway
    │  ├── apps                              # definición de APIs en el gateway
    │  |  ├── keyless-gestor-clientes.json   # definición de microservicio API
    │  |  ├── keyless-notificador.json       # definición de microservicio Notifier
    │  |  ├── keyless-pagos.json             # definición de microservicio Payment
    │  |  ├── keyless-reporteador.json       # definición de microservicio Reporter
    │  ├── tyk.standalone.conf               # archivo de configuración de tyk
    ├── .gitignore                           # exclusiones de git
    ├── docker-compose.yml                   # definición de contenedores para ambiente docker
    ├── README.md                            # este archivo
```

## Instalación

Descarga el código del repositorio utilizando el siguiente comando:

`git clone https://gitlab.com/tareas-arquitectura-de-software-curso/microservicios/docker-microservicios.git`

Ingresa a la carpeta del proyecto:

`cd docker-microservicios`

Descarga el código fuente de los microservicios y componentes del sistema:

`git submodule update --init --recursive`

## Configuración

Antes de arrancar el sistema deberás realizar las siguientes modificaciones en los archivos de configuración. 

> identifica la IP de tu máquina y reemplazala por el valor actual.

### Gestor de clientes

Para este microservicio no hay que realizar alguna configuración

### Cliente

Para este microservicio no hay que realizar alguna configuración

### Notificador

Accede al archivo `notificador/settings.ini` y actualiza las variables `TOKEN` y `CHAT_ID`:

```bash
TOKEN = <TELEGRAM_TOKEN>
CHAT_ID = <TELEGRAM_CHAT_ID>
```

> puedes consultar el siguiente [enlace](https://medium.com/@goyoregalado/bots-de-telegram-en-python-134b964fcdf7) 
> para conocer más acerca del `TOKEN` y `CHAT_ID` de telegram.

### Pagos

Para este microservicio no hay que realizar alguna configuración

### payment-validator-ms

Este microservicio en Go lee `payment_records.json` y envía una notificación por Telegram
cuando detecta un pago con estado `PAID`. Reemplaza `YOUR_TELEGRAM_BOT_TOKEN` en
`payment-validator-ms/telegram/notifier.go` antes de ejecutarlo.

### Reporteador

Para este microservicio no hay que realizar alguna configuración

### Gateway

Para este componente no hay que realizar alguna configuración

## Ejecución

Para ejecutar el sistema utiliza el siguiente comando:

`docker-compose up -d`

Para detener el sistema utiliza el siguiente comando:

`docker-compose down`

> al ejecutar el sistema se creará una carpeta `volume` donde se guardará la información que se genere en el sistema
> si deseas reiniciar los datos basta con eliminar dicha carpeta

## Preguntas Frecuentes

### ¿Necesito instalar Docker?

Por supuesto, la herramienta Docker es vital para la ejecución de este sistema. Para conocer más acerca de Docker puedes visitar el siguiente [enlace](https://medium.com/@javiervivanco/que-es-docker-79d506f7b2fc).

> Para realizar la instalación de Docker en Windows puedes consultar el siguiente [enlace](https://medium.com/@tushar0618/installing-docker-desktop-on-window-10-501e594fc5eb)


> Para realizar la instalación de Docker en Linux puedes consultar el siguiente [enlace](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-es)

## Versión

3.0.0 - Febrero 2022

## Autores

- Perla Velasco
- Yonathan Martinez
- Jorge Solis