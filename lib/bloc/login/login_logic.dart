//Clase adstracta--> No podemos extender en otra clase
import 'package:flutter/cupertino.dart';
import 'package:g_ambientes/bloc/login/login_bloc.dart';
import 'package:g_ambientes/models/users.dart';

abstract class LoginLogic {
  //Stream --> Caminos que recorre login
   Stream<LoginState> LoginIn({@required String email, @required String password});
   Stream<LoginState> LoginRegister({@required String email, @required String password});
   Stream<LoginState> LoginRecoveryPassword({@required String email});
}

class LoginLogicInit implements LoginLogic {
  @override
  Stream<LoginState> LoginIn({String email, String password}) async* {
    try {
      yield LoginLoadingState(
          msg: 'Validando información'); //yield-->Retorna y manda un mensaje
      print('Cargando'); // Para que se vea en consola
      //Verificar si es correcto
      if (email == 'admin@sena.edu.co' && password == '123') {
        yield LoginSuccessLogInState(res: true);
        print('ok'); // Para que se vea en consola
      } else {
        yield LoginFailureLogInState(msg: 'Por favor verifique sus datos.');
        print('No'); // Para que se vea en consola
      }
    } catch (e) {
      yield LoginFailureLogInState(msg: e);
    }
  }

  @override
  Stream<LoginState> LoginRegister({String email, String password}) async* {
    try {
      yield LoginLoadingState(
          msg: 'Validando información'); //yield-->Retorna y manda un mensaje
      print('Cargando'); // Para que se vea en consola
      //Verificar si es correcto
      if (email == 'yvpajoy7@misena.edu.co' && password == '123456') {
        yield LoginSuccessRegisterState(user: Users());
        print('ok'); // Para que se vea en consola
      } else {
        yield LoginFailureLogInState(msg: 'Por favor verifique sus datos.');
        print('No'); // Para que se vea en consola
      }
    } catch (e) {
      yield LoginFailureLogInState(msg: e);
    }
  }

  @override
  Stream<LoginState> LoginRecoveryPassword({String email}) async* {
    try {
      yield LoginLoadingState(msg: 'Enviando información');
      //final bool response = Api().recoveryPassword(email: email); //Como aún no esta conectado con un servidor se tacha
      final bool response = true;
      if (response != null) {
        if (response) {
          yield LoginSuccessRecoveryPasswordState(msg: 'Verifique su correo');
        }
        {
          yield LoginFailureRecoveryPasswordState(
              msg: 'No se encuentra registrado');
        }
      } else {
        yield LoginFailureRecoveryPasswordState(
            msg: 'Por favor intente más tarde');
      }
    } catch (e) {
      yield LoginFailureRecoveryPasswordState(msg: 'Error en la conexión');
    }
  }
}