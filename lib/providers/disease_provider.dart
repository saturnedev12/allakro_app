import 'dart:convert';

import 'package:allakroapp/providers/base/data_provider.dart';
import 'package:convert/convert.dart';

class DiseasesProvider extends DataProvider {
  Future<Map<String, dynamic>> fetchAll() async {
    String response = await getting(url: '/diseases/list');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> fetchOne({required int id}) async {
    String response = await getting(url: '/diseases/one/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> delete({required int id}) async {
    String response = await deleting(url: '/diseases/delete/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> update(
      {required int id, required Map<String, dynamic> body}) async {
    String response = await updating(url: '/diseases/update/$id', body: body);
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> create(
      {required Map<String, dynamic> body}) async {
    String response = await creating(url: '/diseases/create', body: body);
    return jsonDecode(response);
  }
}
