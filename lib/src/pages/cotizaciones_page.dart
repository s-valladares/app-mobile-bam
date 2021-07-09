import 'package:componentes/src/pages/clientes_detalles_page.dart';
import 'package:componentes/src/pages/cotizaciones_detalles_page.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CotizacionesPage extends StatefulWidget {
  @override
  createState() => _CotizacionesPageState();
}

class _CotizacionesPageState extends State<CotizacionesPage> {
  List cotizaciones;

  getClientes() async {
    http.Response response =
        await http.get(Constants.URL_API + '/cotizaciones');
    cotizaciones = json.decode(response.body);

    debugPrint(cotizaciones.toString());

    setState(() {
      // userData = data[''];
    });
  }

  @override
  void initState() {
    super.initState();
    getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotizaciones'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: cotizaciones == null ? 0 : cotizaciones.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CotizacionesDetallesPage(
                            idCotizacion: cotizaciones[index]["id"])))
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("Nombres: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${cotizaciones[index]["nombres"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Apellidos: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${cotizaciones[index]["apellidos"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Marca: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${cotizaciones[index]["marca"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Linea: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${cotizaciones[index]["linea"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Modelo: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${cotizaciones[index]["modelo"]} ",
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
            Navigator.pushNamed(context, 'cotizaciones-crear');
          }),
    );
  }
}
