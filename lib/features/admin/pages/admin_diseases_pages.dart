import 'package:allakroapp/features/admin/forms/admn_diseases_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminDiseasesPage extends StatefulWidget {
  const AdminDiseasesPage({Key? key}) : super(key: key);

  @override
  State<AdminDiseasesPage> createState() => _AdminDiseasesPageState();
}

class _AdminDiseasesPageState extends State<AdminDiseasesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        tiles: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Administration des Maladies",
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
                      builder: (context) => AdminDiseasesForm(),
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
