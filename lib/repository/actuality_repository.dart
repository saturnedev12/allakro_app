import 'dart:convert';

import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/response_model.dart';
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

  Future<ResponseModel> delete(int id) async {
    print('delete');
    var data = await ActualityProvider().delete(id: id);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> create({required Map<String, dynamic> body}) async {
    print('create');
    var data = await ActualityProvider().create(body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> update(
      {required int id, required Map<String, dynamic> body}) async {
    print('update');
    var data = await ActualityProvider().update(id: id, body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }
}
