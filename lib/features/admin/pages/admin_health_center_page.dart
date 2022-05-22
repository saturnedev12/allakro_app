import 'package:allakroapp/bloc/health_center_bloc.dart';
import 'package:allakroapp/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/response_model.dart';
import '../../../providers/actuality_provider.dart';
import '../forms/admin_health_center_form.dart';

class AdminHealthCenterPage extends StatefulWidget {
  const AdminHealthCenterPage({Key? key}) : super(key: key);

  @override
  State<AdminHealthCenterPage> createState() => _AdminHealthCenterPageState();
}

class _AdminHealthCenterPageState extends State<AdminHealthCenterPage> {
  @override
  Widget build(BuildContext context) {
    context.read<HealthCenterBloc>().getHealthCenter();
    return Scaffold(
        body: BlocBuilder<HealthCenterBloc, StateApp>(
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
                            "Administration des Centre de santé",
                            overflow: TextOverflow.clip,
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
                                          AdminHealthCenterForm(),
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
                                        AdminHealthCenterForm(),
                                  )),
                              minVerticalPadding: 30,
                              title: Text(e.name),
                              trailing: CupertinoButton(
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  context
                                      .read<HealthCenterBloc>()
                                      .delete(id: e.id);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Reponse"),
                                        content: SizedBox(
                                            height: 50,
                                            child: BlocBuilder<HealthCenterBloc,
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
                              ))),
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
