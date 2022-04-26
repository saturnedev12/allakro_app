import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidencePage extends StatefulWidget {
  const ResidencePage({Key? key}) : super(key: key);

  @override
  State<ResidencePage> createState() => _ResidencePageState();
}

class _ResidencePageState extends State<ResidencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text('Domiciles')),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
          child: Column(
            children: [
              Card(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: Icon(
                              CupertinoIcons.house_fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
