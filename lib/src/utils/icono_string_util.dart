import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'money': Icons.money,
  'clientes': Icons.people,
  'cotizaciones': Icons.folder_open,
  'agente': Icons.person,
  'vehiculo': Icons.local_taxi,
  'concesionario': Icons.store
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blueGrey);
}
