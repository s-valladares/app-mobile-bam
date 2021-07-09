import 'package:flutter/material.dart';

class CotizacionesCrearPage extends StatelessWidget {
  const CotizacionesCrearPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Agregar cotización'),
      backgroundColor: Colors.blueGrey,
    ));
  }
}
