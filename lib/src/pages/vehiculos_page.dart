import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class VehiculosPage extends StatelessWidget {
  const VehiculosPage({Key key}) : super(key: key);

  getUsers() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehículos'),
        backgroundColor: Colors.blueGrey,
      ),
      // body: ListView.builder(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
