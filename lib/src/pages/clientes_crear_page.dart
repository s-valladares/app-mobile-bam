import 'package:flutter/material.dart';

class ClientesCrearPage extends StatelessWidget {
  const ClientesCrearPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Agregar cliente'),
      backgroundColor: Colors.blueGrey,
    ));
  }
}
