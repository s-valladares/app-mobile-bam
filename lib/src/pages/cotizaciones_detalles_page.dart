import 'package:componentes/src/models/Vehiculo.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CotizacionesDetallesPage extends StatefulWidget {
  final int idCotizacion;
  CotizacionesDetallesPage({this.idCotizacion});

  @override
  createState() => _CotizacionesDetallesPageState(idCotizacion: idCotizacion);
}

class _CotizacionesDetallesPageState extends State<CotizacionesDetallesPage> {
  final int idCotizacion;
  _CotizacionesDetallesPageState({this.idCotizacion});

  Map cotizacion;

  getClientesDetalles() async {
    http.Response response = await http
        .get(Constants.URL_API + '/cotizaciones/${this.idCotizacion}');

    this.cotizacion = json.decode(response.body)[0];
    debugPrint(response.body.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getClientesDetalles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles de la cotización'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
            height: 250, child: Card(child: detalles(this.cotizacion))));
  }

  Widget detalles(Map cotizacion) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Nombres: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["nombres"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Apellidos: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["apellidos"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Marca: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["marca"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Color: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["color"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Linea: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["linea"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Modelo: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["modelo"].toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Precio: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["precio"].toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Tienda: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["concesionario"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Vendedor: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(cotizacion["agente"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ));
  }
}
