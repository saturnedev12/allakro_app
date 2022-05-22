import 'package:allakroapp/bloc/activity_bloc.dart';
import 'package:allakroapp/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../forms/admin_activity_form.dart';

class AdminActivity extends StatefulWidget {
  const AdminActivity({Key? key}) : super(key: key);

  @override
  State<AdminActivity> createState() => _AdminActivityState();
}

class _AdminActivityState extends State<AdminActivity> {
  @override
  Widget build(BuildContext context) {
    context.read<ActivityBloc>().getActualities();
    return Scaffold(
        body: BlocBuilder<ActivityBloc, StateApp>(
      builder: (context, state) => (state is PendingState)
          ? Container(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(
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
                            "Administration des Activités",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                              onPressed: () {}, icon: Icon(CupertinoIcons.add))
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
                                    builder: (context) => AdminActivityForm(),
                                  )),
                              minVerticalPadding: 30,
                              title: Text(e.profession),
                              trailing: CupertinoButton(
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}))),
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
