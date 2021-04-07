import 'package:flutter/material.dart';
import 'package:g_ambientes/ui/home/home_screen.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/l_disponibilidades.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_generos/l_generos.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_roles/l_roles.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_tipos_identidad/l_tipos_identidad.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_tipos_personas/l_tipos_personas.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_tipos_rh/l_tipos_rh.dart';

class Gestionar extends StatelessWidget{
  const Gestionar({Key key}): super(key:key);

  static final nombrePagina = "Gestionar";

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
              //Text('GESTIONAR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
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
                    padding: const EdgeInsets.only(top: 20, right: 140, left: 20),
                    child: Container(
                      height: constraints.maxHeight*0.7,
                      width: constraints.maxWidth*0.9,
                      decoration: BoxDecoration(
                        color: myColors[WHITE],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(110),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                  Text('Listar modalidades', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                  Text('Listar jornadas', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                  Text('Listar ubicaciones', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                  Text('Listar sedes', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
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
            flex: 7,
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 20, bottom: 20),
                          child: Container(
                            height: constraints.maxHeight*0.99,
                            width: constraints.maxWidth*0.9,
                            decoration: BoxDecoration(
                              color: myColors[WHITE],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(110),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlatButton(
                                    /*onPressed: () {
                                      Navigator.pushNamed(context, Disponibilidad.nombrePagina);
                                    },*/
                                    child: Row(
                                      children: [
                                        Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                        Text('Listar disponibilidad de ambientes', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                      ],
                                    ),
                                  ),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, Roles.nombrePagina);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                          Text('Listar roles de usuarios', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                        ],
                                      )),
                                  FlatButton(
                                    onPressed: () => Navigator.pushNamed(context, TiposPersonas.nombrePagina),
                                    child: Row(
                                      children: [
                                        Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                        Text('Listar tipos de personas', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                      ],
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () => Navigator.pushNamed(context, TiposIdentidad.nombrePagina),
                                    child: Row(
                                      children: [
                                        Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                        Text('Listar tipos de identidad', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                      ],
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () => Navigator.pushNamed(context, TiposRH.nombrePagina),
                                    child: Row(
                                      children: [
                                        Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                        Text('Listar tipos de RH', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
                                      ],
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () => Navigator.pushNamed(context, Generos.nombrePagina),
                                    child: Row(
                                      children: [
                                        Icon(Icons.scatter_plot, color: Color.fromRGBO(247, 148, 94, 1.0), size: 23,),SizedBox(width: 4,),
                                        Text('Listar géneros', style: TextStyle(color: Color.fromRGBO(247, 148, 94, 1.0), fontWeight: FontWeight.bold, fontSize: 23),),
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