// -------------------------------------------------------------------------
//  Archivo: events.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Éste archivo define los eventos que se pueden ejecutar en la pantalla
//    del Microservicio.
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchClients extends HomeEvent {}

class DownloadPolicy extends HomeEvent {
  final Cliente client;

  const DownloadPolicy(this.client);
}

class CreateClient extends HomeEvent {}

class OpenDetails extends HomeEvent {
  final Cliente client;

  const OpenDetails(this.client);
}

class GetPayments extends HomeEvent {
  final Cliente client;

  const GetPayments(this.client);
}

class NotifyTelegram extends HomeEvent {
  final Cliente cliente;

  const NotifyTelegram(this.cliente);
}
