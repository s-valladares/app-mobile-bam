import 'package:flutter/material.dart';

class AgentesCrearPage extends StatelessWidget {
  const AgentesCrearPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Agregar agente'),
      backgroundColor: Colors.blueGrey,
    ));
  }
}
