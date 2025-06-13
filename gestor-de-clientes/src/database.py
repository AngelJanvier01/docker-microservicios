##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: database.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Éste archivo define el motor de la base de datos utilizada en el Microservicio
#
#-------------------------------------------------------------------------
from flask_mongoengine import MongoEngine

db = MongoEngine()