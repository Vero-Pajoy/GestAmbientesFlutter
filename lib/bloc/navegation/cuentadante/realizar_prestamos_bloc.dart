import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'realizar_prestamos_event.dart';
part 'realizar_prestamos_state.dart';

class RealizarPrestamosBloc extends Bloc<RealizarPrestamosEvent, RealizarPrestamosState> {
  RealizarPrestamosBloc() : super(RealizarPrestamosInitial());

  @override
  Stream<RealizarPrestamosState> mapEventToState(
    RealizarPrestamosEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
