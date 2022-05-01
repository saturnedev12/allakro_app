import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../forms/admin_actuality_form.dart';

class AdminActualityPage extends StatefulWidget {
  const AdminActualityPage({Key? key}) : super(key: key);

  @override
  State<AdminActualityPage> createState() => _AdminActualityPageState();
}

class _AdminActualityPageState extends State<AdminActualityPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        tiles: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Administration des Actualités",
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
                      builder: (context) => AdminActualityForm(),
                    )),
                minVerticalPadding: 30,
                title: Text('Offre emploie COCA COLA'),
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
