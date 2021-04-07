import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Roles extends StatelessWidget{
  const Roles({Key key}):super(key:key);
  static final nombrePagina = "Actividades";

  static final List<Map<String, dynamic>> roles = [
    {
      'Rol':"Administrador",
      'Estado':true,
    },
    {
      'Rol':"Cuentadante",
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
              SizedBox(width: 60,),
              Text('ROLES ADMINISTRATIVOS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 40,),
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

    for(Map<String, dynamic> rol in roles){
      Widget item = ListTile(
        title: Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text("${rol['Rol']}",style:TextStyle(
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