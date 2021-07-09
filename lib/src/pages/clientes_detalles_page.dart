import 'package:componentes/src/models/Vehiculo.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClientesDetallesPage extends StatefulWidget {
  final int idCliente;
  ClientesDetallesPage({this.idCliente});

  @override
  createState() => _ClientesDetallesPageState(idCliente: idCliente);
}

class _ClientesDetallesPageState extends State<ClientesDetallesPage> {
  final int idCliente;
  _ClientesDetallesPageState({this.idCliente});

  Map cliente;

  getClientesDetalles() async {
    http.Response response =
        await http.get(Constants.URL_API + '/clientes/${this.idCliente}');

    this.cliente = json.decode(response.body)[0];
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
          title: Text('Detalles del cliente'),
          backgroundColor: Colors.blueGrey,
        ),
        body:
            Container(height: 200, child: Card(child: detalles(this.cliente))));
  }

  Widget detalles(Map vehiculo) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Nombres: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["nombres"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Apellidos: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["apellidos"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Dirección: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["direccion"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Teléfono: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["telefono"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Correo: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["email"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Nivel académico: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["nivelAcademico"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Profesión: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.cliente["profesion"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ));
  }
}
