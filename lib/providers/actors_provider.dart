import 'dart:convert';

import 'package:allakroapp/providers/base/data_provider.dart';
import 'package:convert/convert.dart';

class ActorProvider extends DataProvider {
  Future<Map<String, dynamic>> fetchAll(
      {required int perPage, required int page, String? activity}) async {
    String response =
        await getting(url: '/actor/list?perPga=$perPage&page=$page');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> fetchAllActivity(
      {required int perPage,
      required int page,
      required String activity}) async {
    String response = await getting(
        url:
            '/actor/listActivity?perPga=$perPage&page=$page&profession=$activity');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> delete({required int id}) async {
    String response = await deleting(url: '/actor/delete/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> update(
      {required int id, required Map<String, dynamic> body}) async {
    String response = await updating(url: '/actor/update/$id', body: body);
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> create(
      {required Map<String, dynamic> body}) async {
    String response = await creating(url: '/actor/create', body: body);
    return jsonDecode(response);
  }
}
