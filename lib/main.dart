import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget mainWidget = Item1();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seismic App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seismic App'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Seccion de lista
              ListTile(
                leading: Icon(Icons.error),
                title: Text('Registro de sismos'),
                onTap: () {
                  setState(() {
                    mainWidget = Item1();
                  });
                },
              ),
              ListTile(
                title: Text('Contactos de emergencia'),
                onTap: () {
                  setState(() {
                    mainWidget = Item2();
                  });
                },
              ),
              ListTile(
                title: Text('Vias de evacuacion'),
                onTap: () {
                  mainWidget = Item3();
                },
              )
              // Drawer items go in here
            ],
          ),
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Registro de sismos'),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Contactos de emergencia'),
    );
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Contactos de emergencia'),
    );
  }
}
