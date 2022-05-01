import 'package:allakroapp/shared_widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';

class AdminDiseasesForm extends StatefulWidget {
  const AdminDiseasesForm({Key? key}) : super(key: key);

  @override
  State<AdminDiseasesForm> createState() => _AdminDiseasesFormState();
}

class _AdminDiseasesFormState extends State<AdminDiseasesForm> {
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maladie'),
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
                    hintText: "Nom de la maladie",
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
                    hintText: "Statut de la maladie",
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Nombre de personnes affectés",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Nombre de personnes guérie",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDatePicker(
                  labelle: "date d'apparition",
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLines: 10,
                  minLines: 8,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onBackground,
                    iconColor: Colors.black,
                    hintText: "description de la maladie",
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
