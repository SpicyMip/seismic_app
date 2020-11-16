import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// se encarga de ordenar la estructura del programa
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AppTembloresC', home: paginaInicio('Botones principales'));
  }

  Widget paginaInicio(String title) {
    // Texto Registro
    final tituloRegistro = Container(
      child: Text(
        'Registro de sismos',
        style: TextStyle(
            fontWeight: FontWeight.w400, letterSpacing: 0.5, fontSize: 30),
      ),
    );

    final tituloZonas = Container(
      child: Text(
        'Zonas de Evacuacion',
        style: TextStyle(
            fontWeight: FontWeight.w400, letterSpacing: 0.5, fontSize: 30),
      ),
    );

    // Ordena la UI
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: (Container(
          child: tituloRegistro,
        )),
      ),
    );
  }
}
