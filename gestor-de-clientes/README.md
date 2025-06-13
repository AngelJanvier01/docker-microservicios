# Gestor de clientes

Microservicio responsable de administrar la información de los clientes del sistema

## Estructura del proyecto

Este repositorio contiene los siguientes directorios y archivos:

```bash
    ├── src                        # microservicio gestor de clientes
    │  ├── controllers             # lógica del microservicio 
    │  |  ├── __init__.py          # indica la definición de modulo python
    │  |  ├── client_controller.py # controlador de cliente
    │  ├── models                  # modelos del microservicio 
    │  |  ├── __init__.py          # indica la definición de modulo python
    │  |  ├── client.py            # definición de cliente
    │  ├── __init__.py             # indica la definición de modulo python
    │  ├── application.py          # definición de rutas del microservicio
    │  ├── database.py             # creación de base de datos
    ├── tests                      # carpeta de documentación
    │  ├── __init__.py             # indica la definición de modulo python
    │  ├── test_clients.py         # definición de pruebas de clientes 
    ├── docker-compose.yml         # definición de contenedores para ambiente docker
    ├── Dockerfile                 # definición de comandos docker del microserviocio 
    ├── main.py                    # archivo principal de ejecución
    ├── .gitignore                 # exclusiones de git
    ├── README.md                  # este archivo
    ├── requirements.txt           # depencias del microservicio
```

## Instalación

Descarga el código del repositorio utilizando el siguiente comando:

`git clone https://gitlab.com/tareas-arquitectura-de-software-curso/microservicios.git`

accede a la carpeta del microservicio

`cd gestor-de-clientes`

## Configuración

Para la ejecución de este microservicio no es necesario realizar algún tipo de configuración.

## Ejecución

Para ejecutar el sistema utiliza el siguiente comando:

`docker-compose up -d`

Para detener el sistema utiliza el siguiente comando:

`docker-compose down`

## Versión

3.0.0 - Febrero 2022

## Autores

- Perla Velasco
- Yonathan Martinez
- Jorge Solis