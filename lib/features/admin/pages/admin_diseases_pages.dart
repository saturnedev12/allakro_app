import 'package:allakroapp/bloc/diseases_bloc.dart';
import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/features/admin/forms/admn_diseases_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/actuality_bloc.dart';
import '../../../models/response_model.dart';
import '../../../providers/actuality_provider.dart';

class AdminDiseasesPage extends StatefulWidget {
  const AdminDiseasesPage({Key? key}) : super(key: key);

  @override
  State<AdminDiseasesPage> createState() => _AdminDiseasesPageState();
}

class _AdminDiseasesPageState extends State<AdminDiseasesPage> {
  @override
  Widget build(BuildContext context) {
    context.read<DiseasesBloc>().getActualities();
    return Scaffold(
        body: BlocBuilder<DiseasesBloc, StateApp>(
      builder: (context, state) => (state is PendingState)
          ? Container(
              alignment: Alignment.center,
              child: const CupertinoActivityIndicator(
                color: Colors.green,
              ),
            )
          : (state is ReadyState)
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Administration des Actualité",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminDiseasesForm(),
                                    ));
                              },
                              icon: Icon(CupertinoIcons.add))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: ListTile.divideTiles(
                          tiles: state.data.map(
                            (e) => ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminDiseasesForm(),
                                  )),
                              minVerticalPadding: 30,
                              title: Text(e.nameDisease),
                              trailing: CupertinoButton(
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  context.read<DiseasesBloc>().delete(id: e.id);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Reponse"),
                                        content: SizedBox(
                                            height: 50,
                                            child: BlocBuilder<DiseasesBloc,
                                                StateApp>(
                                              builder: (context, state) {
                                                if (state is ReadyStateOne<
                                                    ResponseModel>) {
                                                  return Center(
                                                    child: Text(
                                                        state.data.message),
                                                  );
                                                }
                                                return const Center(
                                                  child:
                                                      CupertinoActivityIndicator(),
                                                );
                                              },
                                            )),
                                        actions: [
                                          TextButton(
                                            child: const Text(
                                              "Fermer",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () {
                                              ActualityProvider()
                                                  .client
                                                  .close();

                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          color: Colors.black,
                        ).toList(),
                      ),
                    ),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  child: CupertinoActivityIndicator(
                    color: Colors.green,
                  ),
                ),
    ));
  }
}
