import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../forms/admin_domicile_form.dart';
import '../forms/admin_health_center_form.dart';

class AdminDomicilePage extends StatefulWidget {
  const AdminDomicilePage({Key? key}) : super(key: key);

  @override
  State<AdminDomicilePage> createState() => _AdminDomicilePageState();
}

class _AdminDomicilePageState extends State<AdminDomicilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        tiles: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Administration des Domiciles",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          for (var i = 0; i < 10; i++)
            ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminDomicileForm(),
                    )),
                minVerticalPadding: 30,
                title: Text('Maison 3 piece'),
                trailing: CupertinoButton(
                    child: Icon(
                      CupertinoIcons.delete,
                      color: Colors.black,
                    ),
                    onPressed: () {})),
        ],
        color: Colors.black,
      ).toList(),
    );
  }
}
