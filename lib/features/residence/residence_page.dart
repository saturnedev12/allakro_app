import 'package:allakroapp/bloc/domicile_bloc.dart';
import 'package:allakroapp/models/domicile_model.dart';
import 'package:allakroapp/shared_widgets/domicile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/diseases_bloc.dart';
import '../../bloc/states.dart';

class ResidencePage extends StatefulWidget {
  const ResidencePage({Key? key}) : super(key: key);

  @override
  State<ResidencePage> createState() => _ResidencePageState();
}

class _ResidencePageState extends State<ResidencePage> {
  @override
  Widget build(BuildContext context) {
    context.read<DomicileBloc>().getActualities();
    return Scaffold(
      appBar: AppBar(title: Text('Domiciles')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            context.read<DomicileBloc>().getActualities();
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: BlocBuilder<DomicileBloc, StateApp>(
                builder: (context, state) {
                  if (state is ReadyState) {
                    return Column(
                      children: state.data
                          .map<DomicileCard>((e) => DomicileCard(
                                name: e.nameDomicile,
                                nameOwner: e.nameOwner,
                                dateLayout: e.dateLayout,
                                dateMove: e.dateMove,
                                description: e.description,
                                contactOwner: e.contactOwner,
                                address: e.address,
                                statut: e.status,
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
