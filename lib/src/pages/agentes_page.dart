import 'package:flutter/material.dart';

class AgentesPage extends StatelessWidget {
  const AgentesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agentes'),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
