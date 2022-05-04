import 'dart:convert';

import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:allakroapp/models/actor_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';

class ActorRepository {
  Future<List<ActorModel>> getAllActuality(
      {required int perPage, required int page}) async {
    //print('totot');
    var data = await ActorProvider().fetchAll(perPage: perPage, page: page);
    //print('ACUTALITY PROVIDED $data');
    List<ActorModel> response = await data['data']
        .map<ActorModel>((e) => ActorModel.fromJson(e))
        .toList();
    return response;
  }
}
