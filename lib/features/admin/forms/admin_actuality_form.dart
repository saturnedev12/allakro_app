import 'dart:developer';

import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/actuality_bloc.dart';
import '../../../providers/actuality_provider.dart';

class AdminActualityForm extends StatefulWidget {
  const AdminActualityForm({Key? key}) : super(key: key);

  @override
  State<AdminActualityForm> createState() => _AdminActualityFormState();
}

class _AdminActualityFormState extends State<AdminActualityForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['title'] = val;
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
                    hintText: "Nom du publicateur",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['name_publisher'] = val;
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
                    hintText: "type d'actualité",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['type_actuality'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLines: 50,
                  minLines: 10,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onBackground,
                    iconColor: Colors.black,
                    hintText: "Text de l'actualité",
                    filled: true,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['text_page'] = val;
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
            _formData['date_publication'] = DateTime.now().toString();
            inspect(_formData);
            if (_formKey.currentState!.validate()) {
              context.read<ActualityBloc>().create(body: _formData);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Reponse"),
                    content: SizedBox(
                        height: 50,
                        child: BlocBuilder<ActualityBloc, StateApp>(
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
                          context.read<ActualityBloc>().getActualities();
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
