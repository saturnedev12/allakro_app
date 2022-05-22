import 'package:allakroapp/bloc/actuality_bloc.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/base/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/activity_bloc.dart';
import '../../../bloc/states.dart';
import '../../../models/response_model.dart';
import '../forms/admin_actuality_form.dart';
import '../widgets/alert_dialog.dart';

class AdminActualityPage extends StatefulWidget {
  const AdminActualityPage({Key? key}) : super(key: key);

  @override
  State<AdminActualityPage> createState() => _AdminActualityPageState();
}

class _AdminActualityPageState extends State<AdminActualityPage> {
  @override
  Widget build(BuildContext context) {
    context.read<ActualityBloc>().getActualities();
    return Scaffold(
        body: BlocBuilder<ActualityBloc, StateApp>(
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
                                      builder: (context) =>
                                          AdminActualityForm(),
                                    ));
                              },
                              icon: Icon(CupertinoIcons.add))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: ListTile.divideTiles(
                          tiles: state.data.map((e) => ListTile(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminActualityForm(),
                                    )),
                                minVerticalPadding: 30,
                                title: Text(e.title),
                                trailing: CupertinoButton(
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ActualityBloc>()
                                        .delete(id: e.id);
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Reponse"),
                                          content: SizedBox(
                                              height: 50,
                                              child: BlocBuilder<ActualityBloc,
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
                                                style: TextStyle(
                                                    color: Colors.red),
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
                              )),
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
