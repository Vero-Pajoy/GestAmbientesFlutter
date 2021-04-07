import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/gestionar/disponibilidad_provider.dart';

import 'formulario_disponibilidad.dart';

class DetallesDisponibilidad extends StatelessWidget{
  const DetallesDisponibilidad({Key key}): super(key:key);

  static final nombrePagina = "Detalles de actividades";

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> actividad = ModalRoute.of(context).settings.arguments;
    
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
                  Text('Actividad: ' + "${actividad['Actividad']}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown,),),
                  Container(height: 3, color: Colors.orangeAccent, margin: EdgeInsets.only(left: 100, right: 100),),SizedBox(height: 40,),
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
                      DisponibilidadProvider().terminarActividad(actividad);
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
                    onPressed: () =>Navigator.pushNamed(context, FormularioDisponibilidad.nombrePagina, arguments: actividad),
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
                        DisponibilidadProvider().eliminarActividad(actividad);
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