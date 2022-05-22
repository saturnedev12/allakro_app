import 'dart:convert';

import 'package:allakroapp/providers/base/data_provider.dart';
import 'package:convert/convert.dart';

class ActivityProvider extends DataProvider {
  Future<List<dynamic>> fetchAll() async {
    String response = await getting(url: '/activity/list');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> fetchOne({required int id}) async {
    String response = await getting(url: '/activity/one/$id');
    return jsonDecode(response);
  }
}
