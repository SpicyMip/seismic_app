import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  // Estas funciones sirven para activar y desactivar las notificaciones
  // Al agregar la funcionalidad borrar la linea que esta en main.dart
  void fcmSubscribe() {
    // Esta activa las notificaciones
    _firebaseMessaging.subscribeToTopic('Temblores');
  }

  void fcmUnSubscribe() {
    // Esta desactiva las notificaciones
    _firebaseMessaging.unsubscribeFromTopic('TopicToListen');
  }
  //

  initNotification() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('=== FCM Token ===');
      print(token);

      // egNERmfIh7I:APA91bGIoWOL3daGWQjMAgqkh-s00943TJyfxoDCSY33F-Mrcr6WhlYOnu6s7Z0H21Cy_fmkj_xYMv_LF0zmesvu6fMIoBEBZ91ytoREIAvzA8BAYGOonoSbZepGhxFFiXpi8eBxE_Zw
    });
    _firebaseMessaging.configure(
      onMessage: (info) {
        print('=== On Message ===');
        print(info);

        //_mensajesStreamController.sink.add(event);
      },
      onLaunch: (info) {
        print('=== On launch ===');
        print(info);
        final noti = info['data']['comida'];
        print(noti);
      },
      onResume: (info) {
        print('=== On Resume ===');
        print(info);
        final noti = info['data']['comida'];
        print(noti);
      },
    );
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
