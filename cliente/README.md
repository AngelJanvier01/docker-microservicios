# Cliente

Componente GUI que funciona como un cliente en este sistema utilizando la funcionalidad que realizan los microservicios

## Estructura del proyecto

En esta sección solamente se detallarán los directorios relacionados con el código fuente del microservicio, omitiendo los directorios adicionales de configuración.

Este repositorio contiene los siguientes directorios y archivos:

```bash
    ├── android                                     # configuración de plataforma android
    ├── ios                                         # configuración de plataforma iOS
    ├── lib                                         # código fuente del sistema
    │  ├── data                                     # definición de la capa de datos del microservicio
    │  |  ├── models                                # definición de modelos
    │  |  |  ├── cliente.dart                       # definición del modelo de cliente
    │  |  |  ├── cliente.g.dart                     # archivo autogenerado complementario
    │  |  |  ├── pago.dart                          # definición del modelo de pago
    │  |  |  ├── pago.g.dart                        # archivo autogenerado complementario
    │  |  ├── providers                             # definición de conexión con servicios externos
    │  |  |  ├── clientes_api.dart                  # definición de conexión con servicio gestor de clientes
    │  |  |  ├── notificador_api.dart               # definición de conexión con servicio notificador
    │  |  |  ├── pagos_api.dart                     # definición de conexión con servicio de pagos
    │  |  |  ├── reportes_api.dart                  # definición de conexión con servicio reporteador
    │  |  ├── repositories                          # definición de interfaces entre servicios externos y el microservicio
    │  |  |  ├── repositorio_clientes.dart          # interfaz que interactua con la definición del servicio gestor de clientes
    │  |  |  ├── repositorio_notificador.dart       # interfaz que interactua con la definición del servicio notificador
    │  |  |  ├── repositorio_pagos.dart             # interfaz que interactua con la definición del servicio de pagos
    │  |  |  ├── repositorio_reporteador.dart       # interfaz que interactua con la definición del servicio reporteador
    │  ├── logic                                    # definición de la capa de lógica del microservicio
    │  |  |  ├── home                               # definición de la lógica de la pantalla home
    │  |  |  |  ├── bloc.dart                       # lógica de los eventos disponibles en la pantalla home
    │  |  |  |  ├── events.dart                     # eventos de la pantalla home
    │  |  |  |  ├── states.dart                     # estados de la pantalla home
    │  ├── presentation                             # definición de la capa de presentación del microservicio
    │  |  |  ├── helper                             # definición de componentes auxiliares
    │  |  |  |  ├── clients_data_table_source.dart  # componente auxiliar para la tabla de clientes
    │  |  |  |  ├── payments_data_table_source.dart # componente auxiliar para la tabla de pagos
    │  |  |  |  ├── router_screen.dart              # componente auxiliar que define las rutas de las pantallas
    │  |  |  ├── screens                            # definición de las pantallas del microservicio
    │  |  |  |  ├── home_screen.dart                # pantalla home del microswervicio
    │  |  |  ├── utilities                          # definición de utilidades del microservicio
    │  |  |  |  ├── colors.dart                     # definición de colores de la aplicación
    │  |  |  |  ├── styles.dart                     # definición de estilos de texto
    │  |  |  ├── widgets                            # definición de componentes
    │  |  |  |  ├── action_button.dart              # componente botón
    │  |  |  |  ├── details_popup.dart              # componente popup
    │  |  |  |  ├── toast_message.dart              # componente toast
    │  ├── generated_plugin_registrant.dart         # archivo autogenerado
    │  ├── main.dart                                # archivo principal de ejecución
    ├── test                                        # pruebas del proyecto
    ├── web                                         # configuración de plataforma web
    ├── env.example                                 # ejemplo de definición de variables de entorno
    ├── .gitignore                                  # exclusiones de git
    ├── .metadata                                   # definición de metadatos del proyecto
    ├── analysis_options.yaml                       # reglas del linter de flutter
    ├── Dockerfile                                  # definición de comandos docker del microservicio
    ├── pubspec.lock                                # subdependencias del proyecto
    ├── pubspec.yaml                                # dependencias del proyecto
    ├── README.md                                   # este archivo
```

## Instalación

Descarga el código del repositorio utilizando el siguiente comando:

`git clone https://gitlab.com/tareas-arquitectura-de-software-curso/microservicios/cliente.git`

accede a la carpeta del microservicio

`cd cliente`

## Configuración

Antes de arrancar el microservicio deberás realizar las siguientes modificaciones. 

> identifica la IP de tu máquina y reemplazala por valor actual.

### .env

Abre el archivo `.env` y actualiza el valor de la variable `GATEWAY_HOST`:

```bash
GATEWAY_HOST=tyk-gateway
```

## Ejecución

Lo primero será crear una imagen del microservicio, para ello utiliza el siguiente comando:

`docker build -t cliente .`

Para ejecutar el sistema utiliza el siguiente comando:

`docker run -d -p 80:80 --name cliente cliente`

Para detener el sistema utiliza el siguiente comando:

`docker stop cliente`

## Versión

3.0.0 - Febrero 2022

## Autores

- Perla Velasco
- Yonathan Martinez
- Jorge Solis