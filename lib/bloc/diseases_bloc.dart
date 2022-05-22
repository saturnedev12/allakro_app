import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/repository/disease_repository.dart';
import 'package:bloc/bloc.dart';

import '../models/response_model.dart';
import '../repository/actuality_repository.dart';

class DiseasesBloc extends Cubit<StateApp> {
  DiseasesBloc() : super(InitialState());

  getActualities() async {
    emit(PendingState());
    List<DiseaseModel> _data = await DiseaseRepository().getAllDiseases();
    emit(ReadyState<DiseaseModel>(data: _data));
  }

  delete({required int id}) async {
    emit(PendingState());
    ResponseModel _data = await DiseaseRepository().delete(id);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  create({required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data = await DiseaseRepository().create(body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  update({required int id, required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data = await DiseaseRepository().update(id: id, body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }
}
