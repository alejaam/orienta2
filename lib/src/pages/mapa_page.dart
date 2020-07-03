import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:orientat/src/widgets/action.dart';
import 'package:orientat/src/widgets/drawer_widget.dart';
import 'package:latlong/latlong.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: _bottomNavigationBar(context),
        backgroundColor: Color.fromRGBO(187, 225, 250, 1),
        drawer: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Color.fromRGBO(187, 225, 250, 1)),
            child: MyDrawer()),
        appBar: AppBar(
            title: Text("Orienta2"),
            backgroundColor: Color.fromRGBO(38, 93, 130, 1),
            actions: <Widget>[MyActions()]),
        body: _crearFlutterMap());
  }

  Widget _crearFlutterMap() {
    return FlutterMap(
      options: MapOptions(center: LatLng(19.395120, -99.090810), zoom: 10),
      layers: [
        _crearMapa(),
        MarkerLayerOptions(markers: [
          Marker(
              height: 100.0,
              width: 100.0,
              point: LatLng(19.395120, -99.090810),
              builder: (context) => Container(
                    child: Icon(
                      Icons.location_on,
                      size: 70.0,
                      color: Color.fromRGBO(38, 93, 130, 1),
                    ),
                  ))
        ])
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
          '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoiYWxlamFhbSIsImEiOiJjazhzN2NlNnEwbXNkM3BwMjJ6dzF6YXF1In0._5pRyAyuEY4748h0iT-ymg',
        'id': 'mapbox.streets'
      },
    );
  }
}
