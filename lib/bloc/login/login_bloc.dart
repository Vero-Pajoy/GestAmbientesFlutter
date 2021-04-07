import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:g_ambientes/bloc/login/login_logic.dart';
import 'package:g_ambientes/models/users.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;

  LoginBloc({@required this.logic}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState( //Mapea los eventos a estados
    LoginEvent event,
  ) async* {
    if(event is LoginLogInEvent) {
      yield* logic.LoginIn(email: event.email, password: event.password);
    }else if (event is LoginRegisterEvent) {
      yield* logic.LoginRegister(email: event.email, password: event.password);
    }else if (event is LoginRecoveryPasswordEvent){
      yield* logic.LoginRecoveryPassword(email: event.email);

      //Retorna el estado pertinente (estado inicial)
    }else{
      yield LoginInitial(); //yield-->Retorna
    }
  }
}
