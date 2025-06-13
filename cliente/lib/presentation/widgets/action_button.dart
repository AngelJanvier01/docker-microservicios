// -------------------------------------------------------------------------
//  Archivo: action_button.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define un componente independiente para proporcionar un botón.
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

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color color;

  const ActionButton({
    Key? key,
    this.text = "action button",
    required this.callback,
    this.color = kBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: callback,
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
      ),
    );
  }
}
