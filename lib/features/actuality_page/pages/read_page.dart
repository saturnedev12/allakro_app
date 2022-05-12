import 'package:allakroapp/app/app.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  ReadPage({
    Key? key,
    required this.title,
    required this.datePubli,
    required this.publisher,
    required this.type,
    required this.vews,
    required this.text,
  }) : super(key: key);
  String title;
  String type;
  String publisher;
  int vews;
  String datePubli;
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                        backgroundColor: Colors.blueGrey,
                        padding: EdgeInsets.all(0),
                        label: Text(
                          type,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )),
                    SizedBox(
                      width: 120,
                      height: 28,
                      child: ListTile(
                        dense: true,
                        leading: Icon(Icons.remove_red_eye),
                        trailing: Text('100 vues'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Publié le $datePubli'),
                SizedBox(
                  height: 10,
                ),
                Text(text),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      publisher,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
