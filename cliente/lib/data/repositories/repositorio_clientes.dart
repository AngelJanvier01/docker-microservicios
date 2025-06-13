// -------------------------------------------------------------------------
//  Archivo: clients_repository.dart
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
//    |      getClients()      |          Ninguno         | - Utiliza la       |
//    |                        |                          |   conexión con el  |
//    |                        |                          |   microservicio    |
//    |                        |                          |   para obtener los |
//    |                        |                          |   clientes         |
//    |                        |                          |   registrados.     |
//    +------------------------+--------------------------+--------------------+
//    |     createClient()     |          Ninguno         | - Utiliza la       |
//    |                        |                          |   conexión con el  |
//    |                        |                          |   microservicio    |
//    |                        |                          |   para la creación |
//    |                        |                          |   de clientes      |
//    |                        |                          |   nuevos.          |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/providers/clientes_api.dart';
import 'package:http/http.dart' as http;

class RepositorioClientes {
  final ClientesAPI clientsAPI;

  RepositorioClientes(this.clientsAPI);

  Future<http.Response> obtenerClientes() async {
    http.Response response = await clientsAPI.obtenerClientes();
    return response;
  }

  Future<http.Response> crearCliente() async {
    http.Response response = await clientsAPI.crearCliente();
    return response;
  }
}
