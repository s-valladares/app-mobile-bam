import 'package:flutter/material.dart';

class VehiculosCrearPage extends StatefulWidget {
  @override
  createState() => _VehiculosCrearPage();
}

class _VehiculosCrearPage extends State<VehiculosCrearPage> {
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Scaffold(
      appBar: AppBar(
          title: Text('Agregar vehículo'), backgroundColor: Colors.blueGrey),
      body: Form(
        //1 Form como raiz de nuestro formulario
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _marca(), //2
                _linea(), //2
                _modelo(),
                _color(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _loginButton()), //2
              ],
            )),
      ),
    );
  }

  Widget _marca() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.local_taxi, color: Colors.blueGrey),
      hintText: 'Igrese la marca',
      labelText: 'Marca',
    ));
  }

  Widget _linea() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.local_taxi, color: Colors.blueGrey),
      hintText: 'Igrese la línea',
      labelText: 'Línea',
    ));
  }

  Widget _modelo() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.local_taxi, color: Colors.blueGrey),
      hintText: 'Igrese el modelo',
      labelText: 'Modelo',
    ));
  }

  Widget _color() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.local_taxi, color: Colors.blueGrey),
      hintText: 'Igrese el color',
      labelText: 'Color',
    ));
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
        ),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Éxito'),
            content: const Text('Insertado corectamente'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Text('Insertar'),
      ),
    );
  }
}
