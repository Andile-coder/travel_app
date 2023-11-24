import 'package:equatable/equatable.dart';
import 'package:travel_app/models/data_model.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  final List<DataModel> places;
  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitState {
  final DataModel place;
  DetailState(this.place);

  @override
  List<Object> get props => [place];
}
