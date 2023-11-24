import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitState> {
  final DataServices data;
  late final places;
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      Future.delayed(Duration(seconds: 2), () {
        emit(LoadedState(places));
      });
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
