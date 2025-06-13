##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: policy_controller.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Ésta clase define el controlador del microservicio Reporter. 
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
#           |    download_policy()   |         Ninguno          |  - Procesa la         |
#           |                        |                          |    creación de la     |
#           |                        |                          |    póliza de seguro   |
#           |                        |                          |    de un cliente y la |
#           |                        |                          |    envía como         |
#           |                        |                          |    respuesta.         |
#           +------------------------+--------------------------+-----------------------+
#           |     health_check()     |         Ninguno          |  - Permite comprobar  |
#           |                        |                          |    si el servicio se  |
#           |                        |                          |    encuentra activo   |
#           |                        |                          |    o no.              |
#           +------------------------+--------------------------+-----------------------+
#
#-------------------------------------------------------------------------
from flask import request, jsonify, send_from_directory
from src.helpers.processor import create_policy
import json, os
from datetime import datetime, timedelta

class PolicyController:

    @staticmethod
    def download_policy():
        if request.args:
            data = json.loads(request.args.get("data"))
            if isinstance(data, dict):
                policy_from = datetime.now()
                data['policy_from'] = policy_from.strftime("%d-%m-%Y")
                policy_to = policy_from + timedelta(weeks=52)
                data['policy_to'] = policy_to.strftime("%d-%m-%Y")
                policy_filename = create_policy(data)
                return send_from_directory(os.getcwd(), policy_filename, download_name="%s.pdf" % (policy_filename))
            else:
                return jsonify({"msg": "error while trying to create the policy"}), 500
        else:
            return jsonify({"msg": "bad request"}), 400

    @staticmethod
    def health_check():
        return jsonify({}), 200