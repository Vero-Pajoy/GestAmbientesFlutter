import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/registros/administradores_provider.dart';

import 'formulario_administradores.dart';

class DetallesAdministrador extends StatelessWidget{
  const DetallesAdministrador({Key key}): super(key:key);

  static final nombrePagina = "Detalles del administrador";

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> administrador = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
        actions: [
          Row(
            children: [SizedBox(width: 20,),
              SizedBox(width: 100,),
              Text('DETALLES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
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
            flex: 10,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children:<Widget> [
                  SizedBox(height: 40,),
                  Text('' + "${administrador['Tipo de persona']}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Container(height: 3, color: Colors.orangeAccent, margin: EdgeInsets.only(left: 120, right: 120),),SizedBox(height: 40,),

                  Text('Nombres: ',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${administrador['Nombres']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Tipo de identidad: ',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${administrador['Tipo de identidad']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Número de identidad: ',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${administrador['Número de identidad']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),

                  Text('Télefono celular: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${administrador['Télefono celular']}",
                    style: TextStyle(fontSize: 20, color: Colors.brown,),),

                  Text('Correo: ',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Text("${administrador['Correo']}", style: TextStyle(fontSize: 20, color: Colors.brown,),),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget> [
                  RaisedButton(
                    elevation: 8,
                    textColor: Colors.brown,
                    color: Colors.white,
                    onPressed: (){
                      AdministradoresProvider().terminarAdministrador(administrador);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.close_fullscreen),SizedBox(width: 5,),
                        Text("Terminar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  RaisedButton(
                    elevation: 8,
                    textColor: Colors.brown,
                    color: Colors.white,
                    onPressed: () =>Navigator.pushNamed(context, FormularioAdministradores.nombrePagina, arguments: administrador),
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined),SizedBox(width: 5,),
                        Text("Editar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  RaisedButton(
                      elevation: 8,
                      textColor: Colors.brown,
                      color: Colors.white,
                      onPressed: (){
                        AdministradoresProvider().eliminarAdministrador(administrador);
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.remove_circle_outline),SizedBox(width: 5,),
                          Text("Eliminar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}