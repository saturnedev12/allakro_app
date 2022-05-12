import 'package:allakroapp/bloc/states.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/models/disease_model.dart';
import 'package:allakroapp/repository/disease_repository.dart';
import 'package:bloc/bloc.dart';

class DiseasesBloc extends Cubit<StateApp> {
  DiseasesBloc() : super(InitialState());

  getActualities() async {
    emit(PendingState());
    List<DiseaseModel> _data = await DiseaseRepository().getAllDiseases();
    emit(ReadyState<DiseaseModel>(data: _data));
  }
}
