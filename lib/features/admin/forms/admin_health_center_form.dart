import 'dart:developer';

import 'package:allakroapp/bloc/health_center_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/states.dart';
import '../../../models/response_model.dart';
import '../../../providers/actuality_provider.dart';

class AdminHealthCenterForm extends StatefulWidget {
  const AdminHealthCenterForm({Key? key}) : super(key: key);

  @override
  State<AdminHealthCenterForm> createState() => _AdminHealthCenterFormState();
}

class _AdminHealthCenterFormState extends State<AdminHealthCenterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centre de santé'),
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
                    hintText: "nom du centre de santé",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['name'] = val;
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
                    hintText: "status",
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
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "jours de garde",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['garde'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Longitude du centre de santé",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['longitude'] = val;
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
                    hintText: "Latitude du centre de santé",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'entrez une valeur';
                    }
                    _formData['latitude'] = val;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                    hintText: "description",
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
              context.read<HealthCenterBloc>().create(body: _formData);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Reponse"),
                    content: SizedBox(
                        height: 50,
                        child: BlocBuilder<HealthCenterBloc, StateApp>(
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
                          context.read<HealthCenterBloc>().getHealthCenter();
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
