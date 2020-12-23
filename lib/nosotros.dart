import 'package:flutter/material.dart';

class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
      Card(
          color: Colors.green[200],
          margin: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 40.0,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Seismic App es una aplicación desarrollada en el framework Flutter, a base del lenguaje dart. Esta aplicación registra, almacena y muestra la información de los movimientos sismicos ocurridos en el país. Cuenta con una interfaz sencilla e intuitiva de usar, además de una serie de herramientas muy útiles al momento de enfrentarse con una emergencia. Entre ellas podemos encontar un sistema de mapeado, que nos permite saber si nos encontramos en una zona de riesgo y, en el caso de ser asi, genera una ruta a la zona de seguridad más cercana y, por otro lado, consta de un sistema de pre-marcado a los números de emergencia. Además un sistema de notificaciones que alertarán, dependiendo de cada usuario, los sismo de cierta magnitud.',
                  style: TextStyle(fontSize: 18.0),
                ),
              )
            ],
          )),
      Card(
          color: Colors.blue[200],
          margin: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 40.0,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'AZP, es un grupo de 3 estudiantes de primer año en Ingeniería Civil en Informática de la Universidad Federico Santa María.',
                  style: TextStyle(fontSize: 18.0),
                ),
              )
            ],
          )),
    ])));
  }
}
