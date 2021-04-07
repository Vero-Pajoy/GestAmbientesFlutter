import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/fichas/fichas_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/asignar/formulario_fichas.dart';

class ModificarPerfil extends StatelessWidget{
  const ModificarPerfil({Key key}):super(key:key);
  static final nombrePagina = "Perfil";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('PERFIL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 150,),
              CircleAvatar(
                backgroundColor: Colors.white54,
                child: Image.asset('assets/logo/portada.png'),
              ),SizedBox(width: 20,),
            ],
          ),
        ],
      ),
      body: Column(
          children: [
            Expanded(
              flex: 12,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                    padding: const EdgeInsets.only(top: 40),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50, left: 50),
                            child: Column(
                              children: [
                                Text("Coordinador académico",style:TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown
                                ),),
                                Divider(height: 20, color: Colors.orangeAccent,),
                                SizedBox(height: 20,),
                                Text("Nombres:  Harol Rosero",style:TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown
                                ),),SizedBox(height: 20,),
                                Text("     CC:  56865785",style:TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown
                                ),),SizedBox(height: 20,),
                                Text("  Celular:  3207869809",style:TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined),SizedBox(width: 5,),
                          Text("Editar", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}