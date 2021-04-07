part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

//Segundo estado: Cargando estado de inicio de sesion y de aqui se le hace llegar
//al usuario un mensaje que diga "cargando"
class LoginLoadingState extends LoginState{
  final String msg;

  LoginLoadingState({this.msg});

  @override
  List<Object> get props => [msg];
}

//Tercer estado: Estado de ingreso exitoso
class LoginSuccessLogInState extends LoginState{
  final bool res; //res --> Para decirle si es True o False

  LoginSuccessLogInState({this.res});

  @override
  List<Object> get props => [res];
}

//Cuarto estado: Estado que aunucia un error en el inicio de sesión
class LoginFailureLogInState extends LoginState{
  final String msg;

  LoginFailureLogInState({this.msg});

  @override
  List<Object> get props => [msg];
}

//Estado de registro éxitoso
class LoginSuccessRegisterState extends  LoginState{
  final Users user;

  LoginSuccessRegisterState({@required this.user});

  @override
  List<Object> get props => [user];
}

//Estado de recupar contraseña éxitoso
class LoginSuccessRecoveryPasswordState extends LoginState{
  final String msg;

  LoginSuccessRecoveryPasswordState({@required this.msg});

  @override
  List<Object> get props => [msg];
}

//Estado de fallo en recupar contraseña
class LoginFailureRecoveryPasswordState extends LoginState{
  final String msg;

  LoginFailureRecoveryPasswordState({@required this.msg});

  @override
  List<Object> get props => [msg];
}