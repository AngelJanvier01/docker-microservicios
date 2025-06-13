# Pagos

Microservicio responsable de obtener los pagos de poliza realizados por los clientes asegurados

## Estructura del proyecto

Este repositorio contiene los siguientes directorios y archivos:

```bash
    ├── Dockerfile    # definición de comandos docker del microservicio 
    ├── pagos.go      # lógica del microservicio 
    ├── README.md     # este archivo
```

## Instalación

Descarga el código del repositorio utilizando el siguiente comando:

`git clone https://gitlab.com/tareas-arquitectura-de-software-curso/microservicios/pagos.git`

accede a la carpeta del microservicio

`cd pagos`

## Ejecución

Lo primero será crear una imagen del microservicio, para ello utiliza el siguiente comando:

`docker build -t pagos .`

Para ejecutar el sistema utiliza el siguiente comando:

`docker run -d -p 8003:8003 --name pagos pagos`

Para detener el sistema utiliza el siguiente comando:

`docker stop pagos`

## Versión

3.0.0 - Febrero 2022

## Autores

- Perla Velasco
- Yonathan Martinez
- Jorge Solis