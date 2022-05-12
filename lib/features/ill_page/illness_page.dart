import 'package:allakroapp/bloc/diseases_bloc.dart';
import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared_widgets/illness_card.dart';

class IllnessPage extends StatelessWidget {
  const IllnessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DiseasesBloc>().getActualities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maladies'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            context.read<DiseasesBloc>().getActualities();
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: BlocBuilder<DiseasesBloc, StateApp>(
                builder: (context, state) {
                  if (state is ReadyState) {
                    return Column(
                      children: state.data
                          .map<IllnessCard>((e) => IllnessCard(
                                name: e.nameDisease,
                                description: e.description,
                                status: e.status,
                                nbAffected: e.numberAffected,
                                nbHealed: e.numberHealed,
                              ))
                          .toList(),
                    );
                  }
                  return const SizedBox(
                    height: 300,
                    child: Center(
                      //alignment: Alignment.center,
                      child: CupertinoActivityIndicator(
                        radius: 17,
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
