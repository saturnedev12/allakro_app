import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/response_model.dart';
import 'package:allakroapp/repository/actuality_repository.dart';
import 'package:bloc/bloc.dart';

class ActualityBloc extends Cubit<StateApp> {
  ActualityBloc() : super(InitialState());

  getActualities() async {
    emit(PendingState());
    List<ActualityModel> _data = await ActualityRepository().getAllActuality();
    emit(ReadyState<ActualityModel>(data: _data));
  }

  delete({required int id}) async {
    emit(PendingState());
    ResponseModel _data = await ActualityRepository().delete(id);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  create({required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data = await ActualityRepository().create(body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }

  update({required int id, required Map<String, dynamic> body}) async {
    emit(PendingState());
    ResponseModel _data =
        await ActualityRepository().update(id: id, body: body);
    emit(ReadyStateOne<ResponseModel>(data: _data));
  }
}
