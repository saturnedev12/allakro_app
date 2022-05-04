import 'dart:convert';

import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:allakroapp/models/actor_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/disease_provider.dart';

class DiseaseRepository {
  Future<List<DiseaseModel>> getAllActuality(
      {required int perPage, required int page}) async {
    //print('totot');
    var data = await DiseasesProvider().fetchAll();
    //print('ACUTALITY PROVIDED $data');
    List<DiseaseModel> response = await data['data']
        .map<DiseaseModel>((e) => DiseaseModel.fromJson(e))
        .toList();
    return response;
  }
}
