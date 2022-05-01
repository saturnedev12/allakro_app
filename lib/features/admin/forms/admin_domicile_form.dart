import 'package:allakroapp/shared_widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';

class AdminDomicileForm extends StatefulWidget {
  const AdminDomicileForm({Key? key}) : super(key: key);

  @override
  State<AdminDomicileForm> createState() => _AdminDomicileFormState();
}

class _AdminDomicileFormState extends State<AdminDomicileForm> {
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
                    hintText: "Nom du domicile",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDatePicker(
                  labelle: "date d'aménagement",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDatePicker(
                  labelle: "date précédent déménagement",
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "adress",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
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
                    hintText: "description du domicile",
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InputChip(
                      label: Text('habité'),
                      selected: false,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          //isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 10,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              color: Colors.transparent,
                              child: Center(
                                child: ListView(
                                  children: <Widget>[
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintText: "Nom du nouveau propriétaire",
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
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
                                        hintText:
                                            "Contact du nouveau propriétaire",
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      child: const Text('Sauvegarder'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InputChip(
                      label: Text('nom habité'),
                      selected: true,
                      onPressed: () {},
                    ),
                  ],
                )
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
