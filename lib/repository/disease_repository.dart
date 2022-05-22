import 'dart:convert';

import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:allakroapp/models/actor_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/disease_provider.dart';

import '../models/response_model.dart';

class DiseaseRepository {
  Future<List<DiseaseModel>> getAllDiseases() async {
    //print('totot');
    var data = await DiseasesProvider().fetchAll();
    //print('ACUTALITY PROVIDED $data');
    List<DiseaseModel> response = await data['data']
        .map<DiseaseModel>((e) => DiseaseModel.fromJson(e))
        .toList();
    return response;
  }

  Future<ResponseModel> delete(int id) async {
    print('delete');
    var data = await DiseasesProvider().delete(id: id);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> create({required Map<String, dynamic> body}) async {
    print('create');
    var data = await DiseasesProvider().create(body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> update(
      {required int id, required Map<String, dynamic> body}) async {
    print('update');
    var data = await DiseasesProvider().update(id: id, body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }
}
