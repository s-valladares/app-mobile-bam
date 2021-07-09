import 'package:flutter/material.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
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
