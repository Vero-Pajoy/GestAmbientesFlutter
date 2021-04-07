part of 'login_bloc.dart';

//LoginEvent --> Es quien arranca o ejecuta la vista de Login
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  get password => null;
  get email => null;
}

//SE CREA EL EVENTO LOGIN PARA LAS ACCIONES
class LoginLogInEvent extends LoginEvent{
  final String email;
  final String password;

  LoginLogInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

//REGISTRAR USUARIO PARA QUE INICIE SESIÓN
class LoginRegisterEvent extends LoginEvent{
  final String email, password;

  LoginRegisterEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

//RECUPERAR CONTRASEÑA
class LoginRecoveryPasswordEvent extends LoginEvent{
  final String email;

  LoginRecoveryPasswordEvent({@required this.email});

  @override
  List<Object> get props => [email];
}