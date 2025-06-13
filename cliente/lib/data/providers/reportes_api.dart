// -------------------------------------------------------------------------
//  Archivo: policy_api.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define la conexión con un Microservicio externo.
//
//    A continuación se describen los métodos que se implementaron en ésta
//    clase:
//
//                                       Métodos:
//    +------------------------+--------------------------+--------------------+
//    |         Nombre         |        Parámetros        |        Función     |
//    +------------------------+--------------------------+--------------------+
//    |    downloadPolicy()    | - client: cliente del    | - Realiza la       |
//    |                        |   que se descargará la   |   petición de la   |
//    |                        |   póliza de seguro       |   creación y       |
//    |                        |                          |   descarga de la   |
//    |                        |                          |   póliza de seguro |
//    |                        |                          |   de un cliente    |
//    +------------------------+--------------------------+--------------------+
//    |     checkService()     |          Ninguno         | - Realiza la       |
//    |                        |                          |   comprobación de  |
//    |                        |                          |   el estado del    |
//    |                        |                          |   Microservicio    |
//    |                        |                          |   de pólizas       |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReporteadorAPI {
  final String gatewayHost = dotenv.env['GATEWAY_HOST'] ?? "localhost";
  final String gatewayPort = dotenv.env['GATEWAY_PORT'] ?? "8080";

  String descargarPoliza(Cliente client) {
    Map<String, dynamic> params = {"data": jsonEncode(client.toJson())};
    String endpoint = "/reporteador/policy.pdf";
    String baseUrl = "$gatewayHost:$gatewayPort";

    return Uri.http(baseUrl, endpoint, params).toString();
  }

  Future<http.Response> verificarServicio() async {
    String endpoint = "/reporteador/health";
    String baseUrl = "$gatewayHost:$gatewayPort";
    var response = await http.get(
      Uri.http(baseUrl, endpoint),
    );
    return response;
  }
}
