import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/models/domicile_model.dart';
import 'package:allakroapp/providers/domiciles_provider.dart';
import 'package:allakroapp/repository/disease_repository.dart';
import 'package:allakroapp/repository/domicile_repository.dart';
import 'package:bloc/bloc.dart';

import '../models/response_model.dart';

class DomicileBloc extends Cubit<StateApp> {
  DomicileBloc() : super(InitialState());

  getActualities() async {
    emit(PendingState());
    List<DomicileModel> _data = await DomicileRepository().getAllDomicile();
    emit(ReadyState<DomicileModel>(data: _data));
  }

  delete({required int id}) async {
    emit(PendingState());
    ResponseModel _data = await DomicileRepository().delete(id);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  create({required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data = await DomicileRepository().create(body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  update({required int id, required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data = await DomicileRepository().update(id: id, body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }
}
