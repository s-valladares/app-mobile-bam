import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BAM App'),
        backgroundColor: Colors.blueGrey,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (contex, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, contex),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((item) {
      final widgetTemp = ListTile(
          title: Text(item['texto']),
          leading: getIcon(item['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey),
          onTap: () {
            //final routes = MaterialPageRoute(builder: (context) => AlertPage());

            Navigator.pushNamed(context, item['ruta']);
          });

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
