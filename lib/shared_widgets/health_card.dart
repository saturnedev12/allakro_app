import 'dart:developer';

import 'package:allakroapp/features/health_page/pages/health_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HealthCard extends StatelessWidget {
  HealthCard({
    Key? key,
    required this.name,
    required this.status,
    required this.garde,
    required this.description,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);
  String name;
  String status;
  String garde;
  String description;
  String longitude;
  String latitude;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 300,
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Chip(
                  label: Text(
                    status,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 242, 253, 251),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                garde,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HealthMap(
                          latitude: latitude,
                          longitude: longitude,
                        ),
                      ));
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.greenAccent.withOpacity(0.5))),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: Center(
                    child: Text(
                      'VOIR LA LOCALISATION',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
            /*SizedBox(
              height: 400,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
