import 'dart:convert';

import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/providers/actuality_provider.dart';

class ActualityRepository {
  Future<List<ActualityModel>> getAllActuality() async {
    print('totot');
    var data = await ActualityProvider().fetchAll();
    //print('ACUTALITY PROVIDED $data');
    List<ActualityModel> response = await data['data']
        .map<ActualityModel>((e) => ActualityModel.fromJson(e))
        .toList();
    return response;
  }
}
