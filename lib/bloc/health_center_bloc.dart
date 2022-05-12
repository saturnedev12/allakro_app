import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/models/health_center_model.dart';
import 'package:allakroapp/repository/disease_repository.dart';
import 'package:allakroapp/repository/heath_center_repository.dart';
import 'package:bloc/bloc.dart';

class HealthCenterBloc extends Cubit<StateApp> {
  HealthCenterBloc() : super(InitialState());

  getHealthCenter() async {
    emit(PendingState());
    List<HealthCenterModel> _data =
        await HeathCenterRepository().getHealthCenter();
    emit(ReadyState<HealthCenterModel>(data: _data));
  }
}
