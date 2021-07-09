import 'package:flutter/material.dart';

class ConcesionariosCrearPage extends StatefulWidget {
  @override
  createState() => _ConcesionariosCrearPage();
}

class _ConcesionariosCrearPage extends State<ConcesionariosCrearPage> {
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Scaffold(
      appBar: AppBar(
          title: Text('Agregar concesionario'),
          backgroundColor: Colors.blueGrey),
      body: Form(
        //1 Form como raiz de nuestro formulario
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nombres(), //2
                _apellidos(), //2
                _direccion(),
                _telefono(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _loginButton()), //2
              ],
            )),
      ),
    );
  }

  Widget _nombres() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.person, color: Colors.blueGrey),
      hintText: 'Igrese los nombres',
      labelText: 'Nombres',
    ));
  }

  Widget _apellidos() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.person, color: Colors.blueGrey),
      hintText: 'Igrese los apellidos',
      labelText: 'Apellidos',
    ));
  }

  Widget _direccion() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.book, color: Colors.blueGrey),
      hintText: 'Igrese la direccion',
      labelText: 'Dirección',
    ));
  }

  Widget _telefono() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.phone, color: Colors.blueGrey),
      hintText: 'Igrese el teléfono',
      labelText: 'Teléfono',
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
