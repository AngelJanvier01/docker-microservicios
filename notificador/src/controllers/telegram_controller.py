##!/usr/bin/env python
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------
# Archivo: telegram_controller.py
# Capitulo: Estilo Microservicios
# Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
# Version: 3.0.0 Febrero 2022
# Descripción:
#
#   Ésta clase define el controlador del microservicio API. 
#   Implementa la funcionalidad y lógica de negocio del Microservicio.
#
#   A continuación se describen los métodos que se implementaron en ésta clase:
#
#                                             Métodos:
#           +------------------------+--------------------------+-----------------------+
#           |         Nombre         |        Parámetros        |        Función        |
#           +------------------------+--------------------------+-----------------------+
#           |     send_message()     |         Ninguno          |  - Procesa el mensaje |
#           |                        |                          |    recibido en la     |
#           |                        |                          |    petición y ejecuta |
#           |                        |                          |    el envío a         |
#           |                        |                          |    Telegram.          |
#           +------------------------+--------------------------+-----------------------+
#
#-------------------------------------------------------------------------
from flask import request, jsonify
import requests
import configparser
import os
import json
import sys

class TelegramController:

    @staticmethod
    def send_message():
        try:
            data = request.get_json()
        except Exception:
            return jsonify({"msg": "Invalid JSON"}), 400

        if not data or not data.get("message", "").strip():
            return jsonify({"msg": "Missing or empty 'message'"}), 400

        message = data["message"]
        client_info = data.get("client")

        # Configuración
        config = configparser.ConfigParser()
        config_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../settings.ini')
        config.read(config_path)

        try:
            token = config['TELEGRAM']['TOKEN']
            chat_id = config['TELEGRAM']['CHAT_ID']
        except KeyError:
            return jsonify({"msg": "Telegram configuration missing"}), 500

        # 1. Enviar mensaje
        text_response = requests.post(
            f"https://api.telegram.org/bot{token}/sendMessage",
            json={"chat_id": chat_id, "text": message},
            timeout=5
        )
        if text_response.status_code != 200:
            return jsonify({"msg": "Error enviando mensaje"}), 500

        # 2. Procesar PDF si existe client_info
        if not client_info:
            return jsonify({"msg": "Message sent"}), 200

        try:
            # Descargar PDF
            pdf_response = requests.get(
                "http://tyk-gateway:8080/reporteador/policy.pdf",
                params={"data": json.dumps(client_info)},
                timeout=10
            )
            
            if pdf_response.status_code != 200:
                raise Exception(f"Reporteador error: {pdf_response.text}")

            # Enviar a Telegram
            doc_response = requests.post(
                f"https://api.telegram.org/bot{token}/sendDocument",
                files={
                    "document": (
                        f"poliza_{client_info.get('numero_poliza', 'cliente')}.pdf",
                        pdf_response.content,
                        "application/pdf"
                    )
                },
                data={"chat_id": chat_id},
                timeout=10
            )

            if doc_response.status_code != 200:
                raise Exception(f"Telegram doc error: {doc_response.text}")

            return jsonify({"msg": "Message and PDF sent"}), 200

        except Exception as e:
            print(f"PDF Error: {str(e)}", file=sys.stderr)
            return jsonify({
                "msg": "Message sent but PDF failed",
                "error": str(e)
            }), 202

    @staticmethod
    def health_check():
        return jsonify({"status": "ok"}), 200