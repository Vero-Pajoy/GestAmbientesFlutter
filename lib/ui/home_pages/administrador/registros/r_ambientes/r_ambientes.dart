import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_ambientes/provider/registros/ambientes_provider.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/detalles_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/r_ambientes/formulario_ambientes.dart';
import 'package:g_ambientes/ui/home_pages/administrador/registros/registros_general/registros.dart';

class Ambientes extends StatefulWidget{
  const Ambientes({Key key}):super(key:key);
  static final nombrePagina = "Ambientes";

  static final List<Map<String, dynamic>> ambientes = [
    {
      'Nombre':"Sofware 1",
      'Capacidad': "30",
      'Ubicación': "Primer piso",
      'Sede':"Centro",
      'Disponibilidad': "Ocupado",
      'Estado':true,
    },
    {
      'Nombre':"Sofware 2",
      'Capacidad': "30",
      'Ubicación': "Primer piso",
      'Sede':"Centro",
      'Disponibilidad': "Disponible",
      'Estado':true,
    },
    {
      'Nombre':"Archivo 1",
      'Capacidad': "30",
      'Ubicación': "Segundo piso",
      'Sede':"Centro",
      'Disponibilidad': "Ocupado",
      'Estado':false,
    },
  ];

  @override
  _AmbientesState createState() => _AmbientesState();
}

class _AmbientesState extends State<Ambientes> {
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
              SizedBox(width: 110,),
              Text('AMBIENTES', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromRGBO(247, 148, 94, 1.0)
                )),
              SizedBox(width: 110,),
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
                child: (AmbientesProvider().ambientes.isNotEmpty) ?ListView(
                  children: _crearItem(context),
                ):
                Center(
                  child: Text("No hay ambientes agregados"),
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
        onPressed: () => Navigator.pushNamed(context, FormularioAmbientes.nombrePagina),
        child: Icon(Icons.add, color: Color.fromRGBO(247, 148, 94, 1.0)),
      ),
    );
  }

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];

    for(Map<String, dynamic> ambiente in AmbientesProvider().ambientes){
      Widget item = ListTile(
        onTap: () => {
          Navigator.pushNamed(context, DetallesAmbiente.nombrePagina, arguments: ambiente),
        },
        title: Text("${ambiente['Nombre']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
        trailing: (ambiente['Estado'])?Icon(Icons.star, color: Colors.brown,):Icon(Icons.star_border, color: Colors.brown,),
      );
      temporal.add(item);
    }
    return temporal;
  }
}