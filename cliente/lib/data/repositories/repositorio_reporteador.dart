// -------------------------------------------------------------------------
//  Archivo: policy_repository.dart
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
//    |    downloadPolicy()    | - client: cliente del    | - Utiliza la       |
//    |                        |   que se realizará la    |   conexión con el  |
//    |                        |   descarga de la póliza  |   microservicio    |
//    |                        |   de seguro              |   para descargar   |
//    |                        |                          |   la póliza de     |
//    |                        |                          |   seguro.          |
//    +------------------------+--------------------------+--------------------+
//    |  checkServiceStatus()  |          Ninguno         | - Utiliza la       |
//    |                        |                          |   conexión con el  |
//    |                        |                          |   microservicio    |
//    |                        |                          |   para comprobar   |
//    |                        |                          |   el estatus del   |
//    |                        |                          |   microservicio.   |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:Cliente/data/providers/reportes_api.dart';
import 'package:http/http.dart' as http;

class RepositorioReporteador {
  final ReporteadorAPI reporterAPI;

  RepositorioReporteador(this.reporterAPI);

  String downloadPolicy(Cliente client) {
    String urlPolicy = reporterAPI.descargarPoliza(client);
    return urlPolicy;
  }

  Future<http.Response> checkServiceStatus() async {
    var response = await reporterAPI.verificarServicio();
    return response;
  }
}
