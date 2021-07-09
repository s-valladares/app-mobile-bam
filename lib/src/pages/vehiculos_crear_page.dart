import 'package:flutter/material.dart';

class VehiculosCrearPage extends StatelessWidget {
  const VehiculosCrearPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Agregar vehículo'),
      backgroundColor: Colors.blueGrey,
    ));
  }
}
