##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: client_controller.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Ésta clase define el controlador del microservicio API. 
#   Implementa la funcionalidad y lógica de negocio del Microservicio.
#
#   Las características de ésta clase son las siguientes:
#
#   A continuación se describen los métodos que se implementaron en ésta clase:
#
#                                             Métodos:
#           +------------------------+--------------------------+-----------------------+
#           |         Nombre         |        Parámetros        |        Función        |
#           +------------------------+--------------------------+-----------------------+
#           |      get_clients()     |         Ninguno          |  - Obtiene los        |
#           |                        |                          |    clientes guardados |
#           |                        |                          |    en el sistema.     |
#           +------------------------+--------------------------+-----------------------+
#           |     create_client()    |         Ninguno          |  - Crea un cliente    |
#           |                        |                          |    ficticio en el     |
#           |                        |                          |    sistema.           |
#           +------------------------+--------------------------+-----------------------+
#
#-------------------------------------------------------------------------


from flask import jsonify
from src.models.client import Client
import mongoengine
from faker import Faker
import uuid, clabe

class ClientController:

    @staticmethod
    def get_clients():
        query_set = Client.objects().all()
        clients = list(map(ClientController.process_client, query_set))
        return jsonify(clients)

    @staticmethod
    def create_client():
        fake = Faker()
        faker_profile = fake.profile()
        client = Client()
        client.client_id = uuid.uuid4().hex
        client.name = fake.first_name()
        client.last_name = fake.last_name()
        client.job_title = faker_profile['job']
        client.company = faker_profile['company']
        client.birthdate = faker_profile['birthdate']
        client.ssn = faker_profile['ssn']
        client.address = faker_profile['address']
        client.blood_group = faker_profile['blood_group']
        client.sex = faker_profile['sex']
        client.email = faker_profile['mail']
        client.credit_card_number = fake.credit_card_number()
        client.credit_card_provider = fake.credit_card_provider()
        client.credit_card_security_code = fake.credit_card_security_code()
        client.credit_card_expire = fake.credit_card_expire()
        client.policy = "%s%d" % (fake.random_uppercase_letter(), fake.random_number(digits=5, fix_len=True))
        client.clabe = clabe.generate_new_clabes(1, '002123456')[0]
        client.save()
        client = ClientController.process_client(client)
        return jsonify(client), 201
    
    @staticmethod
    def process_client(client):
        client_json = client.to_mongo().to_dict()
        if '_id' in client_json.keys():
            del(client_json['_id'])
        for key in ['birthdate']:
            if key in client_json.keys():
                client_json[key] = client_json[key].strftime("%d-%m-%Y")
        return client_json