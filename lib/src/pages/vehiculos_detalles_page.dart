import 'package:componentes/src/models/Vehiculo.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VehiculosDetallesPage extends StatefulWidget {
  final int idVehiculo;
  VehiculosDetallesPage({this.idVehiculo});

  @override
  createState() => _VehiculosDetallesPageState(idVehiculo: idVehiculo);
}

class _VehiculosDetallesPageState extends State<VehiculosDetallesPage> {
  final int idVehiculo;
  _VehiculosDetallesPageState({this.idVehiculo});

  Map vehiculo;

  getVehiculosDetalles() async {
    http.Response response =
        await http.get(Constants.URL_API + '/vehiculos/${this.idVehiculo}');

    this.vehiculo = json.decode(response.body)[0];
    debugPrint(response.body.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getVehiculosDetalles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del vehículo'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
            height: 250, child: Card(child: detalles(this.vehiculo))));
  }

  Widget detalles(Map vehiculo) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Marca: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["marca"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Linea: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["linea"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Modelo: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["modelo"].toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Color: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["color"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Tipo: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["tipo"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Precio: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["precio"].toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Forma de pago: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["formaPago"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Cilindraje: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["cc"].toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                Text("Motor: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                Text(this.vehiculo["v"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ));
  }
}
