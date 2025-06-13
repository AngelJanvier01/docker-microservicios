# Notificador

Microservicio responsable de enviar notificaciones de texto usando un servicio de mensajería

## Estructura del proyecto

Este repositorio contiene los siguientes directorios y archivos:

```bash
    ├── src                          # microservicio notificador
    │  ├── controllers               # lógica del microservicio 
    │  |  ├── __init__.py            # indica la definición de modulo python
    │  |  ├── telegram_controller.py # logica del controlador telegram
    │  ├── helpers                   # funciones auxiliares del microservicio
    │  |  ├── __init__.py            # indica la definición de modulo python
    │  |  ├── config.py              # archivo auxiliar para cargar la configuración
    │  ├── __init__.py               # indica la definición de modulo python
    │  ├── application.py            # definición de rutas del microservicio
    ├── tests                        # definición de pruebas del microservicio
    │  ├── __init__.py               # indica la definición de modulo python
    │  ├── test_telegram.py          # definición de pruebas del controlador telegram
    ├── Dockerfile                   # definición de comandos docker del microservicio 
    ├── main.py                      # archivo principal de ejecución
    ├── .gitignore                   # exclusiones de git
    ├── README.md                    # este archivo
    ├── requirements.txt             # depencias del microservicio
    ├── settings.ini                 # variables de entorno del microservicio
```

## Instalación

Descarga el código del repositorio utilizando el siguiente comando:

`git clone https://gitlab.com/tareas-arquitectura-de-software-curso/microservicios/notificador.git`

accede a la carpeta del microservicio

`cd notificador`

## Configuración

Antes de arrancar el microservicio deberás realizar las siguientes modificaciones. 

### settings.ini

Accede al archivo `settings.ini` y actualiza las variables `TOKEN` y `CHAT_ID`:

```bash
TOKEN = <TELEGRAM_TOKEN>
CHAT_ID = <TELEGRAM_CHAT_ID>
```

> puedes consultar el siguiente [enlace](https://medium.com/@goyoregalado/bots-de-telegram-en-python-134b964fcdf7) 
> para conocer más acerca del `TOKEN` y `CHAT_ID` de telegram.

## Ejecución

Lo primero será crear una imagen del microservicio, para ello utiliza el siguiente comando:

`docker build -t notificador .`

Para ejecutar el sistema utiliza el siguiente comando:

`docker run -d -p 8001:8001 --name notificador notificador`

Para detener el sistema utiliza el siguiente comando:

`docker stop notificador`

## Versión

3.0.0 - Febrero 2022

## Autores

- Perla Velasco
- Yonathan Martinez
- Jorge Solis