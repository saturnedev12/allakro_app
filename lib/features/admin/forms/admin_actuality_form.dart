import 'package:flutter/material.dart';

class AdminActualityForm extends StatefulWidget {
  const AdminActualityForm({Key? key}) : super(key: key);

  @override
  State<AdminActualityForm> createState() => _AdminActualityFormState();
}

class _AdminActualityFormState extends State<AdminActualityForm> {
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualité'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 8, right: 8, top: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Titre de l'actualité",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Nom du publicateur",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "type d'actualité",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLines: 50,
                  minLines: 10,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onBackground,
                    iconColor: Colors.black,
                    hintText: "Text de l'actualité",
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
