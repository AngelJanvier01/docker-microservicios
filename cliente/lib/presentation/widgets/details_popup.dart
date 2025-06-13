// -------------------------------------------------------------------------
//  Archivo: details_popup.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Ésta clase define un componente independiente para mostrar una ventana
//    emergente con los datos de los clientes.
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:Cliente/logic/home/bloc.dart';
import 'package:Cliente/logic/home/events.dart';
import 'package:Cliente/logic/home/states.dart';
import 'package:Cliente/presentation/helpers/payments_data_table_source.dart';
import 'package:Cliente/presentation/utilities/styles.dart';
import 'package:Cliente/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPopUp extends StatefulWidget {
  final Cliente client;
  const DetailsPopUp({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  _DetailsPopUpState createState() => _DetailsPopUpState();
}

class _DetailsPopUpState extends State<DetailsPopUp> {
  List<String> headers = [
    "Monto",
    "Transacción",
    "Fuente",
    "Estatus",
    "Fecha",
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetPayments(widget.client));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8,
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 800.0,
          maxHeight: 700.0, // Altura máxima del diálogo
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Póliza ${widget.client.policy}",
                      style: kTitleDialogStyle,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    )
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Datos generales",
                      style: kSubtitleDialogStyle,
                      textAlign: TextAlign.left,
                      softWrap: true,
                    )
                  ],
                ),
                const Divider(color: Colors.black, height: 2),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(widget.client.company),
                        subtitle: const Text("nombre del contratante"),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "${widget.client.name} ${widget.client.lastName}",
                        ),
                        subtitle: const Text("nombre del asegurado"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(widget.client.jobTitle),
                        subtitle: const Text("puesto u ocupación"),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "****${widget.client.ssn.substring(widget.client.ssn.length - 3)}",
                        ),
                        subtitle: const Text("seguridad social"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(widget.client.address),
                        subtitle: const Text("dirección"),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: ListTile(
                        title: Text(widget.client.bloodGroup),
                        subtitle: const Text("tipo de sangre"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(widget.client.sex),
                        subtitle: const Text("genero"),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: ListTile(
                        title: Text(widget.client.birthdate),
                        subtitle: const Text("fecha de nacimiento"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                      callback: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          DownloadPolicy(widget.client),
                        );
                      },
                      text: "descargar póliza",
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Historial de pagos",
                      style: kSubtitleDialogStyle,
                      textAlign: TextAlign.left,
                      softWrap: true,
                    )
                  ],
                ),
                const Divider(color: Colors.black, height: 2),
                const SizedBox(height: 10.0),

                // SCROLLABLE PAYMENT TABLE
                SizedBox(
                  height: 300.0,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return SingleChildScrollView(
                        child: PaginatedDataTable(
                          columns: headers
                              .map(
                                (column) => DataColumn(
                                  label: Text(
                                    column.toUpperCase(),
                                    style: kHeaderTextStyle,
                                  ),
                                ),
                              )
                              .toList(),
                          source: PaymentsDataTableSource(
                            pagos:
                                BlocProvider.of<HomeBloc>(context).payments,
                          ),
                          showCheckboxColumn: false,
                          rowsPerPage: 5,
                          showFirstLastButtons: true,
                          onRowsPerPageChanged: (value) {},
                          availableRowsPerPage: const [5, 10, 15, 20],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                      callback: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          NotifyTelegram(widget.client),
                        );
                      },
                      text: "notificar actualización de póliza",
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
