##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: config.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Éste archivo define el acceso a la configuración del Microservicio
#
#   A continuación se describen los métodos que se implementaron en éste archivo:
#
#                                             Métodos:
#           +------------------------+--------------------------+-----------------------+
#           |         Nombre         |        Parámetros        |        Función        |
#           +------------------------+--------------------------+-----------------------+
#           |     load_config()      |         Ninguno          |  - Carga la           |
#           |                        |                          |    configuración      |
#           |                        |                          |    definida en un     |
#           |                        |                          |    archivo.           |
#           +------------------------+--------------------------+-----------------------+
#
#-------------------------------------------------------------------------
from configparser import ConfigParser

def load_config():
    config = ConfigParser()
    config.read('settings.ini')
    return config