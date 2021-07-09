import 'package:flutter/material.dart';

class CotizacionesPage extends StatelessWidget {
  const CotizacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotizaciones'),
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
