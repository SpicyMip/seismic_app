import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'home copy.dart';

class Evacuacion extends StatefulWidget {
  @override
  _EvacuacionState createState() => _EvacuacionState();
}

class _EvacuacionState extends State<Evacuacion> {
  final Geolocator geolocator = Geolocator();
  Position _currentPosition;
  final Home2State home2state = Home2State();
  GoogleMapController _mapController;

  var _onOf = false;
  //var _point = [-33.020852694572724, -71.56565563835588];
  var dontsafezona = [
    [-32.99116247949983, -71.54877627322703],
    [-33.00026526821508, -71.55028367662528],
    [-33.008608666250346, -71.55299700274216],
    [-33.01505529716961, -71.55812217375238],
    [-33.01505529716961, -71.55827291409221],
    [-33.01897360709743, -71.5629458646268],
    [-33.025419480014584, -71.57364842875442],
    [-33.02744161752318, -71.57726619691023],
    [-33.02547614590526, -71.58392342805328],
    [-33.030024216804634, -71.58793295929657],
    [-33.03147432956341, -71.586949749082],
    [-33.0286271030775, -71.57506344910945],
    [-33.02548774673947, -71.56879375242063],
    [-33.02585279392065, -71.56448333619821],
    [-33.03220437282034, -71.56470103399991],
    [-33.04103741694258, -71.5543386187023],
    [-33.03209486681245, -71.55494817254706],
    [-33.031401325001355, -71.55725576924502],
    [-33.0274589835634, -71.55590604302083],
    [-33.02753199148748, -71.55594958258116],
    [-33.02738597557886, -71.5518568639093],
    [-33.03059826968695, -71.54846077820287],
    [-33.03483247847411, -71.54959280677167],
    [-33.03965046855834, -71.54994112325438],
    [-33.04225876051646, -71.54952093483641],
    [-33.03827203562547, -71.54676915333843],
    [-33.03614069359538, -71.54697852801762],
    [-33.0353884429216, -71.5461709399693],
    [-33.03599024397443, -71.54527361991562],
    [-33.040704210006666, -71.54554281593171],
    [-33.04325000485811, -71.5402362661528],
    [-33.03958961129925, -71.53662753042678],
    [-33.04518601928699, -71.53186399926841],
    [-33.03934759644717, -71.52771395318348],
    [-33.03704842219275, -71.52666741982293],
    [-33.04070892136915, -71.52327520863219],
    [-33.04993512458294, -71.50880417868912],
    [-33.04839244971924, -71.50602545218007],
    [-33.02771136917786, -71.52913994290218],
    [-33.01822257730963, -71.53969231251743],
    [-33.01514491201832, -71.54259803755994],
    [-33.00539826305974, -71.53487492621095],
    [-33.001422346806045, -71.5444332322694],
    [-32.99141763648258, -71.5472624908634],
  ];
  var safezonas = [
    [-33.03879990871838, -71.52639938400202, "0"],
    [-33.03634498192958, -71.54636577315614, "1"],
    [-33.02948003129769, -71.55257544511413, "2"],
    [-33.03248999856177, -71.5649225555366, "3"],
    [-33.01992162231435, -71.56436659825623, "4"],
    [-32.98975930662811, -71.54485385525989, "5"],
    [-32.99575762030109, -71.54277171881937, "6"],
    [-32.99839772358575, -71.54360456023089, "7"],
    [-33.00926727915674, -71.53591922863917, "8"],
    [-33.014472832756766, -71.53511800619837, "9"],
    [-33.021715230298504, -71.51735099179487, "10"],
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentPosition == null
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: Stack(children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        _currentPosition.latitude, _currentPosition.longitude),
                    zoom: 16,
                  ),
                  onMapCreated: _onMapCreated,
                  mapType: MapType.hybrid,
                  polygons: _createPolygon(),
                  markers: _createMarkers(),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
                FloatingActionButton(
                  child: Icon(Icons.add_location),
                  onPressed: () {
                    _isInZona();
                    if (_onOf == true) {
                      _showDialogAlert(context);
                    } else {
                      _showDialog(context);
                    }
                  },
                )
              ])));
  }

  _isInZona() {
    dynamic distanceMax = 0.0;
    for (var i in dontsafezona) {
      for (var k in dontsafezona) {
        dynamic distance =
            (sqrt(pow((i[0] - k[0]), 2) + pow((i[1] - k[1]), 2)));
        if (distance >= distanceMax) {
          distanceMax = distance;
        }
      }
    }
    for (var i in dontsafezona) {
      dynamic distance = (sqrt(pow((i[0] - _currentPosition.latitude), 2) +
          pow((i[1] - _currentPosition.longitude), 2)));
      if (distance > distanceMax) {
        setState(() {
          _onOf = false;
        });
      } else {
        setState(() {
          _onOf = true;
        });
      }
    }
  }

  _showSegureZone() {
    dynamic distanceMin = 99999.9;
    dynamic point = [];
    for (var i in safezonas) {
      dynamic distance = (sqrt(pow((_currentPosition.latitude - i[0]), 2) +
          pow((_currentPosition.longitude - i[1]), 2)));
      if (distance <= distanceMin) {
        distanceMin = distance;
        point = LatLng(i[0], i[1]);
      }
    }
    _centerView(point);
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    for (var i in safezonas) {
      tmp.add(Marker(
          markerId: MarkerId(i[2]),
          visible: _onOf,
          position: LatLng(i[0], i[1])));
    }
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  _centerView(x) async {
    await _mapController.getVisibleRegion();
    var cameraUdapte = CameraUpdate.newLatLng(x);
    _mapController.animateCamera(cameraUdapte);
  }

  Set<Polygon> _createPolygon() {
    var pl = Set<Polygon>();
    var lista = <LatLng>[];
    for (var i in dontsafezona) {
      lista.add(LatLng(i[0], i[1]));
    }
    pl.add(
      Polygon(
          polygonId: PolygonId('Zona de Emergencia'),
          points: lista,
          strokeWidth: 2,
          strokeColor: Colors.yellow[400],
          fillColor: Colors.red.shade800.withOpacity(0.15),
          visible: _onOf),
    );
    return pl;
  }

  _showDialogAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('¡¡ALERTA!!'),
            content: Text(
                'Usted se encuentra en una zona de peligro, se le recomienda evacuar en caso de una emergencia sismica'),
            actions: <Widget>[
              FlatButton(
                child: Text("Mostrar zona segura mas cercana"),
                onPressed: () {
                  Navigator.pop(context);
                  _showSegureZone();
                },
              ),
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Usted esta a salvo'),
            content: Text(
                'Se encuentra fuera de una zona de peligro de tsunami, de todos modos tenga precausion en caso de algun sismo'),
            actions: <Widget>[
              FlatButton(
                child: Text("Aceptar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
