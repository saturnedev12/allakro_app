import 'package:flutter/material.dart';

import '../../shared_widgets/illness_card.dart';

class IllnessPage extends StatelessWidget {
  const IllnessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maladies'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) IllnessCard(),
            ],
          ),
        ),
      ),
    );
  }
}
