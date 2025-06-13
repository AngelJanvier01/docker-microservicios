// -------------------------------------------------------------------------
//  Archivo: router_screen.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define el gestor de rutas de las pantallas del Microservicio.
//
//    A continuación se describen los métodos que se implementaron en ésta
//    clase:
//
//                                       Métodos:
//    +------------------------+--------------------------+--------------------+
//    |         Nombre         |        Parámetros        |        Función     |
//    +------------------------+--------------------------+--------------------+
//    |       generate()       | - settings: objeto que   | - Enruta la        |
//    |                        |   contiene la definición |   pantalla y los   |
//    |                        |   de la ruta que se      |   componentes en   |
//    |                        |   mostrará en pantalla.  |   la pantalla      |
//    |                        |                          |   correspondiente. |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/providers/clientes_api.dart';
import 'package:Cliente/data/providers/notificador_api.dart';
import 'package:Cliente/data/providers/pagos_api.dart';
import 'package:Cliente/data/providers/reportes_api.dart';
import 'package:Cliente/data/repositories/repositorio_clientes.dart';
import 'package:Cliente/data/repositories/repositorio_notificador.dart';
import 'package:Cliente/data/repositories/repositorio_pagos.dart';
import 'package:Cliente/data/repositories/repositorio_reporteador.dart';
import 'package:Cliente/logic/home/bloc.dart';
import 'package:Cliente/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterScreen {
  static const home = "/";

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                create: (BuildContext context) => HomeBloc(
                  RepositorioClientes(
                    ClientesAPI(),
                  ),
                  RepositorioReporteador(
                    ReporteadorAPI(),
                  ),
                  RepositorioNotificador(
                    NotificadorAPI(),
                  ),
                  RepositorioPagos(
                    PagosAPI(),
                  ),
                ),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("not found"),
            ),
          ),
        );
    }
  }
}
