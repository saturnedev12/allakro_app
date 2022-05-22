import 'dart:convert';

import 'package:allakroapp/providers/base/data_provider.dart';
import 'package:convert/convert.dart';

class DomicileProvider extends DataProvider {
  Future<Map<String, dynamic>> fetchAll() async {
    String response = await getting(url: '/domicile/list');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> fetchOne({required int id}) async {
    String response = await getting(url: '/domicile/one/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> delete({required int id}) async {
    String response = await deleting(url: '/domicile/delete/$id');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> update(
      {required int id, required Map<String, dynamic> body}) async {
    String response = await updating(url: '/domicile/update/$id', body: body);
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> create(
      {required Map<String, dynamic> body}) async {
    String response = await creating(url: '/domicile/create', body: body);
    return jsonDecode(response);
  }
}
