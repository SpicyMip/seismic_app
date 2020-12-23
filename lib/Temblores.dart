import 'package:flutter/cupertino.dart';

class Temblores {
  final String fecha;
  final String latitud;
  final String longitud;
  final String profundidad;
  final String magnitud;
  final String agencia;
  final String refGeografica;
  final String fechaUpdate;

  Temblores({
    @required this.fecha,
    @required this.latitud,
    @required this.longitud,
    @required this.profundidad,
    @required this.magnitud,
    @required this.agencia,
    @required this.refGeografica,
    @required this.fechaUpdate,
  });

  factory Temblores.fromJson(Map<String, dynamic> json) {
    return Temblores(
      fecha: json['Fecha'] as String,
      latitud: json['Latitud'] as String,
      longitud: json['Longitud'] as String,
      profundidad: json['Profundidad'] as String,
      magnitud: json['Magnitud'] as String,
      agencia: json['Agencia'] as String,
      refGeografica: json['RefGeografica'] as String,
      fechaUpdate: json['FechaUpdate'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Fecha': this.fecha,
      'Latitud': this.latitud,
      'Longitud': this.longitud,
      'Profundidad': this.profundidad,
      'Magnitud': this.magnitud,
      'Agencia': this.agencia,
      'RefGeografica': this.refGeografica,
      'FechaUpdate': this.fechaUpdate
    };
  }
}

Temblores createTemblor(record) {
  Map<String, dynamic> attributes = {
    'Fecha': '',
    'Latitud': '',
    'Longitud': '',
    'Profundidad': '',
    'Magnitud': '',
    'Agencia': '',
    'RefGeografica': '',
    'FechaUpdate': ''
  };
  record.forEach((key, value) => {attributes[key] = value});
  Temblores temblor = new Temblores(
    fecha: attributes['Fecha'],
    latitud: attributes['Latitud'],
    longitud: attributes['Longitud'],
    profundidad: attributes['Profundidad'],
    magnitud: attributes['Magnitud'],
    agencia: attributes['Agencia'],
    refGeografica: attributes['RefGeografica'],
    fechaUpdate: attributes['FechaUpdate'],
  );
  return temblor;
}
