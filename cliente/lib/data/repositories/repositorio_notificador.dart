// -------------------------------------------------------------------------
//  Archivo: notifier_repository.dart
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
//    |   sendNotification()   | - message: mensaje a     | - Utiliza la       |
//    |                        |   notificar              |   conexión con el  |
//    |                        |                          |   microservicio    |
//    |                        |                          |   para notificar   |
//    |                        |                          |   un mensaje       |
//    |                        |                          |   específico.      |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:Cliente/data/providers/notificador_api.dart';
import 'package:http/http.dart' as http;

class RepositorioNotificador {
  final NotificadorAPI notifierAPI;

  RepositorioNotificador(this.notifierAPI);

  Future<http.Response> sendNotification(String message, Cliente client) async {
    http.Response response =
        await notifierAPI.enviarNotificacionTelegram(message,client);
    return response;
  }
}
