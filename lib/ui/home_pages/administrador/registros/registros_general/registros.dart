import 'package:flutter/material.dart';
import 'package:g_ambientes/ui/home/home_screen.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_administradores/r_administradores.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/r_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_cuentadantes/r_cuentadantes.dart';

class Registros extends StatelessWidget{
  const Registros({Key key}): super(key:key);

  static final nombrePagina = "Registros";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
        actions: [
          Row(
            children: [SizedBox(width: 20,),
              SizedBox(width: 100,),
              //Text('REGISTROS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
              SizedBox(width: 120,),
              CircleAvatar(
                backgroundColor: Colors.white54,
                child: Image.asset('assets/logo/portada.png'),
              ),SizedBox(width: 30,),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, right: 120),
                    child: Container(
                      height: constraints.maxHeight*0.9,
                      width: constraints.maxWidth*0.9,
                      decoration: BoxDecoration(
                        color: myColors[WHITE],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(120),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Ambientes.nombrePagina);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.app_registration, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                    Text('Registrar ambientes', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                  ],
                                )),
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.app_registration, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                  Text('Registrar programas', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                ],
                              ),
                            ),
                            FlatButton(
                              /*onPressed: () {
                                Navigator.pushNamed(context, Administradores.nombrePagina);
                              },*/
                              child: Row(
                                children: [
                                  Icon(Icons.app_registration, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                  Text('Registrar administradores', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                ],
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
          Expanded(
            flex: 6,
              child: Column(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 130, right: 20),
                            child: Container(
                              height: constraints.maxHeight*0.94,
                              width: constraints.maxWidth*0.9,
                              decoration: BoxDecoration(
                                color: myColors[WHITE],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(120),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, Cuentadantes.nombrePagina);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.app_registration, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                            Text('Registrar cuentadantes', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                          ],
                                        )),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.app_registration, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                          Text('Registrar instructores', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                        ],
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.app_registration, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                          Text('Registrar aprendices', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                        ],
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
                ],
              ),
          ),
        ],
      ),
    );
  }
}