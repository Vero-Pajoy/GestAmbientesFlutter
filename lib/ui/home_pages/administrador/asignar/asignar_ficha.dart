import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/fichas/fichas_provider.dart';
import 'detalles_ficha.dart';
import 'formulario_fichas.dart';

class AsignarFicha extends StatefulWidget{
  const AsignarFicha({Key key}):super(key:key);
  static final nombrePagina = "Asignar Ficha";

  static final List<Map<String, dynamic>> fichas = [
    {
      'Ficha':"1966722",
      'Jefe': "Jeison Solarte",
      'Ambiente': "Software  1",
      'Estado':true,
    },
    {
      'Ficha':"1966763",
      'Jefe': "Martin Velasco",
      'Ambiente': "Software 2",
      'Estado': true,
    },
    {
      'Ficha':"1865743",
      'Jefe': "Maria Ordoñes",
      'Ambiente': "Archivo 1",
      'Estado': false,
    },
  ];

  @override
  _AsignarFichaState createState() => _AsignarFichaState();
}

class _AsignarFichaState extends State<AsignarFicha> {
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
              SizedBox(width: 99,),
              Text('ASIGNAR FICHA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
              SizedBox(width: 88,),
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
            flex: 11,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: (FichasProvider().fichas.isNotEmpty) ?ListView(
                children: _crearItem(context),
              ):
              Center(
                child: Text("No hay fichas agregadas"),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, FormularioFichas.nombrePagina),
          child: Icon(Icons.add, color: Color.fromRGBO(247, 148, 94, 1.0)),
      ),
    );
  }

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];

    for(Map<String, dynamic> ficha in FichasProvider().fichas){
      Widget item = ListTile(
        onTap: () => Navigator.pushNamed(context, DetallesFicha.nombrePagina, arguments: ficha),
        title: Text("${ficha['Ficha']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
        trailing: (ficha['Estado'])?Icon(Icons.star, color: Colors.brown,):Icon(Icons.star_border, color: Colors.brown,),
      );
      temporal.add(item);
    }
    return temporal;
  }
}