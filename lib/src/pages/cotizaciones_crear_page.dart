import 'package:flutter/material.dart';

class CotizacionesCrearPage extends StatefulWidget {
  @override
  createState() => _CotizacionesCrearPage();
}

class _CotizacionesCrearPage extends State<CotizacionesCrearPage> {
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Scaffold(
      appBar: AppBar(
          title: Text('Agregar cotización'), backgroundColor: Colors.blueGrey),
      body: Form(
        //1 Form como raiz de nuestro formulario
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _agenteInput(), //2
                _clienteInput(), //2
                _vehiculoInput(),
                _cantidadInput(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _loginButton()), //2
              ],
            )),
      ),
    );
  }

  Widget _agenteInput() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.person, color: Colors.blueGrey),
      hintText: 'Inserte el agente',
      labelText: 'Agente',
    ));
  }

  Widget _clienteInput() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.person, color: Colors.blueGrey),
      hintText: 'Inserte el cliente',
      labelText: 'Cliente',
    ));
  }

  Widget _vehiculoInput() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.taxi_alert, color: Colors.blueGrey),
      hintText: 'Inserte el vehículo',
      labelText: 'Vehículo',
    ));
  }

  Widget _cantidadInput() {
    return TextFormField(
        decoration: const InputDecoration(
      icon: Icon(Icons.countertops, color: Colors.blueGrey),
      hintText: 'Inserte la cantidad',
      labelText: 'Cantidad',
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
