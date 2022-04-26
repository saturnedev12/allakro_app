import 'package:allakroapp/shared_widgets/atuality_card.dart';
import 'package:flutter/material.dart';

class ActualityPage extends StatelessWidget {
  const ActualityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualités'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) ActualityCard(),
            ],
          ),
        ),
      ),
    );
  }
}
