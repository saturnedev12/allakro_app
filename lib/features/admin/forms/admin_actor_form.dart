import 'package:allakroapp/shared_widgets/custom_date_picker.dart';
import 'package:allakroapp/shared_widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class AdminActorForm extends StatefulWidget {
  const AdminActorForm({Key? key}) : super(key: key);

  @override
  State<AdminActorForm> createState() => _AdminActorFormState();
}

class _AdminActorFormState extends State<AdminActorForm> {
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domicile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
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
                    hintText: "Nom",
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
                    hintText: "Email",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Telephone",
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
                    hintText: "Age",
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
                    hintText: "Pays de naissance",
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
                    hintText: "Nationnalité",
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
                    hintText: "Statut matrimonial",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropDownField(
                  items: ['OUI', 'NON'],
                  labelText: 'lecture',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Niveau d'étude",
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
                    hintText: "Nombre d'enfant",
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
                    hintText: "Niveau d'étude",
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
                    hintText: "Réseau sociaux",
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
                    hintText: "Statut matrimonial",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).colorScheme.onBackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Activités'),
                      Wrap(
                        children: [
                          for (var i = 0; i < 10; i++)
                            InputChip(
                              label: Text(
                                'menusierie',
                              ),
                            ),
                          SizedBox(
                            width: 10,
                          ),
                          InputChip(
                            label: SizedBox(
                                child: SizedBox(
                                    height: 40, child: Icon(Icons.add))),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height - 50,
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    color: Colors.transparent,
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(25),
        color: Theme.of(context).colorScheme.background,
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
