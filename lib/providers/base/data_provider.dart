import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class DataProvider {
  var client = http.Client();
  String baseUrl = 'https://fast-beyond-46825.herokuapp.com/api';
  final Map<String, String> _requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  Future<String> getting({required String url}) async {
    String _url = baseUrl + url;
    log(_url);
    http.Response response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      inspect(response.body);
      return response.body;
    }
    return '{}';
  }

  Future<String> deleting({required String url}) async {
    String _url = baseUrl + url;
    log(_url);
    http.Response response =
        await http.delete(Uri.parse(_url), headers: _requestHeaders);
    if (response.statusCode == 200) {
      inspect(response.body);
      return response.body;
    }
    return '{}';
  }

  Future<String> updating(
      {required String url, required Map<String, dynamic> body}) async {
    String _url = baseUrl + url;
    log(_url);
    http.Response response = await http.put(Uri.parse(_url),
        body: jsonEncode(body), headers: _requestHeaders);
    if (response.statusCode == 200) {
      inspect(response.body);
      return response.body;
    }
    return '{}';
  }

  Future<String> creating({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    String _url = baseUrl + url;
    log(_url);
    http.Response response = await http.post(Uri.parse(_url),
        body: jsonEncode(body), headers: _requestHeaders);
    inspect(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return '{}';
  }
}
