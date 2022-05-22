import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/models/health_center_model.dart';
import 'package:allakroapp/repository/disease_repository.dart';
import 'package:allakroapp/repository/heath_center_repository.dart';
import 'package:bloc/bloc.dart';

import '../models/response_model.dart';
import '../repository/actuality_repository.dart';

class HealthCenterBloc extends Cubit<StateApp> {
  HealthCenterBloc() : super(InitialState());

  getHealthCenter() async {
    emit(PendingState());
    List<HealthCenterModel> _data =
        await HeathCenterRepository().getHealthCenter();
    emit(ReadyState<HealthCenterModel>(data: _data));
  }

  delete({required int id}) async {
    emit(PendingState());
    ResponseModel _data = await HeathCenterRepository().delete(id);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  create({required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data = await HeathCenterRepository().create(body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  update({required int id, required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data =
        await HeathCenterRepository().update(id: id, body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }
}
