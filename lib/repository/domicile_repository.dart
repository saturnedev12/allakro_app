import 'dart:convert';

import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:allakroapp/models/actor_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/domicile_model.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/domiciles_provider.dart';

class DomicileRepository {
  Future<List<DomicileModel>> getAllDomicile() async {
    //print('totot');
    var data = await DomicileProvider().fetchAll();
    //print('ACUTALITY PROVIDED $data');
    List<DomicileModel> response = await data['data']
        .map<DomicileModel>((e) => DomicileModel.fromJson(e))
        .toList();
    return response;
  }
}
