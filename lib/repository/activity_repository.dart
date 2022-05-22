import 'dart:convert';
import 'dart:developer';

import 'package:allakroapp/models/activity_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/providers/activity_provider.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';

import '../models/response_model.dart';

class ActivityRepository {
  Future<List<ActivityModel>> getAllActuality() async {
    print('totot');
    var data = await ActivityProvider().fetchAll();
    //print('ACUTALITY PROVIDED $data');
    List<ActivityModel> response =
        data.map<ActivityModel>((e) => ActivityModel.fromJson(e)).toList();
    inspect(response);
    return response;
  }

  Future<ResponseModel> delete(int id) async {
    print('delete');
    var data = await ActorProvider().delete(id: id);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> create({required Map<String, dynamic> body}) async {
    print('create');
    var data = await ActorProvider().create(body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }

  Future<ResponseModel> update(
      {required int id, required Map<String, dynamic> body}) async {
    print('update');
    var data = await ActorProvider().update(id: id, body: body);
    ResponseModel response = ResponseModel.fromJson(data);
    return response;
  }
}
