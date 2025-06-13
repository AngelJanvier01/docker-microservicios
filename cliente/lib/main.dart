import 'package:Cliente/presentation/helpers/router_screen.dart';
import 'package:Cliente/presentation/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ClienteApp());
}

class ClienteApp extends StatelessWidget {
  const ClienteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cliente',
      theme: ThemeData(
        primarySwatch: kUAZTheme,
      ),
      onGenerateRoute: RouterScreen.generate,
      initialRoute: RouterScreen.home,
    );
  }
}
