import 'package:componentes/src/pages/agentes_detalles_page.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AgentesPage extends StatefulWidget {
  @override
  createState() => _AgentesPageState();
}

class _AgentesPageState extends State<AgentesPage> {
  List agentes;

  getVehiculos() async {
    http.Response response = await http.get('http://10.0.2.2:4000/agentes');
    agentes = json.decode(response.body);

    debugPrint(agentes.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getVehiculos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agentes'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: agentes == null ? 0 : agentes.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgentesDetallesPage(
                            idAgente: agentes[index]["id"])))
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("Nombres : ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${agentes[index]["nombres"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Apellidos: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${agentes[index]["apellidos"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Direccion: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${agentes[index]["direccion"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Navigator.pushNamed(context, 'agentes-crear');
          }),
    );
  }
}
