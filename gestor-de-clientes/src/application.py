##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: application.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Éste archivo define la aplicación Flask que contiene al microservicio API
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
#           |      create_app()      |  - db_uri: string de     |  - Define la          |
#           |                        |    conexión a la base    |    aplicación Flask   |
#           |                        |    de datos.             |    que se utiliza     |
#           |                        |                          |    en el micro-       |
#           |                        |                          |    servicio.          |
#           +------------------------+--------------------------+-----------------------+
#
#-------------------------------------------------------------------------
from flask import Flask, render_template
from src.database import db
from flask_cors import CORS
from src.controllers.client_controller import ClientController
import os

def create_app(db_uri: str) -> Flask:
    template_dir = os.path.dirname(os.path.realpath(__file__))
    template_dir = os.path.join(template_dir, '../templates')
    app = Flask(__name__, template_folder=template_dir)
    _ = CORS(app, resources={r"/*": {"origins": "*"}})
    app.config['MONGODB_SETTINGS'] = {
        'host': db_uri
    }
    db.init_app(app)

    for collection in ['clients']:
        if not collection in db.get_db().list_collection_names():
            db.get_db().create_collection(collection)

    app.add_url_rule("/clients", methods=["GET"], view_func=ClientController.get_clients)
    app.add_url_rule("/clients", methods=["POST"], view_func=ClientController.create_client)
    app.add_url_rule("/", methods=["GET"], view_func=lambda: render_template("swaggerui.html"))
    return app