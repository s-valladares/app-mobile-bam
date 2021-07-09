import 'package:componentes/src/pages/agentes_page.dart';
import 'package:componentes/src/pages/concesionarios_page.dart';
import 'package:componentes/src/pages/cotizaciones_page.dart';
import 'package:componentes/src/pages/clientes_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/vehiculos_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'cotizaciones': (BuildContext context) => CotizacionesPage(),
        'vehiculos': (BuildContext context) => VehiculosPage(),
        'clientes': (BuildContext context) => ClientesPage(),
        'agentes': (BuildContext context) => AgentesPage(),
        'concesionarios': (BuildContext context) => ConcesionariosPage()
      },
    );
  }
}
