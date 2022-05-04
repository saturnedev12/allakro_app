import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/repository/actuality_repository.dart';

void main(List<String> args) async {
  var data = await ActualityRepository().getAllActuality();
  print(data);
}
