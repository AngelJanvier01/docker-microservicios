// -------------------------------------------------------------------------
//  Archivo: home_screen.dart
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
//    |       initState()      |          Ninguno         | - Inicializa el    |
//    |                        |                          |   las dependencias |
//    |                        |                          |   del componente   |
//    |                        |                          |   que se creará.   |
//    +------------------------+--------------------------+--------------------+
//    |         build()        | - context: Contexto de   | - Crea y dibuja el |
//    |                        |   aplicación en          |   componente en la |
//    |                        |   ejecución.             |   interfaz de      |
//    |                        |                          |   usuario.         |
//    +------------------------+--------------------------+--------------------+
//
//
// -------------------------------------------------------------------------
import 'package:Cliente/data/models/cliente.dart';
import 'package:Cliente/logic/home/bloc.dart';
import 'package:Cliente/logic/home/events.dart';
import 'package:Cliente/logic/home/states.dart';
import 'package:Cliente/presentation/helpers/clients_data_table_source.dart';
import 'package:Cliente/presentation/utilities/colors.dart';
import 'package:Cliente/presentation/utilities/styles.dart';
import 'package:Cliente/presentation/widgets/action_button.dart';
import 'package:Cliente/presentation/widgets/details_popup.dart';
import 'package:Cliente/presentation/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> headers = [
    "Nombre",
    "Fecha de nacimiento",
    "Empresa",
    "Puesto",
    "Póliza",
  ];
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    BlocProvider.of<HomeBloc>(context).add(
      FetchClients(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is ShowNotification) {
            _showToast(state.message);
          }
          if (state is ReportReady) {
            _downloadReport(state.reportUrl);
          }
          if (state is DetailsDialogOpened) {
            _showDetails(state.client, context);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "GlobalSurance, S.A.",
                      style: kTitlePageTextStyle,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    callback: () {
                      BlocProvider.of<HomeBloc>(context).add(
                        CreateClient(),
                      );
                    },
                    text: "agregar cliente nuevo",
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(),
                                ],
                              )
                            ],
                          );
                        }
                        return PaginatedDataTable(
                          header: const Text("Clientes registrados"),
                          actions: [
                            ActionButton(
                              callback: () {
                                BlocProvider.of<HomeBloc>(context).add(
                                  FetchClients(),
                                );
                              },
                              text: "actualizar",
                            ),
                          ],
                          columns: headers
                              .map(
                                (column) => DataColumn(
                                  label: Text(column.toUpperCase(),
                                      style: kHeaderTextStyle),
                                ),
                              )
                              .toList(),
                          source: ClientsDataTableSource(
                              clients:
                                  BlocProvider.of<HomeBloc>(context).clients,
                              onRowSelected: (client) {
                                BlocProvider.of<HomeBloc>(context).add(
                                  OpenDetails(client),
                                );
                              },
                              onButtonPressed: (client) {}),
                          showCheckboxColumn: false,
                          rowsPerPage: 5,
                          showFirstLastButtons: true,
                          onRowsPerPageChanged: (value) {},
                          availableRowsPerPage: const [5, 10, 15, 20],
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _downloadReport(String url) async {
    !await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  }

  _showToast(String message) {
    fToast.showToast(
      child: ToastMessage(
        message: message,
      ),
      gravity: ToastGravity.TOP_LEFT,
      toastDuration: const Duration(seconds: 3),
    );
  }

  _showDetails(Cliente client, BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black26,
      builder: (cntxt) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: BlocProvider.of<HomeBloc>(context),
            ),
          ],
          child: DetailsPopUp(client: client),
        );
      },
    );
  }
}
