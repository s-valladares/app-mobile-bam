import 'package:componentes/src/pages/agentes_crear_page.dart';
import 'package:componentes/src/pages/agentes_detalles_page.dart';
import 'package:componentes/src/pages/agentes_page.dart';
import 'package:componentes/src/pages/clientes_crear_page.dart';
import 'package:componentes/src/pages/clientes_detalles_page.dart';
import 'package:componentes/src/pages/concesionarios_crear_page.dart';
import 'package:componentes/src/pages/concesionarios_detalles_page.dart';
import 'package:componentes/src/pages/concesionarios_page.dart';
import 'package:componentes/src/pages/cotizaciones_crear_page.dart';
import 'package:componentes/src/pages/cotizaciones_detalles_page.dart';
import 'package:componentes/src/pages/cotizaciones_page.dart';
import 'package:componentes/src/pages/clientes_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/vehiculos_crear_page.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
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
        'concesionarios': (BuildContext context) => ConcesariosPage(),
        'vehiculos-detalles': (BuildContext context) => VehiculosDetallesPage(),
        'vehiculos-crear': (BuildContext context) => VehiculosCrearPage(),
        'clientes-detalles': (BuildContext context) => ClientesDetallesPage(),
        'clientes-crear': (BuildContext context) => ClientesCrearPage(),
        'agentes-detalles': (BuildContext context) => AgentesDetallesPage(),
        'agentes-crear': (BuildContext context) => AgentesCrearPage(),
        'cotizaciones-detalles': (BuildContext context) =>
            CotizacionesDetallesPage(),
        'cotizaciones-crear': (BuildContext context) => CotizacionesCrearPage(),
        'concesionarios-detalles': (BuildContext context) =>
            ConcesionariosDetallesPage(),
        'concesionarios-crear': (BuildContext context) =>
            ConcesionariosCrearPage(),
      },
    );
  }
}
