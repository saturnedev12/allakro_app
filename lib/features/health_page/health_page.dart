import 'package:allakroapp/shared_widgets/health_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeathPage extends StatelessWidget {
  HeathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Centres de santé')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 6, right: 6),
          child: Column(
            children: [
              for (var i = 0; i < 5; i++) HealthCard(),
            ],
          ),
        ),
      ),
    );
  }
}
