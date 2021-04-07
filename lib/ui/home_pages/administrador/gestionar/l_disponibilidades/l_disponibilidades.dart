import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/gestionar/disponibilidad_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/gestionar_general/gestionar.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/detalles_disponibilidad.dart';
import 'package:g_ambientes/ui/home_pages/administrador/gestionar/l_disponibilidades/formulario_disponibilidad.dart';

class Disponibilidad extends StatefulWidget{
  const Disponibilidad({Key key}):super(key:key);
  static final nombrePagina = "Actividades";

  static final List<Map<String, dynamic>> disponibilidades = [
    {
      'Actividad':"Disponible",
      'Estado':true,
    },
    {
      'Actividad':"Ocupado",
      'Estado':true,
    },
  ];

  @override
  _DisponibilidadState createState() => _DisponibilidadState();
}

class _DisponibilidadState extends State<Disponibilidad> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 148, 94, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios,
                  color: Color.fromRGBO(247, 148, 94, 1.0),
                  size: 33,),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Gestionar()));
                },
              ),
              SizedBox(width: 99,),
              Text('ACTIVIDADES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.brown),),
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
                child: (DisponibilidadProvider().actividades.isNotEmpty) ?ListView(
                  children: _crearItem(context),
                ):
                Center(
                  child: Text("No hay actividades agregadas"),
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
        onPressed: () => Navigator.pushNamed(context, FormularioDisponibilidad.nombrePagina),
        child: Icon(Icons.add, color: Color.fromRGBO(247, 148, 94, 1.0)),
      ),
    );
  }

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];

    for(Map<String, dynamic> disponibilidad in DisponibilidadProvider().actividades){
      Widget item = ListTile(
        onTap: () => Navigator.pushNamed(context, DetallesDisponibilidad.nombrePagina, arguments: disponibilidad),
        title: Text("${disponibilidad['Actividad']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
        trailing: (disponibilidad['Estado'])?Icon(Icons.star, color: Colors.brown,):Icon(Icons.star_border, color: Colors.brown,),
      );
      temporal.add(item);
    }
    return temporal;
  }
}