# Simulador

Componente que simula los pagos de la póliza realizados por los clientes asegurados

## Estructura del proyecto

Este repositorio contiene los siguientes directorios y archivos:

```bash
    ├── .gitignore    # omisiones de git
    ├── crontab       # definición de calendarización de la simulación
    ├── Dockerfile    # definición de comandos docker del microservicio 
    ├── job_bank.py   # lógica de la simulación
    ├── README.md     # este archivo
```

## Instalación

Descarga el código del repositorio utilizando el siguiente comando:

`git clone https://gitlab.com/tareas-arquitectura-de-software-curso/microservicios/simulador.git`

accede a la carpeta del microservicio

`cd simulador`

## Ejecución

Lo primero será crear una imagen del microservicio, para ello utiliza el siguiente comando:

`docker build -t simulador .`

Para ejecutar el sistema utiliza el siguiente comando:

`docker run -d -v ./volume/simulador:/data --name simulador simulador`

Para detener el sistema utiliza el siguiente comando:

`docker stop simulador`

## Versión

3.0.0 - Febrero 2022

## Autores

- Perla Velasco
- Yonathan Martinez
- Jorge Solis