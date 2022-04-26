import 'package:allakroapp/features/admin/bloc/forms/admin_activity_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminActivity extends StatefulWidget {
  const AdminActivity({Key? key}) : super(key: key);

  @override
  State<AdminActivity> createState() => _AdminActivityState();
}

class _AdminActivityState extends State<AdminActivity> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        tiles: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Administration des activités",
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
                      builder: (context) => AdminActivityForm(),
                    )),
                minVerticalPadding: 30,
                title: Text('Artisan de bois'),
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
