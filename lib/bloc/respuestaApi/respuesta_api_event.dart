part of 'respuesta_api_bloc.dart';

abstract class RespuestaApiEvent extends Equatable {
  const RespuestaApiEvent();
}

class ResApiGetCityByNameEvent extends RespuestaApiEvent{
  final String city;
  ResApiGetCityByNameEvent({@required this.city});
  @override
  List<Object> get props => [city];
}
