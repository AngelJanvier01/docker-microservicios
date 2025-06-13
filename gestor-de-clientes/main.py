##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: main.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Éste archivo define el punto de ejecución del Microservicio
#
#-------------------------------------------------------------------------
from src.application import create_app

if __name__ == "__main__":
    db_uri = "mongodb://database:27017/database"
    app = create_app(db_uri)
    app.run("0.0.0.0", port=8000, debug=True)