import 'package:allakroapp/features/admin/bloc/forms/admin_activity_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/forms/admin_health_center_form.dart';

class AdminHealthCenterPage extends StatefulWidget {
  const AdminHealthCenterPage({Key? key}) : super(key: key);

  @override
  State<AdminHealthCenterPage> createState() => _AdminHealthCenterPageState();
}

class _AdminHealthCenterPageState extends State<AdminHealthCenterPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        tiles: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Administration des Centres de santé",
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
                      builder: (context) => AdminHealthCenterForm(),
                    )),
                minVerticalPadding: 30,
                title: Text('Jean koffi Seri'),
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
