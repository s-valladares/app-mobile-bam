import 'package:flutter/material.dart';

class ConcesionariosPage extends StatelessWidget {
  const ConcesionariosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concesionarios'),
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
