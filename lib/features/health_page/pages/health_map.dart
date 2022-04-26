import 'package:allakroapp/app/app.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HealthMap extends StatelessWidget {
  HealthMap({Key? key}) : super(key: key);

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(5.316667, -4.033333);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pharmatie les perles')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
