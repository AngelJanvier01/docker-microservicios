##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: client.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Ésta clase define el la estructura del modelo de un Cliente en el sistema
#
#-------------------------------------------------------------------------
from src.database import db

class Client(db.DynamicDocument):

    client_id = db.StringField(unique=True, required=True)
    name = db.StringField()
    last_name = db.StringField()
    job_title = db.StringField()
    company = db.StringField()
    birthdate = db.DateTimeField()
    ssn = db.StringField()
    address = db.StringField()
    blood_group = db.StringField()
    sex = db.StringField()
    email = db.EmailField()
    credit_card_number = db.StringField()
    credit_card_provider = db.StringField()
    credit_card_security_code = db.StringField()
    credit_card_expire = db.StringField()
    policy = db.StringField()
    clabe = db.StringField()

    meta = {
        'collection': 'clients'
    }