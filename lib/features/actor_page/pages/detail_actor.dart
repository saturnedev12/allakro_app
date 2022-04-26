import 'package:flutter/material.dart';

class DetailActor extends StatelessWidget {
  const DetailActor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                Text(
                  'Kristin Watson',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('27 ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
