// -------------------------------------------------------------------------
//  Archivo: clients_data_table_source.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define un componente independiente para mostrar la tabla de
//    clientes.
//
//    A continuación se describen los métodos que se implementaron en ésta
//    clase:
//
//                                       Métodos:
//    +-------------------------+--------------------------+--------------------+
//    |         Nombre          |        Parámetros        |        Función     |
//    +-------------------------+--------------------------+--------------------+
//    |        getRow()         | - index: índice de la    | - Crea y dibuja    |
//    |                         |   fila a mostrar en la   |   una fila en      |
//    |                         |   tabla.                 |   particular       |
//    |                         |                          |   dentro de la     |
//    |                         |                          |   tabla.           |
//    +-------------------------+--------------------------+--------------------+
//    | isRowCountApproximate() |          Ninguno         | - Indica si la     |
//    |                         |                          |   file en cuestión |
//    |                         |                          |   está próxima al  |
//    |                         |                          |   total de filas   |
//    |                         |                          |   contenidas.      |
//    +-------------------------+--------------------------+--------------------+
//    |       rowCount()        |          Ninguno         | - Indica el total  |
//    |                         |                          |   de filas         |
//    |                         |                          |   contenidas.      |
//    +-------------------------+--------------------------+--------------------+
//    |   selectedRowCount()    |          Ninguno         | - Indica el total  |
//    |                         |                          |   de filas         |
//    |                         |                          |   seleccionadas.   |
//    +-------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:Cliente/presentation/utilities/styles.dart';
import 'package:flutter/material.dart';

class ClientsDataTableSource extends DataTableSource {
  final List<Cliente> clients;
  final Function onRowSelected;
  final Function onButtonPressed;

  ClientsDataTableSource({
    required this.clients,
    required this.onRowSelected,
    required this.onButtonPressed,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(
      onSelectChanged: (value) {
        if (index < clients.length) {
          onRowSelected(clients[index]);
          notifyListeners();
        }
      },
      cells: [
        DataCell(
          Text(
            index < clients.length
                ? "${clients[index].name} ${clients[index].lastName}"
                : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < clients.length ? clients[index].birthdate : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < clients.length ? clients[index].company : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < clients.length ? clients[index].jobTitle : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < clients.length ? clients[index].policy : "",
            style: kCellTextStyle,
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => clients.length;

  @override
  int get selectedRowCount => 0;
}
