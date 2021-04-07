import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:g_ambientes/ui/login/login_screen.dart';
import 'package:g_ambientes/ui/home/home_screen.dart';

//Stateful widgets --> widgets dinámicos.
//Éstos pueden sufrir cambios debidos seguramente a una acción del usuario.
//Ejemplo: TextField, porque el usuario puede escribir sobre él y por tanto cambiarlo.
//Este tipo de widgets tienen un objeto «State» asociado para gestionar su estado.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _color = Colors.white;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), (){ //Tiempo de transacción a LoginScreen
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
    super.initState();
  }

  @override
  void setState(fn) { //Permite reiniciar las vistas de la pantalla según los estados de la app
    super.setState(fn);
  }

  @override
  void dispose() { //Eliminar un estado que ya no se utilice
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo/portada1.png',
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () { //Es un click
                          setState(() { //Refrezca o actualiza la vista a cada instante, para la función changeColor
                            _color = changeColor(_color); //Se le coloca el guión bajo para indicar que es una variable privada
                          });
                        },
                        child: Text('¡¡¡Perseverancia!!!',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                //mainAxisAlignment --> Alinea de forma uniforme los children.
                //.center --> Centra el contenido de la columna verticalmente.
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright,
                    color: Colors.brown,
                  ),
                  Text(
                    'Verónica Pajoy - ADSI',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            )
          ],//children
        ),
      ),
    );
  }

  //Función que nos recibe un color y resibe un color
  Color changeColor(Color color) {
    if (color == Colors.white) {
      return color = Colors.deepOrange;
    } else {
      return color = Colors.white;
    }
  }
}
