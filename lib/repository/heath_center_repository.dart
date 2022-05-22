import 'dart:convert';

import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:allakroapp/models/actor_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/domicile_model.dart';
import 'package:allakroapp/models/health_center_model.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/domiciles_provider.dart';
import 'package:allakroapp/providers/heatth_center_provider.dart';

import '../models/response_model.dart';

class HeathCenterRepository {
  Future<List<HealthCenterModel>> getHealthCenter() async {
    //print('totot');
    var data = await HealthCenterProvider().fetchAll();
    //print('ACUTALITY PROVIDED $data');
    List<HealthCenterModel> response = await data['data']
        .map<HealthCenterModel>((e) => HealthCenterModel.fromJson(e))
        .toList();
    return response;
  }

  Future<ResponseModel> delete(int id) async {
    print('delete');
    var data = await HealthCenterProvider().delete(id: id);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> create({required Map<String, dynamic> body}) async {
    print('create');
    var data = await HealthCenterProvider().create(body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> update(
      {required int id, required Map<String, dynamic> body}) async {
    print('update');
    var data = await HealthCenterProvider().update(id: id, body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }
}
