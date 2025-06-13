// -------------------------------------------------------------------------
//  Archivo: toast_message.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define un componente independiente para mostrar mensajes.
//
//    A continuación se describen los métodos que se implementaron en ésta
//    clase:
//
//                                       Métodos:
//    +------------------------+--------------------------+--------------------+
//    |         Nombre         |        Parámetros        |        Función     |
//    +------------------------+--------------------------+--------------------+
//    |         build()        | - context: Contexto de   | - Crea y dibuja el |
//    |                        |   aplicación en          |   componente en la |
//    |                        |   ejecución.             |   interfaz de      |
//    |                        |                          |   usuario.         |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/presentation/utilities/colors.dart';
import 'package:flutter/material.dart';

class ToastMessage extends StatelessWidget {
  final String message;
  const ToastMessage({Key? key, this.message = "mensaje de prueba"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 250,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kBlack,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.start,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
