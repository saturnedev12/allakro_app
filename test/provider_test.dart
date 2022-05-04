import 'package:allakroapp/providers/activity_provider.dart';
import 'package:allakroapp/providers/actors_provider.dart';
import 'package:allakroapp/providers/actuality_provider.dart';
import 'package:allakroapp/providers/disease_provider.dart';
import 'package:allakroapp/providers/domiciles_provider.dart';
import 'package:allakroapp/providers/heatth_center_provider.dart';
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

  test('Fetch domicile test', () async {
    Map<String, dynamic> _data;
    print('fetch all');
    _data = await DomicileProvider().fetchAll();
    //print(data);
    expect(_data['status'], 'OK');
    print('fetch one');
    _data = await DomicileProvider().fetchOne(id: 2);
    expect(_data['status'], 'OK');
  });

  test('Fetch health center test', () async {
    Map<String, dynamic> _data;
    print('fetch all');
    _data = await HealthCenterProvider().fetchAll();
    //print(data);
    expect(_data['status'], 'OK');
    print('fetch one');
    _data = await HealthCenterProvider().fetchOne(id: 2);
    expect(_data['status'], 'OK');
  });

  test('Fetch actor test', () async {
    Map<String, dynamic> _data;
    print('fetch all');
    _data = await ActorProvider().fetchAll(perPage: 2, page: 1);
    //print(data);
    expect(_data['status'], 'OK');
    print('fetch one');
    _data = await ActorProvider().fetchOne(id: 2);
    expect(_data['status'], 'OK');
  });
}
