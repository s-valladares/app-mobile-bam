import 'package:componentes/src/models/Vehiculo.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ConcesionariosDetallesPage extends StatefulWidget {
  final int idConcesionario;
  ConcesionariosDetallesPage({this.idConcesionario});

  @override
  createState() =>
      _ConcesionariosDetallesPageState(idConcesionario: idConcesionario);
}

class _ConcesionariosDetallesPageState
    extends State<ConcesionariosDetallesPage> {
  final int idConcesionario;
  _ConcesionariosDetallesPageState({this.idConcesionario});

  Map concesionario;

  getConcesionariosDetalles() async {
    http.Response response = await http
        .get(Constants.URL_API + '/concesionario/${this.idConcesionario}');

    this.concesionario = json.decode(response.body)[0];
    debugPrint(response.body.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getConcesionariosDetalles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del concesionario'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
            height: 180, child: Card(child: detalles(this.concesionario))));
  }

  Widget detalles(Map vehiculo) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Tienda: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.concesionario["nombre"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Razón social: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.concesionario["razon"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Correo: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.concesionario["email"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Departamento: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.concesionario["departamento"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Municipio: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.concesionario["municipio"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Teléfono: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.concesionario["telefono"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ));
  }
}
