import 'package:componentes/src/pages/clientes_detalles_page.dart';
import 'package:componentes/src/pages/concesionarios_detalles_page.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ConcesariosPage extends StatefulWidget {
  @override
  createState() => _ConcesariosPageState();
}

class _ConcesariosPageState extends State<ConcesariosPage> {
  List concesionarios;

  getConcesionarios() async {
    http.Response response =
        await http.get(Constants.URL_API + '/concesionario');
    concesionarios = json.decode(response.body);

    debugPrint(concesionarios.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getConcesionarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concesionarios'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: concesionarios == null ? 0 : concesionarios.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConcesionariosDetallesPage(
                            idConcesionario: concesionarios[index]["id"])))
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("Tienda: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${concesionarios[index]["nombre"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Razón Social: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${concesionarios[index]["razon"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Correo: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${concesionarios[index]["email"]} ",
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
            Navigator.pushNamed(context, 'concesionarios-crear');
          }),
    );
  }
}
