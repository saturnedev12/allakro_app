import 'package:flutter/material.dart';

class AdminActivityForm extends StatefulWidget {
  const AdminActivityForm({Key? key}) : super(key: key);

  @override
  State<AdminActivityForm> createState() => _AdminActivityFormState();
}

class _AdminActivityFormState extends State<AdminActivityForm> {
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activité'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 8, right: 8, top: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "entrez le nom de l'activité",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "entrez le sector",
                    fillColor: Theme.of(context).colorScheme.onBackground,
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(25),
        color: Theme.of(context).colorScheme.onBackground,
        child: ElevatedButton(
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'VALIDER',
              ),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
