import 'package:allakroapp/providers/activity_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/disease_provider.dart';
import 'package:test/test.dart';

void main(List<String> args) async {
  //print(await ActualityProvider().fetchAll());

  test('Fetch actuality test', () async {
    Map<String, dynamic> _data;
    print('fetch all');
    _data = await ActualityProvider().fetchAll();
    //print(data);
    expect(_data['status'], 'OK');
    print('fetch one');
    _data = await ActualityProvider().fetchOne(id: 2);
    expect(_data['status'], 'OK');
  });

  test('Fetch activity test', () async {
    Map<String, dynamic> _data;
    print('fetch all');
    _data = await ActivityProvider().fetchAll();
    //print(data);
    expect(_data['status'], 'OK');
    print('fetch one');
    _data = await ActivityProvider().fetchOne(id: 2);
    expect(_data['status'], 'OK');
  });

  test('Fetch diseases test', () async {
    Map<String, dynamic> _data;
    print('fetch all');
    _data = await DiseasesProvider().fetchAll();
    //print(data);
    expect(_data['status'], 'OK');
    print('fetch one');
    _data = await DiseasesProvider().fetchOne(id: 2);
    expect(_data['status'], 'OK');
  });
}
