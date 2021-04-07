import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_ambientes/bloc/login/login_bloc.dart';
import 'package:g_ambientes/ui/home/home_screen.dart';

//Stateful widgets -->widgets dinámicos.
//Éstos pueden sufrir cambios debidos seguramente a una acción del usuario.
//Ejemplo: TextField, porque el usuario puede escribir sobre él y por tanto cambiarlo.
//Este tipo de widgets tienen un objeto «State» asociado para gestionar su estado.
class LoginScreen extends StatefulWidget {
  //LoginScreen (Pantalla de inicio de sesión)
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc; //Intancia de LoginBloc
  TextEditingController emailConroller;
  TextEditingController passwordConroller;

  //Ver cambio de la pantalla, después del estado inicial o controlar acciones.
  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    emailConroller = TextEditingController(); //Se inicializa el controlador
    passwordConroller = TextEditingController(); //Se inicializa el controlador
    super.initState();
  }

  @override
  //Cuando hacemos alguna acción y se quiere renderizar (mostrar proyecto final) la vista.
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //Scaffold --> Representa toda la vista.
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo/loginFondo.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.15,
              right: size.height *0,
              left: size.height * 0,
              child: Container(
                //Contiene Image Background
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo/loginTitulo.png',
                  height: size.height * 0.33,
                ),
              ),
            ),

            Container(
              child: Positioned(
                //Posición de las diferentes tarjetas (cards)
                top: size.height * 0.48,
                child: Container(
                  //Aquí almacena las tarjetas (cards)
                  width: size.width,
                  child: Padding(
                    //Padding --> Espacio entre el borde de la pantalla y la tarjeta.
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Card(
                          //Segunda tarjeta.
                          color: Colors.white,
                          child: ListTile(
                            subtitle: Column(
                              //mainAxisAlignment --> Alinea de forma uniforme los children.
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20),),
                                    color: Colors.orangeAccent.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.email),
                                        hintText: 'Correo electrónico',
                                        border: InputBorder.none,
                                      ),
                                      //TextField --> Campo de texto que crea un input para la captura de datos.
                                      onTap: () {},
                                      keyboardType: TextInputType.text, //keyboardType --> Tipo de teclado.
                                      controller: emailConroller, //Le pasamos el controlador
                                    ),
                                  ),
                                ),SizedBox(height: 15,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.orangeAccent.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.visibility),
                                        //buildTextField("Contraseña"),
                                        hintText: 'Contraseña',
                                        border: InputBorder.none,
                                      ),
                                      //TextField --> Campo de texto que crea un input para la captura de datos.
                                      onTap: () {},
                                      keyboardType: TextInputType.text, //keyboardType --> Tipo de teclado.
                                      controller: passwordConroller, //Le pasamos el controlador
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                BlocListener<LoginBloc, LoginState>(
                                  listener: (context, state){
                                    if(state is LoginInitial){}
                                    if(state is LoginLoadingState){}
                                    if(state is LoginSuccessLogInState){ //Se devuelve (redirecciona) a la página de Home
                                      Navigator.of(context) //Devuelve el sistema a la ruta que se eliga.
                                          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
                                    }
                                    if (state is LoginFailureLogInState) {
                                      mostrarAlerta(context, state);
                                    }
                                    if(state is LoginFailureRecoveryPasswordState){
                                      print('Verifique su correo');
                                    }
                                  },
                                  child: BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                        //BlocBuilder-->Se implementa el patron bloc
                                        if (state is LoginLoadingState) {
                                          return CircularProgressIndicator();
                                        } else {
                                        return Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20),),
                                            color: Colors.brown.withOpacity(0.6),),
                                          child: FlatButton(
                                              onPressed: () {
                                                _doLogin(); //Método _doLogin
                                              },
                                              child: Text( 'Ingresar',
                                                style: TextStyle(fontSize: 18),)),
                                        );}
                                      })
                                )
                              ]
                            ),
                          ),
                        ),
                        SizedBox(height: 110,),
                        Card(
                          //Tercer tarjeta.
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              '¿Se te olvido la contraseña? \n',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Expanded(
                              child: Row(
                                //mainAxisAlignment --> Alinea de forma uniforme los children.
                                //.spaceBetween --> Colcamos el espacio libre uniformemente entre los children.
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /*Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8),),
                                      color: Colors.brown[200],),
                                    child: FlatButton(
                                      color: Colors.grey.withOpacity(0.3),
                                      onPressed: () {
                                        _doRegister();
                                      },
                                      child: Text(
                                        'Registarse',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),*/
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8),),),
                                    child: Center(
                                      child: RaisedButton(
                                        color: Colors.brown[200],
                                          child: Text('Recuperar contraseña', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                          elevation: 8,
                                          textColor: Colors.white,
                                          onPressed:() {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context)=>AlertDialog(
                                                content: TextField(
                                                  decoration: InputDecoration(
                                                    icon: Icon(Icons.email),
                                                    hintText: 'Dígite un correo electronico',
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                                actions: [
                                                  FlatButton(
                                                    onPressed: (){
                                                      Navigator.of(context).pop('Ok');
                                                    },
                                                    child: Text('Ok', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],//children
        ),
      ),
    );
  }

  void _doLogin() { //Método hacer ingreso
    loginBloc.add(LoginLogInEvent(
        email: emailConroller.value.text,
        password: passwordConroller.value.text));
  }

  void _doRegister() { //Método hacer registro
    loginBloc.add(LoginRegisterEvent(
        email: emailConroller.value.text,
        password: passwordConroller.value.text));
  }

  void mostrarAlerta(BuildContext context, LoginState state) async { //Método de mostrar alerta
    bool shouldUpdate = await showDialog(
      builder: (context) => new AlertDialog(
        content: new FlatButton(
            child: new Text(state.props.first),
          onPressed: () => Navigator.pop(context, true),
        ),
      ), context: this.context
    );
  }
}

