import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Generos extends StatelessWidget{
  const Generos({Key key}):super(key:key);
  static final nombrePagina = "Generos";

  static final List<Map<String, dynamic>> generos = [
    {
      'Genero':"Masculino",
      'Estado':true,
    },
    {
      'Genero':"Femenino",
      'Estado':true,
    },
    {
      'Genero':"Otro",
      'Estado':true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
        actions: [
          Row(
            children: [SizedBox(width: 20,),
              SizedBox(width: 20,),
              Text('GÉNEROS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 130,),
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
                  children: _crearItem(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(''),),
            ),
          ]
      ),
    );
  }

  List<Widget> _crearItem() {

    List<Widget> temporal = [];

    for(Map<String, dynamic> genero in generos){
      Widget item = ListTile(
        title: Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text("${genero['Genero']}",style:TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown
                ),),
              ),
              Divider(height: 20, color: Colors.orangeAccent,)
            ],
          ),
        ),
      );
      temporal.add(item);
    }
    return temporal;
  }
}