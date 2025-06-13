##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: application.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Éste archivo define la aplicación Flask que contiene al microservicio Notifier
#
#   Las características de ésta clase son las siguientes:
#
#                                         application.py
#           +-----------------------+-------------------------+------------------------+
#           |  Nombre del elemento  |     Responsabilidad     |      Propiedades       |
#           +-----------------------+-------------------------+------------------------+
#           |     Microservicio     |  - Provee funcionalidad |         Ninguna        |
#           |                       |    y expone una API     |                        |
#           |                       |    bien definida.       |                        |
#           +-----------------------+-------------------------+------------------------+
#
#   A continuación se describen los métodos que se implementaron en ésta clase:
#
#                                             Métodos:
#           +------------------------+--------------------------+-----------------------+
#           |         Nombre         |        Parámetros        |        Función        |
#           +------------------------+--------------------------+-----------------------+
#           |      create_app()      |          Ninguno         |  - Define la          |
#           |                        |                          |    aplicación Flask   |
#           |                        |                          |    que se utiliza     |
#           |                        |                          |    en el micro-       |
#           |                        |                          |    servicio.          |
#           +------------------------+--------------------------+-----------------------+
#
#-------------------------------------------------------------------------
from flask import Flask, render_template
from flask_cors import CORS
from src.controllers.telegram_controller import TelegramController
import os

def create_app() -> Flask:
    template_dir = os.path.dirname(os.path.realpath(__file__))
    template_dir = os.path.join(template_dir, '../templates')
    app = Flask(__name__, template_folder=template_dir)
    _ = CORS(app, resources={r"/*": {"origins": "*"}})

    app.add_url_rule("/telegram", methods=["POST"], view_func=TelegramController.send_message)
    app.add_url_rule("/", methods=["GET"], view_func=lambda: render_template("swaggerui.html"))
    return app