import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_ambientes/bloc/login/login_bloc.dart';
import 'package:g_ambientes/bloc/login/login_logic.dart';
import 'package:g_ambientes/bloc/respuestaApi/respuesta_api_bloc.dart';
import 'package:g_ambientes/ui/api_clima/api_clima.dart';
import 'package:g_ambientes/ui/home_pages/administrador/asignar/asignar_ficha.dart';
import 'package:g_ambientes/ui/home_pages/administrador/asignar/detalles_ficha.dart';
import 'package:g_ambientes/ui/home_pages/administrador/asignar/formulario_fichas.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/gestionar_general/gestionar.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/detalles_disponibilidad.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/formulario_disponibilidad.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/l_disponibilidades.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_generos/l_generos.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_roles/l_roles.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_tipos_identidad/l_tipos_identidad.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_tipos_personas/l_tipos_personas.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_tipos_rh/l_tipos_rh.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_administradores/detalles_administradores.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_administradores/formulario_administradores.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_administradores/r_administradores.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/detalles_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/formulario_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/r_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_cuentadantes/detalles_cuentadantes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_cuentadantes/formulario_cuentadantes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_cuentadantes/r_cuentadantes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/registros_general/registros.dart';
import 'package:g_ambientes/ui/login/login_screen.dart';
import 'package:g_ambientes/ui/perfil/cerrar_sesion.dart';
import 'package:g_ambientes/ui/perfil/credenciales.dart';
import 'package:g_ambientes/ui/perfil/modificar_perfil.dart';
import 'package:g_ambientes/ui/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

//Stateless widget --> Es estático, es decir, no va a sufrir ningún cambio.
//Por ejemplo un texto, un icono… en principio son widgets que van a ser
//pintados en la pantalla y así se van a quedar, sin que ninguna acción del usuario los altere.
class MyApp extends StatelessWidget {
  @override
  //Build --> Este método es el encargado de devolver lo que se va a pintar, es decir, un widget.
  //BuildContext --> es nada más que una referencia a la ubicación de un Widget dentro de la
  //estructura de árbol de todos los Widgets que se construyen.
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [ //Define los bloc que se utilizaran dentro de la app como proveedor
          BlocProvider(create: (context){
            return LoginBloc(logic: LoginLogicInit()); //LoginBloc --> Se llama como un proveedor de Bloc dentro de la app
          }),
          BlocProvider(create: (context){
            return RespuestaApiBloc();
          }),
        ], //GestureDetector --> Sirve para esconder el teclado cuando se hace tap en cualquier lado de la pantalla

        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false, //Permite proporsionar información adicional.
            title: 'Sistemas SiOGAs',
            //ThemeData --> Deja definir y usar de manera global ciertos colores y estilos
            //de manera global en nuestra app.
            theme: ThemeData(
              primarySwatch: Colors.brown, //Muestra primaria de colores, es decir diferentes tonos de colores.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashScreen(),
            routes: <String, WidgetBuilder>{
              '/login_screen': (BuildContext context) => new LoginScreen(),
              RespuestaApiUi.nombrePagina: (BuildContext context) => new RespuestaApiUi(),

              ModificarPerfil.nombrePagina: (BuildContext context) => new ModificarPerfil(),
              Credenciales.nombrePagina: (BuildContext context) => new Credenciales(),
              '/cerrar_sesion': (BuildContext context) => new CerrarSesion(),

              AsignarFicha.nombrePagina: (BuildContext context) => new AsignarFicha(),
              FormularioFichas.nombrePagina: (BuildContext context) => new FormularioFichas(),
              DetallesFicha.nombrePagina: (BuildContext context) => new DetallesFicha(),

              Registros.nombrePagina: (BuildContext context) => new Registros(),

              Administradores.nombrePagina: (BuildContext context) => new Administradores(),
              FormularioAdministradores.nombrePagina: (BuildContext context) => new FormularioAdministradores(),
              DetallesAdministrador.nombrePagina: (BuildContext context) => new DetallesAdministrador(),

              Ambientes.nombrePagina: (BuildContext context) => new Ambientes(),
              FormularioAmbientes.nombrePagina: (BuildContext context) => new FormularioAmbientes(),
              DetallesAmbiente.nombrePagina: (BuildContext context) => new DetallesAmbiente(),

              Cuentadantes.nombrePagina: (BuildContext context) => new Cuentadantes(),
              FormularioCuentadantes.nombrePagina: (BuildContext context) => new FormularioCuentadantes(),
              DetallesCuentadantes.nombrePagina: (BuildContext context) => new DetallesCuentadantes(),

              Gestionar.nombrePagina: (BuildContext context) => new Gestionar(),

              Disponibilidad.nombrePagina: (BuildContext context) => new Disponibilidad(),
              FormularioDisponibilidad.nombrePagina: (BuildContext context) => new FormularioDisponibilidad(),
              DetallesDisponibilidad.nombrePagina: (BuildContext context) => new DetallesDisponibilidad(),

              Roles.nombrePagina: (BuildContext context) => new Roles(),
              TiposRH.nombrePagina: (BuildContext context) => new TiposRH(),
              TiposPersonas.nombrePagina: (BuildContext context) => new TiposPersonas(),
              TiposIdentidad.nombrePagina: (BuildContext context) => new TiposIdentidad(),
              Generos.nombrePagina: (BuildContext context) => new Generos(),
            },
            ),
        )
    ); //MultiBlocProvider
  }
}
