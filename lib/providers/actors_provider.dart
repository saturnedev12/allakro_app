import 'dart:convert';

import 'package:allakroapp/providers/data_provider.dart';
import 'package:convert/convert.dart';

class ActorProvider extends DataProvider {
  Future<Map<String, dynamic>> fetchAll(
      {required int perPage, required int page}) async {
    String response =
        await getting(url: '/activity/list?perPga=$perPage&page=$page');
    return jsonDecode(response);
  }

  Future<Map<String, dynamic>> fetchOne({required int id}) async {
    String response = await getting(url: '/activity/one/$id');
    return jsonDecode(response);
  }
}
