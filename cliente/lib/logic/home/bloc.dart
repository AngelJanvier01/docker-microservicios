// -------------------------------------------------------------------------
//  Archivo: bloc.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define la lógica de los eventos que se pueden ejecutar en
//    una pantalla del Microservicio.
//
//    A continuación se describen los métodos que se implementaron en ésta
//    clase:
//
//                                        Métodos:
//    +-----------------------------+--------------------------+--------------------+
//    |         Nombre              |        Parámetros        |        Función     |
//    +-----------------------------+--------------------------+--------------------+
//    |     mapEventToState()       | - event: evento que se   | - Identifica el    |
//    |                             |   ejecutó en la pantalla |   evento que se    |
//    |                             |                          |   ejecutó en la    |
//    |                             |                          |   pantalla y       |
//    |                             |                          |   ejecuta la       |
//    |                             |                          |   lógica asignada  |
//    +-----------------------------+--------------------------+--------------------+
//    | _mapFetchClientsToState()   |          Ninguno         | - Realiza la       |
//    |                             |                          |   conexión con el  |
//    |                             |                          |   microservicio    |
//    |                             |                          |   API para obtener |
//    |                             |                          |   los clientes     |
//    |                             |                          |   guardados        |
//    +-----------------------------+--------------------------+--------------------+
//    | _mapDownloadPolicyToState() | - event: evento que se   | - Realiza la       |
//    |                             |   ejecutó en la pantalla |   conexión con el  |
//    |                             |                          |   microservicio    |
//    |                             |                          |   Reporter para la |
//    |                             |                          |   creación y       |
//    |                             |                          |   descarga de la   |
//    |                             |                          |   póliza de seguro |
//    +-----------------------------+--------------------------+--------------------+
//    |  _mapCreateClientToState()  |          Ninguno         | - Realiza la       |
//    |                             |                          |   conexión con el  |
//    |                             |                          |   microservicio    |
//    |                             |                          |   API para la      |
//    |                             |                          |   creación de      |
//    |                             |                          |   clientes nuevos  |
//    +-----------------------------+--------------------------+--------------------+
//    |  _mapOpenDetailsToState()   | - event: evento que se   | - Abre la ventana  |
//    |                             |   ejecutó en la pantalla |   emergente que    |
//    |                             |                          |   muestra los      |
//    |                             |                          |   detalles de un   |
//    |                             |                          |   cliente          |
//    +-----------------------------+--------------------------+--------------------+
//    | _mapRequestPaymentToState() | - event: evento que se   | - Realiza la       |
//    |                             |   ejecutó en la pantalla |   conexión con el  |
//    |                             |                          |   microservicio    |
//    |                             |                          |   Payment para la  |
//    |                             |                          |   petición del     |
//    |                             |                          |   procesamiento    |
//    |                             |                          |   del cobro de la  |
//    |                             |                          |   póliza de seguro |
//    +-----------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'dart:convert';

import 'package:Cliente/data/models/cliente.dart';
import 'package:Cliente/data/models/pago.dart';
import 'package:Cliente/data/repositories/repositorio_clientes.dart';
import 'package:Cliente/data/repositories/repositorio_notificador.dart';
import 'package:Cliente/data/repositories/repositorio_pagos.dart';
import 'package:Cliente/data/repositories/repositorio_reporteador.dart';
import 'package:Cliente/logic/home/events.dart';
import 'package:Cliente/logic/home/states.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepositorioClientes clientsRepository;
  final RepositorioReporteador reporterRepository;
  final RepositorioNotificador notifierRepository;
  final RepositorioPagos paymentRepository;
  List<Cliente> clients = [];
  List<Pago> payments = [];

  HomeBloc(
    this.clientsRepository,
    this.reporterRepository,
    this.notifierRepository,
    this.paymentRepository,
  ) : super(InitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchClients) {
      yield* _mapFetchClientsToState();
    }
    if (event is DownloadPolicy) {
      yield* _mapDownloadPolicyToState(event);
    }
    if (event is CreateClient) {
      yield* _mapCreateClientToState();
    }
    if (event is OpenDetails) {
      yield* _mapOpenDetailsToState(event);
    }
    if (event is GetPayments) {
      yield* _mapGetPaymentsToState(event);
    }
    if (event is NotifyTelegram) {
      yield* _mapNotifyTelegramToState(event);
    }
  }

  Stream<HomeState> _mapFetchClientsToState() async* {
    yield InitialState();
    yield Loading();
    clients.clear();
    try {
      var response = await clientsRepository.obtenerClientes();
      if (response.statusCode == 200) {
        var jsonClients = jsonDecode(response.body);
        for (Map<String, dynamic> jsonClient in jsonClients) {
          Cliente clientTmp = Cliente.fromJson(jsonClient);
          clients.add(clientTmp);
        }
      } else if (response.statusCode == 500) {
        yield const ShowNotification("servicio no disponible");
      } else {
        yield const ShowNotification("error al cargar los clientes");
      }
    } on Exception catch (e) {
      yield const ShowNotification("servicio no disponible");
    }
    yield InitialState();
  }

  Stream<HomeState> _mapDownloadPolicyToState(DownloadPolicy event) async* {
    yield InitialState();
    try {
      var response = await reporterRepository.checkServiceStatus();
      if (response.statusCode == 200) {
        String urlReport = reporterRepository.downloadPolicy(event.client);
        yield const ShowNotification("poliza creado");
        yield ReportReady(urlReport);
      } else if (response.statusCode == 500) {
        yield const ShowNotification("servicio no disponible");
      } else {
        yield const ShowNotification("servicio no disponible");
      }
    } on Exception catch (e) {
      yield const ShowNotification("servicio no disponible");
    }
  }

  Stream<HomeState> _mapCreateClientToState() async* {
    yield InitialState();
    yield Loading();
    try {
      var response = await clientsRepository.crearCliente();
      if (response.statusCode == 201) {
        Map<String, dynamic> jsonClient = jsonDecode(response.body);
        Cliente client = Cliente.fromJson(jsonClient);
        clients.add(client);
        yield const ShowNotification("cliente creado");
      } else if (response.statusCode == 500) {
        yield const ShowNotification("servicio no disponible");
      } else {
        yield const ShowNotification(
            "ocurrio un error al tratar de crear el cliente");
      }
    } on Exception catch (e) {
      yield const ShowNotification("servicio no disponible");
    }
    yield InitialState();
  }

  Stream<HomeState> _mapOpenDetailsToState(OpenDetails event) async* {
    yield InitialState();
    yield DetailsDialogOpened(event.client);
  }

  Stream<HomeState> _mapGetPaymentsToState(GetPayments event) async* {
    yield InitialState();
    yield Loading();
    try {
      var paymentResponse = await paymentRepository.requestPayment();
      if (paymentResponse.statusCode == 200) {
        payments.clear();
        yield const ShowNotification("pagos obtenidos");
        yield InitialState();
        Map<String, dynamic> jsonPayment = jsonDecode(paymentResponse.body);
        if (jsonPayment.containsKey(event.client.ssn)) {
          for (Map<String, dynamic> paymentJson
              in jsonPayment[event.client.ssn]) {
            Pago payment = Pago.fromJson(paymentJson);
            payments.add(payment);
          }
        }
      } else {
        yield const ShowNotification("servicio de pagos no disponible");
      }
    } on Exception catch (e) {
      yield const ShowNotification(
          "error al interactuar con el servicio de pagos");
    }
  }

  Stream<HomeState> _mapNotifyTelegramToState(NotifyTelegram event) async* {
    yield InitialState();
    try {
      var notifyResponse = await notifierRepository.sendNotification(
          "Nos complace informarle que la póliza ${event.cliente.policy} ha sido actualizada exitosamente", event.cliente);

          
      if (notifyResponse.statusCode == 200) {
        yield const ShowNotification("notificación enviada");
      } else {
        yield const ShowNotification(
            "servicio de notificaciones no disponible");
      }
    } on Exception catch (e) {
      yield const ShowNotification(
          "error al interactuar con el servicio de notificaciones");
    }
  }
}
