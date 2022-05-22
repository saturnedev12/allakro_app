import 'dart:convert';
import 'dart:developer';

import 'package:allakroapp/providers/base/data_provider.dart';
import 'package:convert/convert.dart';

class ActualityProvider extends DataProvider {
  Future<Map<String, dynamic>> fetchAll() async {
    String response = await getting(url: '/actuality/list');
    //print(response);
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> fetchOne({required int id}) async {
    String response = await getting(url: '/actuality/one/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> delete({required int id}) async {
    String response = await deleting(url: '/actuality/delete/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> update(
      {required int id, required Map<String, dynamic> body}) async {
    String response = await updating(url: '/actuality/update/$id', body: body);
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> create(
      {required Map<String, dynamic> body}) async {
    String response = await creating(url: '/actuality/create', body: body);
    inspect(response);
    return jsonDecode(response);
  }
}
