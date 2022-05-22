import 'dart:developer';

import 'package:allakroapp/bloc/diseases_bloc.dart';
import 'package:allakroapp/shared_widgets/custom_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/states.dart';
import '../../../models/response_model.dart';
import '../../../providers/actuality_provider.dart';

class AdminDiseasesForm extends StatefulWidget {
  const AdminDiseasesForm({Key? key}) : super(key: key);

  @override
  State<AdminDiseasesForm> createState() => _AdminDiseasesFormState();
}

class _AdminDiseasesFormState extends State<AdminDiseasesForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maladie'),
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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['name_disease'] = val;
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
                    hintText: "Statut de la maladie",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['status'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['number_affected'] = val;
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
                    hintText: "Nombre de personnes guérie",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['number_healed'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDatePicker(
                  labelle: "date d'apparition",
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['date_appearance'] = val;
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
                    hintText: "description de la maladie",
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
              context.read<DiseasesBloc>().create(body: _formData);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Reponse"),
                    content: SizedBox(
                        height: 50,
                        child: BlocBuilder<DiseasesBloc, StateApp>(
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
                          context.read<DiseasesBloc>().getActualities();
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
