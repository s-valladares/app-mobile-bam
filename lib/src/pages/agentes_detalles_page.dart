import 'package:componentes/src/models/Vehiculo.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AgentesDetallesPage extends StatefulWidget {
  final int idAgente;
  AgentesDetallesPage({this.idAgente});

  @override
  createState() => _AgentesDetallesPageState(idAgente: idAgente);
}

class _AgentesDetallesPageState extends State<AgentesDetallesPage> {
  final int idAgente;
  _AgentesDetallesPageState({this.idAgente});

  Map agente;

  getAgentesDetalles() async {
    http.Response response =
        await http.get(Constants.URL_API + '/agentes/${this.idAgente}');

    this.agente = json.decode(response.body)[0];
    debugPrint(response.body.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getAgentesDetalles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del agente'),
          backgroundColor: Colors.blueGrey,
        ),
        body:
            Container(height: 150, child: Card(child: detalles(this.agente))));
  }

  Widget detalles(Map agente) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Nombres: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(agente["nombres"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Apellidos: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(agente["apellidos"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Dirección: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(agente["direccion"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Teléfono: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(agente["telefono"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Fecha de nacimiento: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(agente["nacimiento"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ));
  }
}
