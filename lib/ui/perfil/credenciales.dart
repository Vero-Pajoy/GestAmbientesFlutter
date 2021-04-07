import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Credenciales extends StatelessWidget{
  const Credenciales({Key key}):super(key:key);
  static final nombrePagina = "Credenciales";

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
              SizedBox(width: 20,),
              Text('CREDENCIALES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 100,),
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
                              Text("Correo: admin@sena.edu.co",style:TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown
                              ),),SizedBox(height: 20,),
                              Text("Contraseña: 123",style:TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown
                              ),),SizedBox(height: 20,),
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
                child: RaisedButton(
                    child: Text('Actualizar credenciales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    elevation: 8,
                    textColor: Colors.brown,
                    color: Colors.white,
                    onPressed:() {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context)=>AlertDialog(
                          content: Text('Se envio un correo con un enlace para cambiar las credenciales.\n'
                              '\nPor favor revisar.', style: TextStyle(fontSize: 18),),
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
          ]
      ),
    );
  }
}