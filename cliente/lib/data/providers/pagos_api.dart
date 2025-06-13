// -------------------------------------------------------------------------
//  Archivo: payment_api.dart
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
//    |    requestPayment()    | - client: cliente al que | - Realiza la       |
//    |                        |   se le realizará el     |   petición del     |
//    |                        |   cobro de la póliza     |   procesamiento    |
//    |                        |                          |   del cobro de la  |
//    |                        |                          |   póliza de seguro |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PagosAPI {
  final String gatewayHost = dotenv.env['GATEWAY_HOST'] ?? "localhost";
  final String gatewayPort = dotenv.env['GATEWAY_PORT'] ?? "8080";
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  Future<http.Response> obtenerPagos() async {
    String endpoint = "/pagos/records";
    String baseUrl = "$gatewayHost:$gatewayPort";
    var response = await http.get(
      Uri.http(baseUrl, endpoint),
    );
    return response;
  }
}
