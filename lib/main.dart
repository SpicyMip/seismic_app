import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavBar Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('NavBar Tutorial'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Registro de sismos'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Contactos de emergencia'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Vias de evacuacion'),
                onTap: () {},
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
      body: Text('Item 1'),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Item 2'),
    );
  }
}
