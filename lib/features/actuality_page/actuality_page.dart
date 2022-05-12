import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/shared_widgets/atuality_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/actuality_bloc.dart';

class ActualityPage extends StatelessWidget {
  const ActualityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ActualityBloc>().getActualities();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualités'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            context.read<ActualityBloc>().getActualities();
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: BlocBuilder<ActualityBloc, StateApp>(
              builder: ((context, state) {
                if (state is ReadyState) {
                  return Column(
                    children: state.data
                        .map<ActualityCard>((e) => ActualityCard(
                              title: e.title,
                              type: e.typeActuality,
                              vews: e.views,
                              datePubli: e.datePublication,
                              publisher: e.namePublisher,
                              text: e.textPage,
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
        ),
      ),
    );
  }
}
