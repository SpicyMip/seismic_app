import 'package:flutter/material.dart';
import 'package:seismic_app/home copy.dart';
import 'package:seismic_app/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Esta parte de codigo inicia las notificaciones.
  // Las notificaciones solo se mostraran cuando la aplicacion
  // este de 2do plano, Al implementar una forma de configurar
  // recuerde borrar la linea aplicada.
  @override
  void initState() {
    super.initState();
    final pushProavider = new PushNotificationProvider();
    pushProavider.initNotification();
    //borrar esta linea al crear las configuraciones
    pushProavider.fcmSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home2(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
          accentColor: Colors.lightBlue,
        ));
  }
}
