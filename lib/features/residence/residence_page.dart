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
              for (var i = 0; i < 7; i++)
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Chip(
                              backgroundColor: Colors.redAccent,
                              label: Text(
                                'Occupé',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Icon(
                              CupertinoIcons.house_fill,
                            ),
                          ],
                        ),
                        Text(
                          'Mainson 3 piece',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              color: Colors.grey,
                            ),
                            Text(
                              'Allakro/ zone du nord prêt de la cheferie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.person_crop_circle),
                            RichText(
                                text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Propriétaire: ',
                                ),
                                TextSpan(
                                  text: 'Koffi Jean Setone',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.calendar),
                            RichText(
                                text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Date aménagement: ',
                                ),
                                TextSpan(
                                  text: '10/04/2009',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.calendar),
                            RichText(
                                text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Date précédent déménagement: ',
                                ),
                                TextSpan(
                                  text: '10/04/2009',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                          ],
                        ),
                        Text(
                          '''Une maison est, en droit civil français, un immeuble, mot qui désigne aussi couramment un édifice de plusieurs étages divisé en plusieurs appartements occupés ...''',
                        )
                      ],
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
