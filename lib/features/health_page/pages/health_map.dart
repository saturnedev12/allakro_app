import 'dart:developer';

import 'package:allakroapp/app/app.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HealthMap extends StatelessWidget {
  HealthMap({Key? key, required this.longitude, required this.latitude})
      : super(key: key);
  String longitude;
  String latitude;
  late GoogleMapController mapController;

  //final LatLng _center = LatLng(latitude, double.parse(longitude))
  // LatLng(5.316667, -4.033333);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    inspect(LatLng(double.parse(latitude), double.parse(longitude)));
    return Scaffold(
      appBar: AppBar(title: Text('Pharmatie les perles')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(latitude), double.parse(longitude)),
          zoom: 11.0,
        ),
      ),
    );
  }
}
