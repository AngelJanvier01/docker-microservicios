import 'package:Cliente/data/models/pago.dart';
import 'package:Cliente/presentation/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentsDataTableSource extends DataTableSource {
  final List<Pago> pagos;

  PaymentsDataTableSource({
    required this.pagos,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(
      onSelectChanged: (value) {
        if (index < pagos.length) {
          notifyListeners();
        }
      },
      cells: [
        DataCell(
          Text(
            index < pagos.length ? "${pagos[index].amount}" : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < pagos.length ? pagos[index].transactionType : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < pagos.length ? pagos[index].source : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < pagos.length ? pagos[index].status : "",
            style: kCellTextStyle,
          ),
        ),
        DataCell(
          Text(
            index < pagos.length ? pagos[index].creationDate : "",
            style: kCellTextStyle,
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => pagos.length;

  @override
  int get selectedRowCount => 0;
}
