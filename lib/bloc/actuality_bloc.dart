import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/repository/actuality_repository.dart';
import 'package:bloc/bloc.dart';

class ActualityBloc extends Cubit<StateApp> {
  ActualityBloc() : super(InitialState());

  getActualities() async {
    emit(PendingState());
    List<ActualityModel> _data = await ActualityRepository().getAllActuality();
    emit(ReadyState<ActualityModel>(data: _data));
  }
}
