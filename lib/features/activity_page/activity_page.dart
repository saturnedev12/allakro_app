import 'package:allakroapp/bloc/activity_bloc.dart';
import 'package:allakroapp/shared_widgets/activity_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/states.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ActivityBloc>().getActualities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activités'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: BlocBuilder<ActivityBloc, StateApp>(
          builder: ((context, state) {
            if (state is ReadyState) {
              return Column(
                children: state.data
                    .map<ActivyCard>((e) => ActivyCard(
                          name: e.profession,
                          members: e.members,
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
          }),
        ),
      ),
    );
  }
}
