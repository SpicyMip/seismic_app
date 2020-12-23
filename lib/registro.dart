import 'package:flutter/material.dart';
import 'package:seismic_app/Temblores.dart';
import 'db.dart';

class Registro extends StatelessWidget {
  //Linea importante
  final Database data = Database();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            //linea importante
            future: data.getTemblores(),
            //
            builder: (BuildContext context,
                AsyncSnapshot<List<Temblores>> snapshot) {
              if (snapshot.hasData) {
                List<Temblores> temblores = snapshot.data;
                return ListView(
                  children: temblores
                      .map((Temblores temblores) => Card(
                              child: Column(
                            children: <Widget>[
                              Text('Referencia: ' + temblores.refGeografica),
                              Text('Magnitud: ' + temblores.magnitud),
                              Text(
                                  'Fecha: ' + temblores.fecha.substring(0, 10)),
                              Text('Hora: ' +
                                  temblores.fecha.substring(
                                    11,
                                  ) +
                                  ' Hrs.'),
                              Text('Profundidad: ' +
                                  temblores.profundidad +
                                  ' Km')
                            ],
                          )))
                      .toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
