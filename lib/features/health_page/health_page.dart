import 'package:allakroapp/bloc/health_center_bloc.dart';
import 'package:allakroapp/models/health_center_model.dart';
import 'package:allakroapp/shared_widgets/health_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bloc/diseases_bloc.dart';
import '../../bloc/states.dart';

class HeathPage extends StatelessWidget {
  HeathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HealthCenterBloc>().getHealthCenter();
    return Scaffold(
      appBar: AppBar(title: Text('Centres de santé')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            context.read<HealthCenterBloc>().getHealthCenter();
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: BlocBuilder<HealthCenterBloc, StateApp>(
                builder: (context, state) {
                  if (state is ReadyState) {
                    return Column(
                      children: state.data
                          .map<HealthCard>((e) => HealthCard(
                                status: e.status,
                                description: e.description,
                                name: e.name,
                                garde: e.garde,
                                latitude: e.latitude,
                                longitude: e.longitude,
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
