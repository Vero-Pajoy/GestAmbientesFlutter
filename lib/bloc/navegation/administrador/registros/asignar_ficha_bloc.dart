import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'asignar_ficha_event.dart';
part 'asignar_ficha_state.dart';

class AsignarFichaBloc extends Bloc<AsignarFichaEvent, AsignarFichaState> {
  AsignarFichaBloc() : super(AsignarFichaInitial());

  @override
  Stream<AsignarFichaState> mapEventToState(
    AsignarFichaEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
