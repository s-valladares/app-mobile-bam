import 'package:componentes/src/pages/clientes_detalles_page.dart';
import 'package:componentes/src/pages/vehiculos_detalles_page.dart';
import 'package:componentes/src/utils/Constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClientesPage extends StatefulWidget {
  @override
  createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  List clientes;

  getClientes() async {
    http.Response response = await http.get(Constants.URL_API + '/clientes');
    clientes = json.decode(response.body);

    debugPrint(clientes.toString());

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
        title: Text('Clientes'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: clientes == null ? 0 : clientes.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClientesDetallesPage(
                            idCliente: clientes[index]["id"])))
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
                          Text("${clientes[index]["nombres"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Apellidos: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${clientes[index]["apellidos"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Dirección: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${clientes[index]["direccion"]} ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Teléfono: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w500)),
                          Text("${clientes[index]["telefono"]} ",
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
            Navigator.pushNamed(context, 'clientes-crear');
          }),
    );
  }
}
