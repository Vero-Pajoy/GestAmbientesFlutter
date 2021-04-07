import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/registros/cuentadantes_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/registros_general/registros.dart';

import 'detalles_cuentadantes.dart';
import 'formulario_cuentadantes.dart';


class Cuentadantes extends StatefulWidget{
  const Cuentadantes({Key key}):super(key:key);
  static final nombrePagina = "Cuentadantes";

  static final List<Map<String, dynamic>> cuentadantes = [
    {
      'Tipo de persona':"Coodinador academico",
      'Nombres':"Harold Rosero",
      'Tipo de identidad': "Cédula de ciudadanía",
      'Número de identidad': "43675487",
      'Télefono celular':"320765847",
      'Correo': "roseroh@sena.edu.co",
      'Estado':true,
    },
    {
      'Tipo de persona':"Funcionario",
      'Nombres':"Pedro Manriquez",
      'Tipo de identidad': "Cédula de ciudadanía",
      'Número de identidad': "56476578",
      'Télefono celular':"3124568756",
      'Correo': "manriquep@sena.edu.co",
      'Estado':true,
    },
  ];

  @override
  _CuentadantesState createState() => _CuentadantesState();
}

class _CuentadantesState extends State<Cuentadantes> {
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Registros()));
                },
              ),
              SizedBox(width: 90,),
              Text('CUENTADANTES', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromRGBO(247, 148, 94, 1.0)
              )),
              SizedBox(width: 90,),
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
                child: (CuentadantesProvider().cuentadantes.isNotEmpty) ?ListView(
                  children: _crearItem(context),
                ):
                Center(
                  child: Text("No hay cuentadantes agregados"),
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
        onPressed: () => Navigator.pushNamed(context, FormularioCuentadantes.nombrePagina),
        child: Icon(Icons.add, color: Color.fromRGBO(247, 148, 94, 1.0)),
      ),
    );
  }

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];

    for(Map<String, dynamic> cuentadante in CuentadantesProvider().cuentadantes){
      Widget item = ListTile(
        onTap: () => {
          Navigator.pushNamed(context, DetallesCuentadantes.nombrePagina, arguments: cuentadante),
        },
        title: Text("${cuentadante['Nombres']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
        trailing: (cuentadante['Estado'])?Icon(Icons.star, color: Colors.brown,):Icon(Icons.star_border, color: Colors.brown,),
      );
      Divider(height: 20, color: Colors.orangeAccent,);
      temporal.add(item);
    }
    return temporal;
  }
}