// -------------------------------------------------------------------------
//  Archivo: payment_repository.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define el uso de la conexión con un Microservicio externo.
//
//    A continuación se describen los métodos que se implementaron en ésta
//    clase:
//
//                                       Métodos:
//    +------------------------+--------------------------+--------------------+
//    |         Nombre         |        Parámetros        |        Función     |
//    +------------------------+--------------------------+--------------------+
//    |    requestPayment()    | - client: cliente al que | - Utiliza la       |
//    |                        |   se le realizará el     |   conexión con el  |
//    |                        |   procesamiento del      |   microservicio    |
//    |                        |   cobro de la póliza     |   para notificar   |
//    |                        |   de seguro              |   un mensaje       |
//    |                        |                          |   específico.      |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/providers/pagos_api.dart';
import 'package:http/http.dart' as http;

class RepositorioPagos {
  final PagosAPI paymentAPI;

  RepositorioPagos(this.paymentAPI);

  Future<http.Response> requestPayment() async {
    http.Response response = await paymentAPI.obtenerPagos();
    return response;
  }
}
