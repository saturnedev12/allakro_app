import 'package:http/http.dart' as http;

abstract class DataProvider {
  var client = http.Client();
  String baseUrl = 'http://192.168.1.191:8000/api';
  Future<String> getting({required String url}) async {
    http.Response response = await http.get(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
      return response.body;
    }
    return '';
  }
}
