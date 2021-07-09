import 'package:flutter/material.dart';

class ConcesionariosCrearPage extends StatelessWidget {
  const ConcesionariosCrearPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Agregar concesionario'),
      backgroundColor: Colors.blueGrey,
    ));
  }
}
