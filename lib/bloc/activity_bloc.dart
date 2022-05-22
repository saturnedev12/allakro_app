import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/activity_model.dart';
import 'package:allakroapp/repository/activity_repository.dart';
import 'package:bloc/bloc.dart';

class ActivityBloc extends Cubit<StateApp> {
  ActivityBloc() : super(InitialState());

  getActualities() async {
    emit(PendingState());
    List<ActivityModel> _data = await ActivityRepository().getAllActuality();
    emit(ReadyState<ActivityModel>(data: _data));
  }
}
