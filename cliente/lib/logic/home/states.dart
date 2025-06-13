// -------------------------------------------------------------------------
//  Archivo: states.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Éste archivo define los estados en los que se pueden encontrar los
//    componentes de la pantalla.
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitialState extends HomeState {}

class ShowNotification extends HomeState {
  final String message;

  const ShowNotification(this.message);
}

class Loading extends HomeState {}

class ReportReady extends HomeState {
  final String reportUrl;

  const ReportReady(this.reportUrl);
}

class DetailsDialogOpened extends HomeState {
  final Cliente client;

  const DetailsDialogOpened(this.client);
}
