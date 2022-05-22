import 'dart:developer';

import 'package:allakroapp/bloc/domicile_bloc.dart';
import 'package:allakroapp/shared_widgets/custom_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/states.dart';
import '../../../models/response_model.dart';
import '../../../providers/actuality_provider.dart';

class AdminDomicileForm extends StatefulWidget {
  const AdminDomicileForm({Key? key}) : super(key: key);

  @override
  State<AdminDomicileForm> createState() => _AdminDomicileFormState();
}

class _AdminDomicileFormState extends State<AdminDomicileForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  bool isHabite = false;
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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['name_domicile'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDatePicker(
                  labelle: "date d'aménagement",
                  validator: (val) {
                    _formData['date_layout'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDatePicker(
                  labelle: "date précédent déménagement",
                  validator: (val) {
                    _formData['date_layout'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "adress",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['address'] = val;
                    return null;
                  },
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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['description'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InputChip(
                      label: Text('habité'),
                      selected: isHabite,
                      onPressed: () {
                        setState(() {
                          isHabite = true;
                        });

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
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'entrez une valeur';
                                        }
                                        _formData['name_owner'] = val;
                                        return null;
                                      },
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
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'entrez une valeur';
                                        }
                                        _formData['contact_owner'] = val;
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                        child: const Text('Sauvegarder'),
                                        onPressed: () {
                                          setState(() {
                                            isHabite = false;
                                          });
                                          Navigator.pop(context);
                                        })
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
                      selected: !isHabite,
                      onPressed: () {
                        setState(() {
                          isHabite = false;
                        });
                        _formData['contact_owner'] = null;
                        _formData['name_owner'] = null;
                      },
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
          onPressed: () {
            inspect(_formData);
            if (_formKey.currentState!.validate()) {
              context.read<DomicileBloc>().create(body: _formData);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Reponse"),
                    content: SizedBox(
                        height: 50,
                        child: BlocBuilder<DomicileBloc, StateApp>(
                          builder: (context, state) {
                            if (state is ReadyStateOne<ResponseModel>) {
                              return Center(
                                child: Text(state.data.message),
                              );
                            }
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          },
                        )),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Fermer",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          ActualityProvider().client.close();
                          context.read<DomicileBloc>().getActualities();
                          int _count = 0;

                          Navigator.popUntil(context, (route) => _count++ >= 2);
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
