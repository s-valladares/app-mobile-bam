import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VehiculosPage extends StatefulWidget {
  @override
  createState() => _VehiculosPageState();
}

class _VehiculosPageState extends State<VehiculosPage> {
  List vehiculos;
  final idVehiculo = 0;

  getVehiculos() async {
    http.Response response = await http.get('http://10.0.2.2:4000/vehiculos');
    vehiculos = json.decode(response.body);

    debugPrint(vehiculos.toString());

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
        title: Text('Vehículos'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: vehiculos == null ? 0 : vehiculos.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VehiculosDetallesPage(
                            idVehiculo: vehiculos[index]["id"])))
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("Marca: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${vehiculos[index]["marca"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Línea: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${vehiculos[index]["linea"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Modelo: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${vehiculos[index]["modelo"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Color: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${vehiculos[index]["color"]} ",
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
            Navigator.pushNamed(context, 'vehiculos-crear');
          }),
    );
  }
}
