part of 'respuesta_api_bloc.dart';

abstract class RespuestaApiState extends Equatable {
  const RespuestaApiState();
}

class RespuestaApiInitial extends RespuestaApiState {
  @override
  List<Object> get props => [];
}

class ResApiLoadingState extends RespuestaApiState{
  @override
  List<Object> get props => throw UnimplementedError();
}

class ResApiSuccessGetCityByNameState extends RespuestaApiState{
  final List<City> city;
  ResApiSuccessGetCityByNameState({@required this.city});
  @override
  List<Object> get props => [city];
}

class ResApiFailureGetCityByNameState extends RespuestaApiState{
  final String msj;
  ResApiFailureGetCityByNameState(this.msj);
  @override
  List<Object> get props => [msj];
}
